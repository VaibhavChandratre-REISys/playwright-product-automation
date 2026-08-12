@directGrantFromApprovedAnnouncementNysed @announcementExecution @announcementUAT @GrantSubawardNysed @grantUpdateFile4
Feature: Validate all scenarios in the award from direct grant approved announcement

  @NYSED-3211 @Sprint-25 @US-1876 @M05 @YugaC
  Scenario Outline: Verify that Grantee User can not add / update / delete details under budget category 'Equipment' apart from Send to Subrecipient award state -Direct Grant
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
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3153 @NYSED-3156 @Sprint-25 @US-1872 @M05 @YugaC
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Employee Benefits' - Send to Subrecipient award
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
    #NYSED-3156
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 200                  |
    #NYSED-3153
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure |
      | Action menu | Automation Benefits- 1 | $200                 |
      |             | Total                  | $200                 |
    Then I softly can see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Automation Benefits- 1 | Proposed Expenditure |
      | Automation Benefits- 1 | 300                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure |
      | Action menu | Automation Benefits- 1 | $300                 |
      |             | Total                  | $300                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Automation Benefits- 1" inside flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3154 @NYSED-3169 @Sprint-25 @US-1872 @M05 @YugaC
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Employee Benefits' then following roll up sum take place  - Direct Grant
  |Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Employee Benefits' of award, a detailed line item modal is opened and user can see correct columns: Direct Grant|
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
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3159
    Then I see only the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions | Benefit | Proposed Expenditure |
    #NYSED-3154
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 200                  |
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 2 | 200                  |
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure |
      | Action menu | Automation Benefits- 2 | $200                 |
      | Action menu | Automation Benefits- 1 | $200                 |
      |             | Total                  | $400                 |
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 2 | 400                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure |
      | Action menu | Automation Benefits- 1 | $200                 |
      | Action menu | Automation Benefits- 2 | $400                 |
      |             | Total                  | $600                 |
    And I wait for "2" seconds
    When I click on "Delete" icon for "Automation Benefits- 2" inside flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure |
      | Action menu | Automation Benefits- 1 | $200                 |
      |             | Total                  | $200                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:subawardBudgetTableId---" :
      | Actions     | Budget Category   | Budget Category Code | Award Amount |
      | Action menu | Employee Benefits | 80                   | $200         |
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3157 @Sprint-25 @US-1872 @M05 @YugaC
  Scenario Outline: Verify that Grantee Users apart from Submit and Certify & Create and Edit roles, cannot add / update / delete details under budget category 'Employee Benefits' - Send to Subrecipient award
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
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 200                  |
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUserwithoutAccess>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | ExternalUserwithoutAccess |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | GRANTEE_LEA               |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | GRANTEE_VO                |

  @NYSED-3161 @Sprint-25 @US-1872 @M05 @YugaC
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
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3163 @NYSED-3164-removed @NYSED-3165 @Sprint-25 @US-1872 @M05 @YugaC
  Scenario Outline: Verify that the Grantee user see Employee Benefits, Award Budget Categories modal, having a 'Benefit' column (Editable, Blank for new row, Short text 255 Character and Required)
  |Verify that the Grantee user see Employee Benefits, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)|
  |Verify that the Grantee user see Employee Benefits, Award Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative and Blank for new row)|
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
    And I wait for "2" seconds
    #NYSED-3163
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit | Proposed Expenditure |
      |         | 200                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                     | Proposed Expenditure |
      | ---AUTOEnvData:-:Char256--- | 200                  |
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                     | Proposed Expenditure |
      | Action menu | ---AUTOEnvData:-:Char255--- | $200                 |
      |             | Total                       | $200                 |
    And I wait for "2" seconds
    When I click on "Delete" icon for "---AUTOEnvData:-:Char255---" inside flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3165
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                |
      | Automation Benefits- 1 |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | $F                   |
    Then I softly see the text containing "Enter a valid numeric value."
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 10.50                |
    Then I see the following rows under the following headers in table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure |
      | Action menu | Automation Benefits- 1 | $1,050               |
      |             | Total                  | $1,050               |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | -1000                |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3167 @Sprint-25 @US-1872 @M05 @YugaC @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline: Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Employee Benefits - Direct Grant
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
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly do not see column header "Cash Match" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly do not see column header "Non-Cash Match" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly do not see column header "Total Match" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly do not see column header "Total Project Cost" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
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
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly do not see column header "Cash Match" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly do not see column header "Non-Cash Match" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly do not see column header "Total Match" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Then I softly do not see column header "Total Project Cost" inside table "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3249 @NYSED-3266 @NYSED-3250 @NYSED-3252 @NYSED-3253 @NYSEDSprint-25 @US-NYSED-1875 @M05
    @NYSED-3234 @NYSEDSprint-25 @US-NYSED-1874 @M05
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Minor Remodeling' - Send to Subrecipient award
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
    And I wait for "2" seconds
    #NYSED-3252
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    #NYSED-3266
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         | Provider of Service        | Calculation         | 88.988               |
    #NYSED-3249 #NYSED-3250
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Position Title                      | Provider of Service        | Calculation         | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              |
      | Action menu | Position Title                      | Provider of Service        | Calculation         | $88,988              |
      |             | Total                               |                            |                     | $177,976             |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Calculation of Cost | Proposed Expenditure |
      | Description                         | Calculation         | 88.989               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title                      | Calculation         | $88,988              |
      | Action menu | Description                         | Calculation         | $88,989              |
      |             | Total                               |                     | $177,977             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,989              |
      |             | Total                               |                            |                     | $88,989              |
    And I click modal button "Close"
    And I wait for "3" seconds
    #NYSED-3250
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
      | Action menu | Minor Remodeling            | 30                   | $88,989      |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Grand Total                 |                      | $88,989      |
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Description                 | BOCES         | Calculation         | 1000                 |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3253
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3234
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3253
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3234
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @NYSED-3264 @NYSEDSprint-25 @US-NYSED-1875 @M05
    @NYSED-3246 @NYSEDSprint-25 @US-NYSED-1874 @M05
  Scenario Outline: Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Minor Remodeling: Direct Grant
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
    And I wait for "2" seconds
    #NYSED-3264 #NYSED-3246
    Then I see only the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount |
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3264
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    #NYSED-3246
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
     #NYSED-3264 #NYSED-3246
    Then I see only the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount |
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    #NYSED-3246
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | EXE          |

  @NYSED-3258 @NYSED-3251 @NYSED-3257 @NYSEDSprint-25 @US-NYSED-1875 @M05
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
    #NYSED-3257
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    #NYSED-3257
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Position Title                      | Provider of Service        | Calculation         | 1000                 |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3251
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
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
    #NYSED-3257
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    #NYSED-3258
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
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
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3251
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    #NYSED-3257
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    #NYSED-3258
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Budget" sub tab
    #NYSED-3257
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    #NYSED-3258
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3251
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
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
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    #NYSED-3257
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    #NYSED-3258
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3251
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3267 @NYSED-3259 @NYSED-3260-Removed @NYSED-3261 @NYSED-3262 @NYSEDSprint-25 @US-NYSED-1875 @M05
  Scenario Outline: Verify that the Grantee user see Minor Remodeling, Award Budget Categories modal, having a 'Provider of Service/Vendor' column (Editable, Blank for new row, Short text 255 Character and Required)
  |Verify that the Grantee user see Minor Remodeling, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)|
  |Verify that the Grantee user see Minor Remodeling, Award Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user see Minor Remodeling, Award Budget Categories modal, having a 'Description of Work to be Performed' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user see Minor Remodeling, Award Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Required, Currency Field without decimals, cannot negative and Blank for new row)|
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
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         |                            | Calculation         | 88.988               |
    #NYSED-3267
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         | Provider of Service        | Calculation         | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Provider of Service/Vendor |
      | Description                         | {SavedValue:Char256}       |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description                         | {SavedValue:Char255}       | Calculation         | $88,988              |
    When I click on "Delete" icon for "Description" inside flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         | Provider of Service        |                     | 88.988               |
    #NYSED-3259
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      |                                     | Provider of Service        | Calculation         | 88.988               |
    #NYSED-3261
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost  | Proposed Expenditure |
      | {SavedValue:Char256}                | Provider of Service        | {SavedValue:Char256} | 88.988               |
    #NYSED-3259 #NYSED-3261
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost  | Proposed Expenditure |
      | Action menu | {SavedValue:Char255}                | Provider of Service        | {SavedValue:Char255} | $88,988              |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "Edit" :
      | Provider of Service/Vendor | Description of Work to be Performed | Calculation of Cost | Proposed Expenditure |
      | Provider of Service        | {SavedValue:Char42}                 | {SavedValue:Char42} | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Action menu | {SavedValue:Char42}                 | Provider of Service        | {SavedValue:Char42} | $88,988              |
    When I click on "Delete" icon for "Provider of Service" inside flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---"

    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         | Provider of Service        | Calculation         |                      |
    #NYSED-3262
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         | Provider of Service        | Calculation         | ee                   |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         | Provider of Service        | Calculation         | -34                  |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Description                         | Provider of Service        | Calculation         | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @NYSED-3230 @NYSED-3233 @NYSED-3248 @NYSED-3231 @NYSEDSprint-25 @US-NYSED-1874 @M05
  Scenario Outline: Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Indirect Cost' of award, a detailed line item modal is opened and user can see correct columns: Direct Grant
  |Verify that Grantee User can add / update / delete details under budget category 'Indirect Cost' then following roll up sum take place - Direct Grant|
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
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3230 NYSED-3233
    Then I softly see the text containing "BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    #NYSED-3248
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              | Destination   | Calculation         | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title              | Destination   | Calculation         | $88,988              |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              | Purpose       | Cost                | 88.988               |
    And I wait for "3" seconds
    #NYSED-3231
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title              | Destination   | Calculation         | $88,988              |
      | Action menu | Position Title              | Purpose       | Cost                | $88,988              |
      |             | Total                       |               |                     | $177,976             |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              | and           | test                | 88.888               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title              | Purpose       | Cost                | $88,988              |
      | Action menu | Position Title              | and           | test                | $88,888              |
      |             | Total                       |               |                     | $177,876             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "and" inside flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $0           |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $88,988      |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Grand Total                 |                      | $88,988      |


    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @NYSED-3240 @NYSED-3241-removed @NYSED-3242 @NYSED-3243 @NYSED-3244 @NYSEDSprint-25 @US-NYSED-1874 @M05
  Scenario Outline:542641 - Verify that the Grantee user see BOCES Purchased Services, Award Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, Short text 255 Character and Required)
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
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position                    | and           |                     | 88.988               |
    #NYSED-3240
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES        | Calculation of Cost  | Proposed Expenditure |
      | {SavedValue:Char256}        | {SavedValue:Char256} | {SavedValue:Char256} | 88.988               |
    #NYSED-3242 NYSED-3243
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES        | Calculation of Cost  | Proposed Expenditure |
      | Action menu | {SavedValue:Char255}        | {SavedValue:Char255} | {SavedValue:Char255} | $88,988              |
    When I click on "Delete" icon for "{SavedValue:Char255}" inside flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3242
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      |                             | and           | or                  | 88.988               |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    #NYSED-3243
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              |               | Calculation         | 88.888               |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    #NYSED-3244
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              | Destination   | Calculation         | F                    |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              | Destination   | Calculation         | -34                  |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              | Destination   | Calculation         | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title              | Destination   | Calculation         | $88,988              |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @NYSED-3239 @NYSED-3232 @NYSED-3238 @NYSEDSprint-25 @US-NYSED-1874 @M05
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
  #NYSED-3238
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
  #NYSED-3238
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
      | Position Title              | Destination   | Calculation         | 1000                 |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
  #NYSED-3232
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
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
  #NYSED-3238
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
  #NYSED-3239
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
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
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
  #NYSED-3232
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
  #NYSED-3238
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
  #NYSED-3239
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Budget" sub tab
  #NYSED-3238
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
  #NYSED-3239
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
  #NYSED-3232
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
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
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
  #NYSED-3238
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
  #NYSED-3239
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
  #NYSED-3232
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardBOCESPurchasedServicesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3162 @NYSED-3155 @Sprint-25 @US-1872 @M05 @YugaC @needtoRerun
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
  |Verify that Grantee User can not add / update / delete details under budget category 'Employee Benefits' apart from Send to Subrecipient award state -Direct Grant|
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
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 200                  |
    And I click modal button "Close"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Projected Salary |
      | Title                   | 1              | 1   | 100                    | 800              |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
#NYSED-3155
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
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
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
#NYSED-3162
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
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
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
#NYSED-3155
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
#NYSED-3162
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
#NYSED-3162
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
#NYSED-3155
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
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
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
#NYSED-3162
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
#NYSED-3155
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---subAwardStandAlone:-:AwardEmployeeBenefitsTableId---"
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3174 @NYSED-3173 @NYSED-3170 @NYSED-3171 @NYSEDSprint-25 @US-NYSED-1873 @M05 @santosh
    @NYSED-3071 @NYSEDSprint-28 @US-NYSED-1867 @M05 @Dilip
  Scenario Outline: Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Indirect Cost' of award, a detailed line item modal is opened and user can see correct columns: Direct Grant
  |Verify that Grantee User can add / update / delete details under budget category 'Indirect Cost' then following roll up sum take place - Direct Grant|
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
    And I wait for "2" seconds
    #NYSED-3071
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see "Subaward Budget Category" opens in overLay window
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3186 #NYSED-3173
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions | Description | Proposed Expenditure |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | 88.988               |
    #NYSED-3170 #NYSED-3171
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions     | Description    | Proposed Expenditure |
      | Action menu | Position Title | $88,988              |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions     | Description    | Proposed Expenditure |
      | Action menu | Position Title | $88,988              |
      | Action menu | Position Title | $88,988              |
      |             | Total          | $177,976             |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "Edit" :
      | Description    | Proposed Expenditure |
      | Position Title | 88.989               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions     | Description    | Proposed Expenditure |
      | Action menu | Position Title | $88,989              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    #NYSED-3171
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $0           |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $88,989      |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Grand Total                 |                      | $88,989      |
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3174
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3174
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @NYSED-3184 @NYSED-3147 @NYSEDSprint-25 @US-NYSED-1873 @US-NYSED-1870 @M05 @santosh
  Scenario Outline: Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Indirect Cost - Direct Grant
  |Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Supplies and Materials - Direct Grant|
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
    And I wait for "2" seconds
    #NYSED-3184 #NYSED-3147
    Then I see only the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount |
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions | Description | Proposed Expenditure |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3147
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Quantity" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Unit Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Additional Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
     #NYSED-3184 #NYSED-3147
    Then I see only the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount |
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions | Description | Proposed Expenditure |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    #NYSED-3147
    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Quantity" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Unit Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Additional Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   | PO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | FO           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   | FD           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | EXE          |

  @NYSED-3182 @NYSED-3181 @NYSED-3180 @NYSEDSprint-25 @US-NYSED-1873 @M05 @santosh
  Scenario Outline: Verify that the Grantee user see Indirect Cost, Award Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Required, Currency Field without decimals, cannot be negative and Blank for new row)
  |Verify that the Grantee user see Indirect Cost, Award Budget Categories modal, having a 'Description' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user see Indirect Cost, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)|
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
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title |                      |
    #NYSED-3182
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title |                      |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | -100                 |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions     | Description    | Proposed Expenditure |
      | Action menu | Position Title | $88,988              |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "Edit" :
      | Description    | Proposed Expenditure |
      | Position Title | 88.989               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions     | Description    | Proposed Expenditure |
      | Action menu | Position Title | $88,989              |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description | Proposed Expenditure |
      |             | 88.988               |
    #NYSED-3181
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description          | Proposed Expenditure |
      | {SavedValue:Char256} | 88.988               |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" :
      | Actions     | Description          | Proposed Expenditure |
      | Action menu | {SavedValue:Char255} | $88,988              |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @NYSED-3179 @NYSED-3178 @NYSED-3172 @NYSEDSprint-25 @US-NYSED-1873 @M05 @santosh
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
    #NYSED-3178
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
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
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    #NYSED-3178
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
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
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
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
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
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
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
  #NYSED-3178
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Budget" sub tab
    #NYSED-3178
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
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
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    #NYSED-3178
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    #NYSED-3178
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    #NYSED-3179
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |