@GrantSubawardNysed @DirectGrantSubawardBudgetCategoriesNysed @grantUpdateFile3
Feature: Validate all scenarios in the award related to Budget Categories

  @NYSED-3086 @NYSED-3087 @NYSEDSprint-28 @US-NYSED-1867 @M05 @Saranjit @passed
  Scenario Outline:Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Professional Staff Salaries' of award, a detailed line item modal is opened and user can see correct columns: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see "Specific Position/Title" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "# of Positions" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "FTE" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "Additional Cost (e.g., Per Diem, Teacher Stipends)" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "Projected Salary" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "Annualized Rate of Pay" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          |                | 12  | 100                    | 100                                                | 1000             |
    When I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | ee             | 12  | 100                    | 100                                                | 1000             |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 44.5           | 12  | 100                    | 100                                                | 1000             |
    Then I softly see value "445" for title "# of Positions" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | -34            | 12  | 100                    | 100                                                | 1000             |
    Then I softly see the following messages in the page details contains:
      | # of Positions cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 75             | 12  | 100                    | 100                                                | 1000             |
    Then I softly see value "75" for title "# of Positions" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see "Specific Position/Title" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "# of Positions" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "FTE" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "Additional Cost (e.g., Per Diem, Teacher Stipends)" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "Projected Salary" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see "Annualized Rate of Pay" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          |                | 12  | 100                    | 100                                                | 1000             |
    When I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | ee             | 12  | 100                    | 100                                                | 1000             |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 44.5           | 12  | 100                    | 100                                                | 1000             |
    Then I softly see value "445" for title "# of Positions" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | -34            | 12  | 100                    | 100                                                | 1000             |
    Then I softly see the following messages in the page details contains:
      | # of Positions cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 75             | 12  | 100                    | 100                                                | 1000             |
    Then I softly see value "75" for title "# of Positions" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          | 80             |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 80             | 12  | 100                    | 100                                                | 1000             |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3145 @NYSED-3149 @NYSED-3150 @NYSED-3152 @NYSEDSprint-28 @US-NYSED-1867 @Saranjit @M05 @passed
  Scenario Outline:Verify that the grantee user see Supplies and Materials, Award Budget Categories modal, having a 'Unit Cost' column ( Editable, Required, Currency Field without decimal, cannot negative and Blank for new row)
  |Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Supplies and Materials' of award, a detailed line item modal is opened and user can see correct columns: Direct Grant|
  |Verify that the grantee user see Supplies and Materials, Award Budget Categories modal, having a 'Calculation of Cost (if other than Quantity * Unit Cost) ' column ( Editable, Blank for new row, Short text 255 Character and Optional)|
  |Verify that the grantee user see Supplies and Materials, Award Budget Categories modal, having a 'Calculated Proposed Expenditure' column (Not-Editable, Formula Field)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#3149
    Then I softly see "Description of Item/Service" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Calculation of Cost (if other than Quantity * Unit Cost)" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Quantity" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Unit Cost" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Additional Cost" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Calculated Proposed Expenditure" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Proposed Expenditure" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost | Proposed Expenditure |
      | Title                       | 100      |           | 100                  |
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost | Proposed Expenditure |
      | Title                       | 100      | ee        | 100                  |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost | Proposed Expenditure |
      | Title                       | 100      | -100      | 100                  |
    Then I softly see the following messages in the page details contains:
      | Unit Cost cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Calculation of Cost (if other than Quantity * Unit Cost) | Unit Cost | Proposed Expenditure |
      | Title                       | 100      | Calculation                                              | 88.98     | 100                  |
    #3149
    Then I softly see value "$88.98" for title "Unit Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    #3150
    Then I softly see value "Calculation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    #3152
    Then I softly see value "$8,898" for title "Calculated Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I click on "Delete" icon for "Title" inside flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #3149
    Then I softly see "Description of Item/Service" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Calculation of Cost (if other than Quantity * Unit Cost)" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Quantity" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Unit Cost" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Additional Cost" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Calculated Proposed Expenditure" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see "Proposed Expenditure" in flex table header "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost | Proposed Expenditure |
      | Title                       | 100      |           | 100                  |
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost | Proposed Expenditure |
      | Title                       | 100      | ee        | 100                  |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost | Proposed Expenditure |
      | Title                       | 100      | -100      | 100                  |
    Then I softly see the following messages in the page details contains:
      | Unit Cost cannot be negative. |
    And I refresh the page
    And I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Calculation of Cost (if other than Quantity * Unit Cost) | Unit Cost | Proposed Expenditure |
      | Title                       | 100      | Calculation                                              | 88.98     | 100                  |
    #3149
    Then I softly see value "$88.98" for title "Unit Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
   #3150
    Then I softly see value "Calculation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
   #3152
    Then I softly see value "$8,898" for title "Calculated Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Calculation of Cost (if other than Quantity * Unit Cost) | Unit Cost | Proposed Expenditure |
      | Title                       | 100      | ---AUTOEnvData:-:Char256---                              | 88.98     | 100                  |
    #3150
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3068 @NYSED-3069 @NYSEDSprint-28 @US-NYSED-1867 @M05
    @NYSED-3089 @NYSED-3090 @NYSED-3091 @NYSED-3093 @US-NYSED-1868 @VaibhavChandratare @passed @Bug-Ticket-NYSED-11302
  Scenario Outline: Verify that Grantee User can add update delete details under budget category 'Professional Staff Salaries' - Send to Subrecipient award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "5" seconds
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3068
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Position Title" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "10" for title "# of Positions" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "10.00" for title "FTE" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$10" for title "Annualized Rate of Pay" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$10" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$1,000" for title "Projected Salary" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 20             | 20  | 20                     | 20                                                 | 2000             |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "20" for title "# of Positions" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "20.00" for title "FTE" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$20" for title "Annualized Rate of Pay" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$20" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$2,000" for title "Projected Salary" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3069
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 2.0            | 20.25 | 2.0                    | 2.0                                                | 20.00            |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title   | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title Automation | 3.0            | 30.25 | 3.0                    | 3.0                                                | 30.00            |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title Test     | 4.0            | 40.25 | 4.0                    | 4.0                                                | 40.00            |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
      | Actions     | Specific Position/Title   | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Action menu | Position Title            | 20             | 20.25 | $20                    | $20                                                | $2,000           |
      | Action menu | Position Title Automation | 30             | 30.25 | $30                    | $30                                                | $3,000           |
      | Action menu | Position Title Test       | 40             | 40.25 | $40                    | $40                                                | $4,000           |
      |             | Total                     |                | 90.75 | $90                    | $90                                                | $9,000           |
    And I click on "Delete" icon for "Position Title Automation" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Position Title Automation" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Action menu | Position Title          | 20             | 20.25 | $20                    | $20                                                | $2,000           |
      | Action menu | Position Title Test     | 40             | 40.25 | $40                    | $40                                                | $4,000           |
      |             | Total                   |                | 60.50 | $60                    | $60                                                | $6,000           |
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $6,000       |
    #NYSED-3091
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    #NYSED-3089
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    #NYSED-3091
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Position Title" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "10" for title "# of Positions" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "10.00" for title "FTE" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "$10" for title "Annualized Rate of Pay" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "$10" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "$1,000" for title "Projected Salary" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 20             | 20  | 20                     | 20                                                 | 2000             |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "20" for title "# of Positions" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "20.00" for title "FTE" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "$20" for title "Annualized Rate of Pay" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "$20" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "$2,000" for title "Projected Salary" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3090
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 2.0            | 20.25 | 2.0                    | 2.0                                                | 20.00            |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title   | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title Automation | 3.0            | 30.25 | 3.0                    | 3.0                                                | 30.00            |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title Test     | 4.0            | 40.25 | 4.0                    | 4.0                                                | 40.00            |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Actions     | Specific Position/Title   | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Action menu | Position Title            | 20             | 20.25 | $20                    | $20                                                | $2,000           |
      | Action menu | Position Title Automation | 30             | 30.25 | $30                    | $30                                                | $3,000           |
      | Action menu | Position Title Test       | 40             | 40.25 | $40                    | $40                                                | $4,000           |
      |             | Total                     |                | 90.75 | $90                    | $90                                                | $9,000           |
    And I click on "Delete" icon for "Position Title Automation" inside flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Position Title Automation" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Action menu | Position Title          | 20             | 20.25 | $20                    | $20                                                | $2,000           |
      | Action menu | Position Title Test     | 40             | 40.25 | $40                    | $40                                                | $4,000           |
      |             | Total                   |                | 60.50 | $60                    | $60                                                | $6,000           |
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category        | Budget Category Code | Award Amount |
      | Action menu | Support Staff Salaries | 16                   | $6,000       |
    #NYSED-3093
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @NYSED-3111 @NYSED-3114 @NYSED-3122-removedTc @NYSED-3123 @NYSED-3124 @PRAJWAL @NYSED-3121 @M05 @passed
  Scenario Outline: :Verify that Grantee User can add / update / delete details under budget category 'Purchased Services' - Send to Subrecipient award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "10" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I wait for "3" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    #NYSED-3114
    Then I softly see top right button "New" inside flex table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $200                 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $200                 |
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure |
      | Description of Item         | 300                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $300                 |
    And I wait for "3" seconds
    When I click on "Delete" icon for "Provider of Services" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    #NYSED-3111
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3121
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services |                     | 100                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost         | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | ---AUTOEnvData:-:Char256--- | 100                  |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost         | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | ---AUTOEnvData:-:Char255--- | $100                 |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost |
      | Description of Item         | Calculation of Cost |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 |
    And I wait for "2" seconds
    When I click on "Delete" icon for "Provider of Services" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    #NYSED-3123
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      |                             | Yes             | Provider of Services | Calculation of Cost | 100                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | ---AUTOEnvData:-:Char256--- | Yes             | Provider of Services | Calculation of Cost | 100                  |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | ---AUTOEnvData:-:Char255--- | Yes             | Provider of Services | Calculation of Cost | $100                 |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "Edit" :
      | Provider of Services | Description of Item/Service |
      | Provider of Services | Description of Item         |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "3" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
  #NYSED-3124
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost |                      |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | ee                   |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | -99                  |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | 500.88               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $50,088              |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Then I softly see "Subaward budget" page block displayed
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category                  | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries      | 15                   | $0           |
      | Action menu | Support Staff Salaries           | 16                   | $0           |
      | Action menu | Purchased Services               | 40                   | $0           |
      | Action menu | Supplies and Materials           | 45                   | $0           |
      | Action menu | Travel Expenses                  | 46                   | $0           |
      | Action menu | Employee Benefits                | 80                   | $0           |
      | Action menu | Indirect Cost                    | 90                   | $0           |
      | Action menu | BOCES Purchased Services         | 49                   | $0           |
      | Action menu | Minor Remodeling                 | 30                   | $0           |
      | Action menu | Equipment                        | 20                   | $0           |
      |             | Focus Area : <Announcement Name> |                      | $0           |
      |             | Total                            |                      | $0           |
      |             | Grand Total                      |                      | $0           |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3080 @NYSED-3081 @NYSEDSprint-25 @US-NYSED-1867 @M05 @Nikita @passed
  Scenario Outline: Verify that the Grantee user see Professional Staff Salaries, Award Budget Categories modal, having a 'Specific Position/Title' column (Editable, Blank for new row, Short text 255 Character and Required)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I wait for "20" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<External User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see "Subaward budget" page block displayed
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I softly see "Subaward Budget Category" opens in overLay window
    Then I softly see "Professional Staff Salaries" page block displayed
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | 10             | 10  | 10                     | 10                                                 | 1000             |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | {AUTOEnvData:Char256}   | 10             | 10  | 100                    | 10                                                 | 1000             |
    And I wait for "3" seconds
    Then I softly see value "{AUTOEnvData:Char255}" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
      | # of Positions | Specific Position/Title |
      | 10             | Test1                   |
    Then I softly see value "Test1" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    #NYSED-3081
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I softly see "Subaward Budget Category" opens in overLay window
    Then I softly see "Professional Staff Salaries" page block displayed
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Test2                   | 8              | 8                      | 8                                                  | 1000             |
    Then I softly cannot see the following messages in the page details contains:
      | Required fields missing |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Test2                   | f   |
    And I wait for "2" seconds
    Then I softly see value "" for title "FTE" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Test3                   | 10             | -34 | 10                     | 10                                                 | 1000             |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | FTE cannot be negative. |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE    | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Test3                   | 10             | 88.998 | 10                     | 10                                                 | 1000             |
    Then I softly see value "88.99" for title "FTE" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
      | Specific Position/Title | FTE   |
      | Test3                   | 67.88 |
    Then I softly see value "67.88" for title "FTE" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"

    Examples:
      | Announcement Name                                         | Coordinator | External User |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC    |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE    |

  @NYSED-3190 @NYSED-3191 @NYSED-3196 @NYSED-3195 @543572 @NYSEDSprint-25 @US-NYSED-1873 @M05 @Yogita @passed
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
  |Verify that Internal User can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Direct Grant|
  |Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant|
  |Verify that Grantee Users apart from Submit and Certify & Create and Edit roles, cannot add / update / delete details under budget category 'Travel Expenses' - Send to Subrecipient award|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    #NYSED-3195
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    #NYSED-3195
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "4" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Traveler             | test        | Purpose | Automation Benefits- 1          | of                  | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "4" seconds
    #NYSED-3190
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "4" seconds
    #NYSED-3191
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "4" seconds
    #NYSED-3191
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3196
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PO Username} |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    When I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3141 @NYSED-3142 @NYSED-3143 @NYSED-3144 @NYSEDSprint-25 @US-NYSED-1870 @M05 @Pranita @NeedToRaiseBug @passed
  Scenario Outline: Validate that the grantee user see Supplies and Materials, Award Budget Categories modal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I wait for "20" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I wait for "20" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    Then I softly see field "Status" as "Created"
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Subaward budget"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    And I wait for "4" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I wait for "10" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Quantity" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Unit Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Additional Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I wait for "2" seconds
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    #NYSED-3141
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I wait for "3" seconds
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see the following messages in the page details :
      | Required fields missing |
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    #NYSED-3142
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      |                             | 200                                                      | 2        | 100       | 100             | 100                  |
    Then I softly see the following messages in the page details :
      | Required fields missing |
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | ---AUTOEnvData:-:Char256--- | 200                                                      | 2        | 100       | 100             | 99                   |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item/Service" against the value "200" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I wait for "2" seconds
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | text                        | 200                                                      | 2        | 100       | 100             | 100                  |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    #NYSED-3143
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | text                        | 200                                                      | 2        | 100       | 100             |                      |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Required fields missing |
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | ABCDE                       | 200                                                      | 2        | 100       | 100             | -100                 |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | ABCDE                       | 200                                                      | 2        | 100       | 100             | +()                  |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | ABCDE                       | 200                                                      | 2        | 100       | 100             | 100                  |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    #NYSED-3144
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity |
      | ABCDE                       | 1-02     |
    Then I softly see the text containing "Enter a valid numeric value."
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | ABCDE                       | 200                                                      |          | 100       | 100             | 100                  |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | ABCDE                       | 200                                                      | 1.760987 | 100       | 100             | 1                    |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | ABCDE                       | 200                                                      | 2        | 100       | 100             | 800                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3201 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita @ReviewRemaining @passed
  Scenario Outline: Verify that the Grantee user see Travel Expenses, Award Budget Categories modal, having a 'Position of Traveler' column (Editable, Blank for new row, Short text 255 Character and Required)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      |                      | Destination | Purpose | Automation Benefits- 1          | Calculation         | 88.988               |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I wait for "2" seconds
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position             | Destination | Purpose | Automation Benefits- 1          | Calculation         | 1000                 |
    Then I softly see value "Position" for title "Position of Traveler" against the value "Destination" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
      | Destination | Position of Traveler        |
      | Destination | ---AUTOEnvData:-:Char256--- |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Position of Traveler        | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | ---AUTOEnvData:-:Char255--- | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYESD-3725 @NYESD-3726 @NYESD-3727 @NYESD-3728 @Saranjit @M05 @ReviewRemaining @NeedRun
  Scenario Outline: Verify that the ‘Reimbursement Request’ section button is only visible to submit and certify or create and edit profile users on the Subaward layout → Actuals tab → Payment Requests section. - Direct Grant/Award
  |Verify that the ‘Reimbursement Request’ section button is only visible to submit and certify or create and edit profile users on the Subaward layout → Actuals tab → Payment Requests section. - Direct Grant/Award|
  |Verify that the ‘Advance Request’ section button is removed/hidden and not visible to the Grantee users on the Subaward layout → Actuals tab → Payment Requests section. Direct Grant/Award|
  |Verify that the ‘Reimbursement Request’ section button and inline Edit and Delete buttons are not visible to other than the submit and certify or create and edit profile users on the Subaward layout→Actuals tab→Payment Requests section Direct Grant/Award|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    #3727
    Then I softly cannot see top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #3725
    Then I softly can see top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #3726
    Then I softly see "Create Reimbursement Request" opens in overLay window
    When I enter value "Automation Payment Request" into field "Title__c"
    When I enter value "FS-10F" into field "NYSED_ReimbursementTemplate__c"
    And I click modal button "Save and Continue"
    #3728
    Then I softly cannot see top right button "Edit" in page detail
#    When I enter value "60" into field "BillingStartDate__c"
#    When I enter value "80" into field "BillingEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "Subaward" as "awardName"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    #3726
    Then I softly can see row level action button "Edit" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "Edit" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly can see top right button "Save" in page detail
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    #3727
    Then I softly cannot see top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #3728
    Then I softly cannot see row level action button "Edit" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly cannot see top right button "Save" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    #3727
    Then I softly cannot see top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    #3728
    Then I softly cannot see row level action button "Edit" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:awardName}" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly cannot see top right button "Save" in page detail
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "Delete" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:paymentRequestTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:paymentRequestTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC |

  @NYSED-3131 @NYSED-3132 @NYSED-3133 @Nikita @passed
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Supplies and Materials' - Send to Subrecipient award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I wait for "20" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<External User>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see "Subaward budget" page block displayed
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I softly see "Subaward Budget Category" opens in overLay window
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item         | 200                                                      | 2        | 100       | 100             | 1000                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description of Item         | 300                                                      |
    And I wait for "2" seconds
    Then I softly see value "300" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I click on "Delete" icon for "Description of Item" inside table
    And I click "OK" on modal confirmation box
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I wait for "2" seconds
  #NYSED-3132
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I softly see "Subaward Budget Category" opens in overLay window
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item1        | 200                                                      | 2        | 100       | 100             | 1000                 |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item2        | 200                                                      | 2        | 100       | 100             | 1000                 |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item3        | 200                                                      | 2        | 100       | 100             | 1000                 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$100.00" for title "Unit Cost" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$100.00" for title "Unit Cost" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$100.00" for title "Unit Cost" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly see value "$3,000" for title "Award Amount" against the value "Supplies and Materials" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I softly can see row level action button "Edit" against "Description of Item1" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item1" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item1        | 400                                                      | 4        | 200       | 200             | 2000                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item2        | 400                                                      | 4        | 200       | 200             | 2000                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item3        | 400                                                      | 4        | 200       | 200             | 2000                 |
    And I wait for "2" seconds
    Then I softly see value "4.00" for title "Quantity" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200.00" for title "Unit Cost" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200" for title "Additional Cost" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$2,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "4.00" for title "Quantity" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200.00" for title "Unit Cost" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200" for title "Additional Cost" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Calculated Proposed Expenditure" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$2,000" for title "Proposed Expenditure" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "4.00" for title "Quantity" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200.00" for title "Unit Cost" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200" for title "Additional Cost" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Calculated Proposed Expenditure" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$2,000" for title "Proposed Expenditure" against the value "Description of Item3" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I softly can see row level action button "Delete" against "Description of Item3" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I click on "Delete" icon for "Description of Item3" inside flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see value "4.00" for title "Quantity" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200.00" for title "Unit Cost" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200" for title "Additional Cost" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$2,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "4.00" for title "Quantity" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200.00" for title "Unit Cost" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$200" for title "Additional Cost" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$1,000" for title "Calculated Proposed Expenditure" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see value "$2,000" for title "Proposed Expenditure" against the value "Description of Item2" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I wait for "3" seconds
    Then I softly see value "$4,000" for title "Award Amount" against the value "Supplies and Materials" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
  #NYSED-3133
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | External User |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC    |

  @NYSED-5068 @NYSED-5069 @Saranjit @M05 @passed
  Scenario Outline: Verify that the Submit and Certify Role can see the task ‘Review Subaward and Accept GAN’ is generated when the FD user clicks on the ‘Send to Subrecipient' button when the subaward is in the ‘Approved’ state. - Direct Grant/Award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "awardName"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser2>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | 80                   |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 920              |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description    | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description    | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PO Username} |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    #5069
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser1>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    #5069
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser3>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    #5069
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser2>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    #5068
    Then I softly see value "Review Subaward and Accept GAN" for title "Task Type" against the value "Record Id" inside table "---applicationReview:-:pendingTaskTableId---"
    Then I softly see "Review Subaward #<Record Id> and GAN" inside flex table with id "---applicationReview:-:pendingTaskTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | ExternalUser1 | ExternalUser2 | ExternalUser3 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_LEA  | GRANTEE_VO    | GRANTEE_SC    | EXTERNAL_CE   |

  @NYSED-3192 @NYSED-3193 @passed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3192 @NYSED-3193 @RejectAward @Yogita @needToReview @passed
  Scenario:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilities" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

  @NYSED-3192 @NYSED-3193 @Yogita @needToReview @passed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3158 @NYSED-3159 @NYSEDSprint-25 @US-NYSED-1871 @M05 @passed @Reviewed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10EMPLOYEEBENEFITS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    #NYSED-3168
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly see column header "Actions" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly see column header "Benefit" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3158-R @NYSED-3159-R @RejectAward @NYSEDSprint-25 @US-NYSED-1871 @M05 @passed @Reviewed
  Scenario:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10EMPLOYEEBENEFITS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits - Item 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"

  @NYSED-3160 @M05 @passed @Reviewed
    @NYSED-3118 @NYSED-3075 @M05 @Prajwal @Reviewed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "4" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    #NYSED-3118
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3075
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3166 @NYSEDSprint-25 @US-NYSED-1871 @M05 @FDMReRun @Reviewed
  Scenario Outline:Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Employee Benefits - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10EMPLOYEEBENEFITS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $0           |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $1,000       |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Total                       |                      | $1,000       |
      |             | Grand Total                 |                      | $1,000       |
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly see column header "Benefit" inside table "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $0           |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $1,000       |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Total                       |                      | $1,000       |
      |             | Grand Total                 |                      | $1,000       |
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly see column header "Benefit" inside table "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3213 @NYSED-3214 @NYSEDSprint-25 @US-NYSED-1871 @M05 @passed @Reviewed
  Scenario:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10EQUIPMENT_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "4" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"

  @NYSED-3215 @passed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "4" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3223 @M05 @passed
  Scenario Outline: Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Equipment - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10EQUIPMENT_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "4" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 10000    |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $0           |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $10,000      |
      |             | Total                       |                      | $10,000      |
      |             | Grand Total                 |                      | $10,000      |
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly see column header "Actions" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Vendor" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $0           |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $10,000      |
      |             | Total                       |                      | $10,000      |
      |             | Grand Total                 |                      | $10,000      |
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly see column header "Actions" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Vendor" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"

    Examples:
      | ExternalUser | InternalUser |
      | GRANTEE_SC   | FD           |
#      | GRANTEE_SC   | PO           |
#      | GRANTEE_SC   | FO           |
#      | GRANTEE_SC   | PM           |
#      | GRANTEE_SC   | EXE          |
#      | GRANTEE_SC   | Admin        |

  @NYSED-3225 @NYSED-3214 @NYSEDSprint-25 @US-NYSED-1871 @M05 @passed @Reviewed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
  |Verify that Internal User (FD Profile) cannot add / update / delete the added budget under the budget category. - Award created from FDM|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10EQUIPMENT_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 10000    |
    And I wait for "2" seconds
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Equipment - Item 1" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Equipment - Item 1" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Equipment - Item 1" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Description of Item" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Vendor" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Quantity" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Unit Cost" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Additional Cost" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardEquipmentTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3235 @NYSED-3236 @RejectAward @M05 @passed @Reviewed
  Scenario:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10BOCESPURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"

  @NYSED-3245 @M05 @passed @Yogita @Reviewed @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline: Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: BOCES Purchased Services: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10BOCESPURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"

    Examples:
      | ExternalUser | InternalUser |
      | GRANTEE_SC   | FD           |
#      | GRANTEE_SC   | PO           |
#      | GRANTEE_SC   | FO           |
#      | GRANTEE_SC   | PM           |
#      | GRANTEE_SC   | EXE          |
#      | GRANTEE_SC   | Admin        |

  @NYSED-3235-Reviewed @NYSED-3236 @M05 @passed @Reviewed
  Scenario Outline: Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10BOCESPURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesLineItems---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3254 @Reject @M05 @passed @Reviewed
  Scenario:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10MINORREMODELING_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"

  @NYSED-3254 @NYSED-3265 @M05 @passed @Reviewed
  Scenario Outline: Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10MINORREMODELING_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:MinorRemodelingCategoryTableId---"
    And I click modal button "Close"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-3265
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly see column header "Description of Work to be Performed" inside table "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly see column header "Provider of Service/Vendor" inside table "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly see column header "Calculation of Cost" inside table "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3256 @M05 @passed @Yogita @Reviewed
  Scenario Outline:Verify that Internal User (FD Profile) cannot see the 'View/Add Line Item Details' inline action in all states of Award if 'Is a Detailed Budget Required on the Subaward?': NO and not able to add the new budget. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "FS10MINORREMODELING_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3263 @M05 @Yogita @Reviewed @passed @wip @wip-AsPerMatchNoEnhancement
  Scenario:Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Minor Remodeling: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10MINORREMODELING_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"

  @NYSED-3204 @M05 @FDMReRun @Yogita @Reviewed @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline:Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Travel Expenses - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | ExternalUser | InternalUser |
      | GRANTEE_SC   | FD           |
#      | GRANTEE_SC   | PO           |
#      | GRANTEE_SC   | FO           |
#      | GRANTEE_SC   | PM           |
#      | GRANTEE_SC   | EXE          |
#      | GRANTEE_SC   | Admin        |

  @NYSED-3255 @M05 @passed @Reviewed
  Scenario Outline:Verify that Internal User (FD Profile) cannot add / update / delete the added budget under the budget category. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10MINORREMODELING_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling - Item 1" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3247 @NYSEDSprint-25 @US-NYSED-1871 @M05 @passed @Reviewed
  Scenario Outline: Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'BOCES Purchased Services' of award, a detailed line item modal is opened and user can see correct columns: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10BOCESPURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly see column header "Name of BOCES" inside table "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly see column header "Calculation of Cost" inside table "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3077 @NYSED-3076 @Prajwal @NeedtoReview @passed
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "4" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 12  | 100                    | 44.5                                               | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    #NYSED-3076
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    #NYSED-3077
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PO Username} |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    When I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3115 @NYSED-3113  @Prajwal @M05 @passed
  Scenario Outline:  Verify that Grantee User cannot add / update / delete details under budget category 'Purchased Services' apart from Send to Subrecipient award state -Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "4" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $1000                |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PO Username} |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I click on "Accept after Approval" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-1454 @NYSEDSprint-21 @US-NYSED-1230 @M05 @passed
  Scenario Outline: Verify that the 'Submit and Certify' user when award is in send to subrecipient after approval state on click after Accept after approval action award state get changed to 'Activated' insteded of 'Accepted after Approval' state Via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    #NYSED-1454
    Then I softly see field "Status" as "Activated"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @543567 @Yogita @passed
  Scenario Outline: Verify that the FD user can see the Submit for Approval button when direct grant is in Accepted state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PO Username} |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly cannot see top right dropdown button "Send to Subrecipient" in page detail
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543532 @Yogita @passed
  Scenario Outline:Verify that the Grant Finance Coordinator/s can see the Subaward Status changes to 'Accepted' when clicking on the Complete Review button.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE          | GRANTEE_SC   |

  @543708 @Yogita @passed
  Scenario Outline:Verify that the Grant Finance Coordinator/s can see the Subaward status changes to 'Submitted for Review' when clicking on the Send Back to Program Office button when Fiscal Reviewer is not added.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    Then I softly can see top right dropdown button "Send Back to Program Office" in page detail
    Then I softly cannot see top right dropdown button "Send to Subrecipient" in page detail
    When I click on "Send Back to Program Office" in the page details
    Then I softly see field "Status" as "Submitted for Review"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3116 @NYSED-3117 @Prajwal @needToReview @passed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3074 @NYSED-3085 @Prajwal @needtoReview @passed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    #NYSED-3085
    Then I see only the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3092 @US-NYSED-1868 @VaibhavChandratate @Needtoreview @passed
  Scenario Outline: Verify that Grantee User cannot add update delete details under budget category Support Staff Salaries apart from Send to Subrecipient award state Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "5" seconds
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3094 @NYSED-3095 @US-NYSED-1868 @VaibhavChandratate @passed
  Scenario: Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10SUPPORTSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Support Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I navigate to "Budget" sub tab
    #@NYSED-3095
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Support Staff Salaries - Item 1" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

  @NYSED-3194 @US-NYSED-1868 @VaibhavChandratre @passed
  Scenario: 541530 - Verify that Internal User (FD Profile) cannot see the 'View/Add Line Item Details' inline action in all states of Award if 'Is a Detailed Budget Required on the Subaward?': NO and not able to add the new budget. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

  @NYSED-3072 @Vrushali @NeedRun
  Scenario Outline: Verify that Grantee Users apart from Submit and Certify & Create and Edit roles, cannot add / update / delete details under budget category 'Professional Staff Salaries' - Send to Subrecipient award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 7119             |
    And I wait for "3" seconds
   #NYSED-3072
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SubAwardBudgetCategoryFlexGrid---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3103 @NYSED-3107 @Vrushali @passed
  Scenario Outline: Verify that the grantee user see Support Staff Salaries, Award Budget Categories modal, having a 'Projected Salary' column (Editable, Required, Currency Field without decimal, cannot negative and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 |                  |
    Then I softly see the following messages in the page details :
      | Required fields missing |
    And I wait for "2" seconds
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | e                |
    Then I softly see the text containing "Enter a valid numeric value."
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | -34              |
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Projected Salary cannot be negative. |
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 88.998           |
    And I pause execution for "6" seconds
    Then I softly see value "$88,998" for title "Projected Salary" against the value "Position Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 88               |
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "$88" for title "Projected Salary" against the value "Position Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 95               |
    And I pause execution for "3" seconds
    Then I softly see value "$95" for title "Projected Salary" against the value "Position Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly see "Budget Category : Support Staff Salaries" opens in overLay window
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC  |

  @NYSED-3108 @Vrushali @M05 @passed
  Scenario Outline: Verify that the grantee user see Support Staff Salaries, Award Budget Categories modal, having a '# of Positions' column ( Editable, Required, Number Field without decimal, cannot negative and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          |                | 10  | 10                     | 10                                                 | 88               |
    Then I softly see the following messages in the page details :
      | Required fields missing |
    And I wait for "2" seconds
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | e              | 10  | 10                     | 10                                                 | 88               |
    Then I softly see the text containing "Enter a valid numeric value."
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | -10            | 10  | 10                     | 10                                                 | 67               |
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | # of Positions cannot be negative. |
    And I wait for "2" seconds
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10.345         | 10  | 10                     | 10                                                 | 88               |
    And I pause execution for "5" seconds
    Then I softly see value "10,345" for title "# of Positions" against the value "Position Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 15             | 10  | 10                     | 10                                                 | 88               |
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "15" for title "# of Positions" against the value "Position Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 45             | 10  | 10                     | 10                                                 | 95               |
    And I pause execution for "3" seconds
    Then I softly see value "45" for title "# of Positions" against the value "Position Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |
  #    | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC  |

  @NYSED-3109 @M05 @Vrushali @passed
  Scenario Outline: Verify that the grantee user see Support Staff Salaries, Award Budget Categories modal, having a Additional Cost (e.g., Per Diem, Teacher Stipends) column (Editable, Optional, Currency Field without decimal, cannot negative and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     |                                                    | 88               |
    Then I softly cannot see the following messages in the page details :
      | Required Fields Missing |
    And I wait for "2" seconds
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | e                                                  | 88               |
    Then I softly see the text containing "Enter a valid numeric value."
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | -10                                                | 67               |
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Additional Cost cannot be negative. |
    And I close "Subaward Budget Category" modal by clicking the top right x button
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title1         | 10             | 10  | 10                     | 11.236                                             | 88               |
    And I pause execution for "5" seconds
    Then I softly see value "$11,236" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" against the value "Position Title1" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title2         | 15             | 10  | 10                     | 78                                                 | 88               |
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "$78" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" against the value "Position Title2" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title2         | 45             | 10  | 10                     | 34                                                 | 95               |
    And I pause execution for "3" seconds
    Then I softly see value "$34" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" against the value "Position Title2" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |
   #   | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC  |

  @NYSED-3106 @M05 @Vrushali @passed
  Scenario Outline:541447 - Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Support Staff Salaries' of award, a detailed line item modal is opened and user can see correct columns: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10SUPPORTSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3175 @NYSED-3176 @M05 @Ankit @passed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
  |Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM|
  |Verify that Internal User (FD Profile) cannot add / update / delete the added budget under the budget category. - Award created from FDM|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on "Reject" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    #NYSED-3175
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see "Subaward budget" page block displayed
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
      #NYSED-3176
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see value "Travel Expenses - Item 1" for title "Position of Traveler" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Travel Expenses - Item 1" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3177 @M05 @Ankit @NeedRun
  Scenario Outline:Verify that Internal User (FD Profile) cannot see the 'View/Add Line Item Details' inline action in all states of Award if 'Is a Detailed Budget Required on the Subaward?': NO and not able to add the new budget. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on "Reject" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    #NYSED-3177
    And I navigate to "Budget" sub tab
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Indirect Cost" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Indirect Cost" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3136 @NYSED-3137 @Nikita @passed
  Scenario: Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10SUPPLIESANDMATERIALS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
  #NYSED-3136
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
  #NYSED-3137
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials - Item 1" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Delete" against "Supplies and Materials - Item 1" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials - Item 1" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

  @NYSED-3206 @15 @ReviewRemaining @passed
  Scenario Outline: Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Travel Expenses' of award, a detailed line item modal is opened and user can see correct columns: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly see column header "Position of Traveler" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly see column header "Destination" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly see column header "Purpose" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly see column header "Type (Air, Bus, Train, Mileage)" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly see column header "Calculation of Cost" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3237 @16 @ReviewRemaining @passed
  Scenario Outline:  Verify that Internal User (FD Profile) cannot see the 'View/Add Line Item Details' inline action in all states of Award if 'Is a Detailed Budget Required on the Subaward?': NO and not able to add the new budget. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10BOCESPURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3203 @DYogita @17 @ReviewRemaining @passed
  Scenario Outline:Verify that the Grantee user see Travel Expenses, Award Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Required, Currency Field without decimals, cannot negative and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit For Approval" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 1000                 |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title2      | Destination | Purpose | Automation Benefits- 1          | Calculation         |                      |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title2      | Destination | Purpose | Automation Benefits- 1          | Calculation         | te                   |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title2      | Destination | Purpose | Automation Benefits- 1          | Calculation         | -10                  |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 88.988               |
    Then I softly see value "$88,988" for title "Proposed Expenditure" against the value "Position Title" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
      | Position of Traveler | Proposed Expenditure |
      | Position Title       | 1000                 |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |
      |             | Total                |             |         |                                 |                     | $1,000               |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @NYSED-3083 @18 @DYogita @Reviewed @passed @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline:Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Professional Staff Salaries: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3082 @19 @DYogita @ReviewRemaining @passed @Bug-Ticket-NYSED-11302
  Scenario Outline: Verify that the grantee user see Professional Staff Salaries, Award Budget Categories modal, having a 'Projected Salary' column ( Editable, Required, Currency Field without decimal, cannot negative and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit For Approval" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 75             | 12  | 100                    | 100                                                | 1000             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 75             | 12  | 100                    | 100                                                |                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 75             | 12  | 100                    | 100                                                | test             |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 75             | 12  | 100                    | 100                                                | -100             |
    Then I softly see the following messages in the page details contains:
      | Projected Salary cannot be negative. |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title2         | 75             | 12  | 100                    | 100                                                | 10.0             |
    Then I softly see value "$100" for title "Projected Salary" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
      | Specific Position/Title | Projected Salary |
      | Position Title2         | 1000             |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Action menu | Position Title2         | 75             | 12.00 | $100                   | $100                                               | $1,000           |
      |             | Total                   |                | 12.00 | $100                   | $100                                               | $1,000           |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @NYSED-3208 @NYSED-3210 @Sprint-25 @US-1876 @M05 @YugaC
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Equipment' - Send to Subrecipient award
  |Verify that Grantee User can see the 'View/Add Line Item Details' inline action - Direct Grant|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    #NYSED-3210
    Then I softly can see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                |
    #NYSED-3208
    Then I softly see value "Description of Item" for title "Description of Item" against the value "test" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$100.00" for title "Unit Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Vendor       | Proposed Expenditure |
      | Description of Item | Updated Name | 12000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Description of Item" for title "Description of Item" against the value "Updated Name" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "Updated Name" for title "Vendor" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$100.00" for title "Unit Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$12,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3209 @NYSED-3226 @Sprint-25 @US-1876 @M05 @YugaC
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Equipment' then following roll up sum take place - Direct Grant
  |Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Equipment' of award, a detailed line item modal is opened and user can see correct columns: Direct Grant|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3226
    Then I softly see column header "Actions" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Vendor" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    #NYSED-3209
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item  | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item1 | test1  | 2        | 100       | 100             | calclation1                                              | 10000                |
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item  | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item2 | test2  | 2        | 100       | 100             | calclation2                                              | 10000                |
    Then I softly see value "$20,000" for title "Proposed Expenditure" against the value "4.00" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item  | Proposed Expenditure |
      | Description of Item1 | 12000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "$22,000" for title "Proposed Expenditure" against the value "4.00" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"

    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item2" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I wait for "2" seconds
    Then I softly see value "$12,000" for title "Proposed Expenditure" against the value "2.00" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:subawardBudgetTableId---" :
      | Actions     | Budget Category | Budget Category Code | Award Amount |
      | Action menu | Equipment       | 20                   | $12,000      |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3212 @Sprint-25 @US-1876 @M05 @YugaC
  Scenario Outline: Verify that Grantee Users apart from Submit and Certify & Create and Edit roles, cannot add / update / delete details under budget category 'Equipment' - Send to Subrecipient award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                |
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUserwithoutAccess>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | ExternalUserwithoutAccess |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | GRANTEE_LEA               |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | GRANTEE_VO                |

  @NYSED-3216 @Sprint-25 @US-1876 @M05 @YugaC
  Scenario Outline: Verify that Internal User can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3217 @Sprint-25 @US-1876 @M05 @YugaC
  Scenario Outline: Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "Equ_DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                |
    And I click modal button "Close"
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3218-removed @NYSED-3219 @NYSED-3220 @NYSED-3221 @NYSED-3222 @NYSED-3227 @NYSED-3228 @NYSED-3229 @NYSED-3275 @Sprint-25 @US-1876 @M05 @YugaC @needtoRerun
  Scenario Outline: Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Description of Item' column ( Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Currency Field without decimals, by default blank for new row and Required on Save, cannot negative)|
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Quantity' column ( Editable, Required, Number Field up to 2 decimal places, cannot negative and Blank for new row)|
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Unit Cost' column ( Editable, Required, Currency Field without decimal, cannot negative and Blank for new row)|
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Calculation of Cost (if other than Quantity * Unit Cost) ' column ( Editable, Blank for new row, Short text 255 Character and optional)|
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Additional Cost' column (Editable, Currency Field without decimals, by default blank for new row and optional, cannot negative)|
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Calculated Proposed Expenditure' column  (Not-Editable, Formula Field)|
  |Verify that the grantee user see Equipment, Award Budget Categories modal, having a 'Vendor' column ( Editable, Blank for new row, Short text 255 Character and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "Equ_DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    #NYSED-3219
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      |                     | test   | 2        | 100       | 100             | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item         | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | ---AUTOEnvData:-:Char256--- | test   | 2        | 100       | 100             | calclation                                               | 10000                |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item" against the value "$100" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "test" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3220
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | @$F                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 100.10               |
    Then I softly see value "$10,010" for title "Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Proposed Expenditure |
      | Description of Item | 9000                 |
    Then I softly see the following messages in the page details contains:
      | Budget entries under the Equipment category must not be less than $10,000 per line item. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3221
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 100       | 100             | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | @F$S     | 100       | 100             | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2.345    | 100       | 100             | calclation                                               | 10000                |
    Then I softly see value "2.34" for title "Quantity" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Quantity |
      | Description of Item | -3       |
    Then I softly see the following messages in the page details contains:
      | Quantity cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3222
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100             | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | @F$S      | 100             | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 10.10     | 100             | calclation                                               | 10000                |
    Then I softly see value "$1,010" for title "Unit Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Unit Cost |
      | Description of Item | -100      |
    Then I softly see the following messages in the page details contains:
      | Quantity cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3227
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | 10000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Description of Item" for title "Description of Item" against the value "$100" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$100.00" for title "Unit Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description of Item | ---AUTOEnvData:-:Char256---                              |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item" against the value "$100" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "test" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3228
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Description of Item" for title "Description of Item" against the value "$100" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$100.00" for title "Unit Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Additional Cost |
      | Description of Item | @F$S            |
    Then I softly see value "" for title "Additional Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Additional Cost |
      | Description of Item | 1.00            |
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Additional Cost |
      | Description of Item | -100            |
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3229
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                |
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Quantity |
      | Description of Item | 3.7      |
    Then I softly see value "$470" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3275
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item |        | 2        | 100       | 100             | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor                      | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | ---AUTOEnvData:-:Char256--- | 2        | 100       | 100             | calclation                                               | 10000                |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Vendor" against the value "$100" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3224 @Sprint-25 @US-1876 @M05 @YugaC @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline: Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Equipment- Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "Equ_DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---directGrantAndAward:-:subawardBudgetTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount |
    Then I softly do not see column header "Cash Match" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    Then I softly do not see column header "Non-Cash Match" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    Then I softly do not see column header "Total Match" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    Then I softly do not see column header "Total Project Cost" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly do not see column header "Cash Match" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly do not see column header "Non-Cash Match" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly do not see column header "Total Match" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly do not see column header "Total Project Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly do not see column header "Cash Match" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    Then I softly do not see column header "Non-Cash Match" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    Then I softly do not see column header "Total Match" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    Then I softly do not see column header "Total Project Cost" inside table "---directGrantAndAward:-:subawardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly do not see column header "Cash Match" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly do not see column header "Non-Cash Match" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly do not see column header "Total Match" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly do not see column header "Total Project Cost" inside table "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |