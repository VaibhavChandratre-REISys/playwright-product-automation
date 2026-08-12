@directGrantFromApprovedAnnouncementNysed @DirectGrantSubawardNew @GrantSubawardNysed @grantUpdateFile1
Feature: Validate all scenarios in the award from direct grant approved announcement2

  @NYSED-5904 @NYSED-5905 @NYSED-5906 @NYSED-5907 @NYSED-5908 @US-NYSED-4891 @Nikita @needToReview @passed
  Scenario Outline: Verify that the Internal user sees, on the Monitoring phase, Site Visit/Desk Reviews by Organization report is hidden.
    Given I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    And I click toggle button to select "Reimbursements - All"
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    #NYSED-5904
    Then I softly do not see the left navigation link "Site Visit"
    Then I softly do not see the left navigation link "Desk Reviews"
    Then I softly see the left navigation link "Risk Assessments"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I wait for "2" seconds
    And I navigate to "Monitoring" tab
  #NYSED-5906 #NYSED-5908
    Then I softly do not see the left navigation link "Site Visit"
    Then I softly do not see the left navigation link "Desk Reviews"
    Then I softly do not see the left navigation link "Risk Assessments"
  #NYSED-5905
    Then I softly see toggle option "Reimbursements - All" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Created" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Submitted" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Approved" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    Then I softly see toggle option "Reimbursements - Rejected" inside flex table id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
  #NYSED-5907
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    Then I softly see the left navigation link "Advances"
    Then I softly see the left navigation link "Reimbursements"
    Then I softly do not see the left navigation link "Refunds"

    Examples:
      | Users |
      | PM    |
#      | PO    |
#      | FD    |
#      | FO    |
#      | EXE   |

  @NYSED-530523 @NYSED-530556 @Ankit @NeedToreview
  Scenario Outline:Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Supplies and Materials - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10SUPPLIESANDMATERIALS_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-530523
    When I navigate to "Actuals" sub tab
    Then I softly see "Burn Rate" page block displayed
    Then I softly see field "Percentage of Budget Remaining" inside page block
    Then I softly see field "Remaining Time of Award (%)" inside page block
    #NYSED-530556
    Then I softly see field "Remaining Time of Award (%)" inside page block
    Then I softly see field "Remaining Time of Award (%)" as "0.00%"

    Examples:
      | UserType |
      | FD       |
#      | PO       |
#      | PM       |
#      | FO       |
#      | EXE      |
#      | Admin    |

  @NYSED-3078 @vaibhavchaudhari @passed
  Scenario Outline: Verify that the grantee user see Professional Staff Salaries, Award Budget Categories modal, having a 'Annualized Rate of Pay' column ( Editable, Optional, Currency Field without decimal, cannot negative and Blank for new row)
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
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  |                        | 10                                                 | 1000             |
    Then I softly cannot see the following messages in the page details :
      | Required Fields Missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see "Annualized Rate of Pay" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | Test                   | 10                                                 | 1000             |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | -88                    | 10                                                 | 200              |
    Then I softly see the following messages in the page details contains:
      | Annualized Rate of Pay cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title3         | 10             | 10  | 88.988                 | 10                                                 | 88.988           |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:awardProfessionalSalariesTableID---" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title3         | 10             | 10.00 | $88,988                | $10                                                | $88,988          |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title3         | 98.888                 |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title3         | 10             | 10.00 | $98,888                | $10                                                | $88,988          |
    Examples:
      | Announcement Name                                         | Coordinator | Grantee    |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE |

#  @NYSED-3079 @vaibhavchaudhari @wip @wip-AsPerMatchNoEnhancement
#  Scenario Outline: Verify that the grantee user see Professional Staff Salaries, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)
#    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
#    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
#    Given I login to "As a Grantor" app as "<Coordinator>" user
#    When I navigate to "Announcements" tab
#    And I navigate to "Formula" content inside "Announcements" subheader on left panel
#    And I click toggle button to select "Formula Announcements - All"
#    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
#    And I click on "View" icon for "<Announcement Name>" inside table
#    And I wait for "2" seconds
#    When I navigate to "Overview" sub tab
#    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
#    And I wait for "5" seconds
#    And I enter value "No" into field "NYSED_Contractual__c"
#    And I click modal button "Save and Continue"
#    And I wait for "3" seconds
#    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
#    And I enter value "Automation Grant Description" into field "GrantDescription__c"
#    When I click on "Save" in the page details
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I click on "Edit" in the page details
#    And I navigate to "Overview" sub tab
#    And I generate the random PROJECTID and save as "uniquePROJECTID"
#    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
#    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I get the "EGMS ID"
#    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
#    And I wait for "2" seconds
#    And I navigate to "Budget" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
#      | Funding Account             | Enc Life |
#      | {SavedValue:fundingAccount} | 1000     |
#    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    And I wait for "2" seconds
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Sent To Subrecipient"
#    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
#      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
#      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 500        | 0              |
#    Then I softly see the text containing "Saved Successfully!"
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            |                |
#    Then I softly see the text containing "Saved Successfully!"
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            |                |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | kk         | kk             |
#    Then I softly see the text containing "Enter a valid numeric value."
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            |                |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            | -100           |
#    Then I softly see the text containing "Non-Cash Match cannot be negative."
#    And I click modal button "Close"
#    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | -100       |                |
#    Then I softly see the text containing "Cash Match cannot be negative."
#    And I click modal button "Close"
#    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | 88.88      | 88.88          |
#    Then I softly see the text containing "Saved Successfully!"
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | $8,888     | $8,888         |
#
#    Examples:
#      | Announcement Name                                         | Coordinator | Grantee    |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC |
##      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE |

  @NYSED-3125 @vaibhavchaudhari
  Scenario Outline: Verify that the Grantee user see Purchased Services, Award Budget Categories modal, having a 'Provider/Vendor' column (Editable, Blank for new row, Short text 255 Character and Required)
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Calculation of Cost | Proposed Expenditure |
      | Description of Item/Service | Yes             | Calculation of Cost | 100                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor             | Proposed Expenditure |
      | Description of Item/Service | Yes             | Calculation of Cost | ---AUTOEnvData:-:Char256--- | 100                  |
    And I wait for "5" seconds
    Then I softly see value "Description of Item/Service" for title "Description of Item/Service" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "Yes" for title "Is Subcontract?" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "Calculation of Cost" for title "Calculation of Cost" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Provider/Vendor" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "Edit" :
      | Description of Item/Service | Provider/Vendor |
      | Description of Item/Service | Provider/Vendor |
    Then I softly see value "Description of Item/Service" for title "Description of Item/Service" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "Yes" for title "Is Subcontract?" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "Calculation of Cost" for title "Calculation of Cost" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "Provider/Vendor" for title "Provider/Vendor" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "$100" for title "Proposed Expenditure" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | Grantee    |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE |

  @NYSED-3127 @vaibhavchaudhari @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline:  Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Purchased Services: Direct Grant
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
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
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | Grantee    |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_CE |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_CE |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | ADMIN       | GRANTEE_SC |

  @NYSED-3129 @NYSED-3130 @vaibhavchaudhari
  Scenario Outline: Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Purchased Services' of award, a detailed line item modal is opened and user can see correct columns: Direct Grant
  |Verify that the Grantee user see Purchased Services, Award Budget Categories modal, having a 'Is Subcontract?' column (Picklist: Yes/No, Editable, and Required on Save)|
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
      | Description of Item/Service | Calculation of Cost | Provider/Vendor | 100                  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
      | Description of Item/Service | Yes             | Calculation of Cost | Provider/Vendor | 100                  |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
      | Action menu | Description of Item/Service | Yes             | Calculation of Cost | Provider/Vendor | $100                 |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? |
      | Description of Item/Service | No              |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
      | Action menu | Description of Item/Service | No              | Calculation of Cost | Provider/Vendor | $100                 |
    Examples:
      | Announcement Name                                         | Coordinator | Grantee    |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE |

  @NYSED-3128 @vaibhavchaudhari @NeedtoReview @passed
  Scenario Outline:Verify that when Grantee User click on inline action 'View/Add Line Item Details' for budget category 'Purchased Services' of award, a detailed line item modal is opened and user can see correct columns: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<Announcement Name>"
    And I created approved FDM on application "<Announcement Name>"
    Given I created award from approved FDM with announcement "<Announcement Name>"
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
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |

    Examples:
      | Announcement Name                                | Grantee    | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE | PO          |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC | PM         |

  @NYSED-3126 @vaibhavchaudhari @NeedtoReview @passed @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline:Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Purchased Services: Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "FS10TRAVELEXPENSES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<Announcement Name>"
    And I created approved FDM on application "<Announcement Name>"
    Given I created award from approved FDM with announcement "<Announcement Name>"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
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
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions | Description of Item/Service | Is Subcontract? | Calculation of Cost | Provider/Vendor | Proposed Expenditure |
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:PurchasedServicesTableId---"

    Examples:
      | Announcement Name                                | Coordinator | Grantee    |
      | {SavedValue:Automation Runtime FDM Announcement} | PO          | GRANTEE_CE |
#      | {SavedValue:Automation Runtime FDM Announcement} | PM          | GRANTEE_SC |
#      | {SavedValue:Automation Runtime FDM Announcement} | FD          | GRANTEE_CE |
#      | {SavedValue:Automation Runtime FDM Announcement} | FO          | GRANTEE_SC |
#      | {SavedValue:Automation Runtime FDM Announcement} | EXE         | GRANTEE_CE |
#      | {SavedValue:Automation Runtime FDM Announcement} | ADMIN       | GRANTEE_SC |

#  @NYSED-3183 @Ankit @executionRemaining @wip @wip-AsPerMatchNoEnhancement
#  Scenario Outline:Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Indirect Cost - Award created from FDM
#    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
#    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
#    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10INDIRECTCOST_BUDGETCATEGORY"
#    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
#    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
#    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
#    When I login to "As a Grantor" app as "FD" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
#    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
#    And I wait for "2" seconds
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I navigate to "Responsibilities" sub tab
#    And I wait for "2" seconds
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
#      | Name          | Name          | Award  |
#      | Automation PM | Automation FD | Step 1 |
#    And I navigate to "Management" sub tab
#    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
#    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
#    When I click on "Save and Continue" in the page details
#    And I wait for "2" seconds
#    And I navigate to "Overview" sub tab
#    And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    When I click on "Activate" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Active"
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
#    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
#    And I wait for "2" seconds
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I wait for "2" seconds
#    And I wait for "2" seconds
#    And I click on "Submit for Approval" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Submitted for Approval"
#    And I wait for "3" seconds
#    And I "Approve" in the approval decision
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Approved"
#    When I click on "Generate GAN" in the page details
#    And I pause execution for "5" seconds
#    And I refresh the page
#    And I wait for "3" seconds
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
#    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    Then I softly do not see column header "Cash Match" inside table "---subAwardStandAlone:-:SubAwardBudgetCategoryFlexGrid---"
#    Then I softly do not see column header "Non-Cash Match" inside table "---subAwardStandAlone:-:SubAwardBudgetCategoryFlexGrid---"
#    Then I softly do not see column header "Total Match" inside table "---subAwardStandAlone:-:SubAwardBudgetCategoryFlexGrid---"
#    Then I softly do not see column header "Total Project Cost" inside table "---subAwardStandAlone:-:SubAwardBudgetCategoryFlexGrid---"
#    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:SubAwardBudgetCategoryFlexGrid---"
#    And I wait for "2" seconds
#    Then I softly see the text containing "Budget Category : Indirect Cost"
#    Then I softly do not see column header "Cash Match" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#    Then I softly do not see column header "Non-Cash Match" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#    Then I softly do not see column header "Total Match" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#    Then I softly do not see column header "Total Project Cost" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
#    And I wait for "2" seconds
#    And I navigate to "Budget" sub tab
#    Then I softly do not see column header "Cash Match" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly do not see column header "Non-Cash Match" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly do not see column header "Total Match" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly do not see column header "Total Project Cost" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    And I wait for "2" seconds
#    Then I softly see the text containing "Budget Category : Indirect Cost"
#    Then I softly do not see column header "Cash Match" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#    Then I softly do not see column header "Non-Cash Match" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#    Then I softly do not see column header "Total Match" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#    Then I softly do not see column header "Total Project Cost" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
#
#    Examples:
#      | ExternalUser |
#      | GRANTEE_SC   |

  @NYSED-3185 @passed
  Scenario Outline:Verify that users (Internal and Grantee) can not see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Supplies and Materials - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FS10INDIRECTCOST_BUDGETCATEGORY"
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
      #NYSED-3185
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly see column header "Description" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:AwardIndirectCostTableId---"

    Examples:
      | UserType | ExternalUser |
      | PO       | GRANTEE_SC   |
#      | PM          |GRANTEE_LEA  |
#      | FO          |GRANTEE_VO   |
#      | FD          |GRANTEE_CE   |

#  @NYSED-3141 @NYSEDSprint-25 @US-NYSED-1870 @M05 @Pranita @NeedToRaiseBug
#  Scenario Outline: Validate that the grantee user see Supplies and Materials, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)
#    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
#    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
#    Given I login to "As a Grantor" app as "<Coordinator>" user
#    When I navigate to "Announcements" tab
#    And I navigate to "Formula" content inside "Announcements" subheader on left panel
#    And I click toggle button to select "Formula Announcements - All"
#    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
#    And I click on "View" icon for "<Announcement Name>" inside table
#    And I wait for "2" seconds
#    When I navigate to "Overview" sub tab
#    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
#    And I wait for "5" seconds
#    And I click modal button "Save and Continue"
#    And I wait for "3" seconds
#    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
#    And I wait for "5" seconds
#    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
#    And I wait for "5" seconds
#    When I click on "Save" in the page details
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I click on "Edit" in the page details
#    And I wait for "2" seconds
#    And I navigate to "Overview" sub tab
#    And I generate the random PROJECTID and save as "uniquePROJECTID"
#    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
#    And I wait for "10" seconds
#    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
#    And I wait for "10" seconds
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I get the "EGMS ID"
#    Then I softly see field "Status" as "Created"
#    And I navigate to "Budget" sub tab
#    Then I softly can see page block "Subaward budget"
#    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
#    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
#    And I wait for "4" seconds
#    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    And I click modal button "Close"
#    When I navigate to "Overview" sub tab
#    And I wait for "10" seconds
#    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Sent To Subrecipient"
#    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    And I wait for "3" seconds
#    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    And I wait for "2" seconds
#    Then I softly see column header "Actions" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Description of Item/Service" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Quantity" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Unit Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Additional Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Calculated Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Cash Match" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Non-Cash Match" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Total Match" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see column header "Total Project Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    And I wait for "2" seconds
#    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    And I wait for "3" seconds
#    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see the following messages in the page details :
#      | Required Fields Missing |
#    And I refresh the page
#    And I navigate to "Budget" sub tab
#    And I wait for "3" seconds
#    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    And I wait for "2" seconds
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
#      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Description of Item         | 200                                                      | 2        | 100       | 100              | 1000                 | 0          | 0              |
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    Then I softly see value "$0" for title "Cash Match" against the value "Description of Item" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "$0" for title "Non-Cash Match" against the value "Description of Item" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
#      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Description of Item         | 200                                                      | 2        | 100       | 100              | 1000                 | -10        | -10            |
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details contains:
#      | Non-Cash Match cannot be negative. |
#      | Cash Match cannot be negative.     |
#    And I refresh the page
#    And I navigate to "Budget" sub tab
#    And I wait for "3" seconds
#    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    And I wait for "2" seconds
#    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
#      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Description of Item         | 200                                                      | 2        | 100       | 100              | 1000                 | BB1        | ABC12          |
#    Then I softly see the text containing "Enter a valid numeric value."
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    And I refresh the page
#    And I navigate to "Budget" sub tab
#    And I wait for "3" seconds
#    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "Edit" :
#      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Description of Item         | 200                                                      | 2        | 100       | 100              | 100                  | 99.11      | 77.099         |
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    Then I softly see value "$9,911" for title "Cash Match" against the value "Description of Item" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "$77,099" for title "Non-Cash Match" against the value "Description of Item" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    When I click on "Delete" icon for "Description of Item" inside flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" without waiting for record
#    Then I do not see values "Description of Item" and "Description of Item/Service" inside table
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
#      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Description of Item         | 200                                                      | 2        | 100       | 100              | 2000                 | 100        | 99             |
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    Then I softly see value "Description of Item" for title "Description of Item/Service" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "2.00" for title "Quantity" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "$100" for title "Unit Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "$100" for title "Additional Cost" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "$2,000" for title "Proposed Expenditure" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "$100" for title "Cash Match" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#    Then I softly see value "$99" for title "Non-Cash Match" inside table "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---"
#
#    Examples:
#      | Announcement Name                                         | Coordinator | ExternalUser |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3096 @M05 @Ankit
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
  |Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM|
  |Verify that Internal User (FD Profile) cannot add / update / delete the added budget under the budget category. - Award created from FDM|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
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
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    #NYSED-3096
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see "Subaward budget" page block displayed
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Support Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-3097 @M05 @Ankit
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
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
    Then I softly see field "Status" as "Sent to Subrecipient"
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
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
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
    Then I softly see "Subaward budget" page block displayed
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3098 @M05 @Ankit @passed
  Scenario Outline:Verify that Internal User (FD Profile) can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
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
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
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
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see "Subaward budget" page block displayed
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see value "Position Title" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3105 @M05 @Ankit @wip @wip-AsPerMatchNoEnhancement
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I wait for "10" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
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
    And I wait for "2" seconds
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I see only the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3070 @M05 @Ankit
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
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
    Then I softly see field "Status" as "Sent to Subrecipient"
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
    And I save the value from row "1" for column name "Specific Position/Title" as "Professional Staff Salaries" from flex table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Professional Staff Salaries}" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Professional Staff Salaries}" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:Professional Staff Salaries}" in flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3101 @M05 @Ankit @passed
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
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
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I wait for "3" seconds
    Then I softly see fields "Quantity__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title     | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | ---AUTOEnvData:-:Char256--- | 200            | 2   | 100                    | 100                                                | 99               |
    And I wait for "5" seconds
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    And I click modal button "Close"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3102 @M05 @Ankit @passed
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
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
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see fields "Quantity__c" is in edit mode
    And I wait for "2" seconds
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Automation              | 200            | eee | 100                    | 100                                                | 99               |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Automation              | 200            | -34 | 100                    | 100                                                | 99               |
    Then I softly see the text containing "FTE cannot be negative."
    When I click on "Delete" icon for "Automation" inside flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Automation              | 200            | 88.99 | 100                    | 100                                                | 99               |
    Then I softly see value "88.99" for title "FTE" against the value "Automation" inside table "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I click on "Delete" icon for "Automation" inside flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @544431 @US-528039 @Nikita @passed
  Scenario: Verify  that the FD Profile "Manage Holds" button able to see on Active grant - Via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I softly can see top right button "Manage Holds" in page detail

  @544433 @US-528039 @Nikita
  Scenario: Scenario: Verify  that the FD Profile "Manage Holds" button able to see on Active grant - Via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Contract Stop" as "{Date:M/d/yyyy::d+50}"
    Then I softly can see top right button "Manage Holds" in page detail
    When I click on "Manage Holds" in the page details
    Then I softly see "Manage Holds" opens in overLay window
    Then I softly see "View/Edit" page block displayed
    Then I softly see fields "NYSED_ContractStop__c" is in edit mode
    And I enter value "{Date:M/d/yyyy}" into field "NYSED_ContractStop__c"
    When I click on "Save" in the page details
    When I close "Manage Holds" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly see field "Contract Stop" as "{Date:M/d/yyyy}"

  @544429 @US-528039 @Nikita
  Scenario: Verify  that the FD Profile "Manage Holds" button able to see on Active grant - Via FDM
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
    When I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "Edit" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see "Grant Details" page block displayed
    Then I see below fields in "Grant Details" page block
      | First Payment % | Contract Stop |
    Then I softly see fields "NYSED_ContractStop__c" is in edit mode

  @544432 @US-528039 @Nikita @passed
  Scenario Outline: Verify that the Internal User "Manage Holds" button unable to see on Active grant other than FD Profile - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Manage Holds" in page detail

    Examples:
      | Users |
      | PM    |
#      | PO    |
#      | EXE   |
#      | FO    |

  @544434 @US-528039 @Nikita @passed
  Scenario: Verify that the Internal User Updated date in  'Contract Stop' field then date get updated in Grant page layout - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I wait for "4" seconds
    Then I softly see field "Contract Stop" as "{Date:M/d/yyyy::d+50}"
    Then I softly can see top right button "Manage Holds" in page detail
    When I click on "Manage Holds" in the page details
    Then I softly see "Manage Holds" opens in overLay window
    Then I softly see "View/Edit" page block displayed
    Then I softly see fields "NYSED_ContractStop__c" is in edit mode
    And I enter value "{Date:M/d/yyyy}" into field "NYSED_ContractStop__c"
    When I click on "Save" in the page details
    When I close "Manage Holds" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly see field "Contract Stop" as "{Date:M/d/yyyy}"

  @NYSED-3187 @VerifyTravelExpenses @M05
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Travel Expenses' - Send to Subrecipient award
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 88.988               |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $88,988              |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
      | Position of Traveler | Proposed Expenditure |
      | Position Title       | 100                  |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $100                 |
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

#  @NYSED-3100 @NYSEDSprint-28 @US-NYSED-1867 @M05 @Dilip @wip @wip-AsPerMatchNoEnhancement
#  Scenario Outline: 541468 - Verify that the grantee user see Support Staff Salaries, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)
#    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
#    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
#    Given I login to "As a Grantor" app as "<Coordinator>" user
#    When I navigate to "Announcements" tab
#    And I navigate to "Formula" content inside "Announcements" subheader on left panel
#    And I click toggle button to select "Formula Announcements - All"
#    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
#    And I click on "View" icon for "<Announcement Name>" inside table
#    And I wait for "2" seconds
#    When I navigate to "Overview" sub tab
#    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
#    And I wait for "5" seconds
#    And I enter value "No" into field "NYSED_Contractual__c"
#    And I click modal button "Save and Continue"
#    And I wait for "3" seconds
#    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
#    And I enter value "Automation Grant Description" into field "GrantDescription__c"
#    When I click on "Save" in the page details
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I click on "Edit" in the page details
#    And I navigate to "Overview" sub tab
#    And I generate the random PROJECTID and save as "uniquePROJECTID"
#    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
#    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I get the "EGMS ID"
#    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
#    And I wait for "2" seconds
#    And I navigate to "Budget" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
#      | Funding Account             | Enc Life |
#      | {SavedValue:fundingAccount} | 1000     |
#    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    And I wait for "2" seconds
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Sent To Subrecipient"
#    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
#      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
#      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 500        | 0              |
#    Then I softly see the text containing "Saved Successfully!"
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            |                |
#    Then I softly see the text containing "Enter a valid numeric value."
#    Then I softly see the text containing "Saved Successfully!"
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            |                |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | kk         | kk             |
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            |                |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          |            | -100           |
#    Then I softly see the text containing "Non-Cash Match cannot be negative."
#    And I click modal button "Close"
#    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | -100       |                |
#    Then I softly see the text containing "Cash Match cannot be negative."
#    And I click modal button "Close"
#    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | 88.88      | 88.88          |
#    Then I softly see the text containing "Saved Successfully!"
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
#      | Specific Position/Title | Cash Match | Non-Cash Match |
#      | Position Title          | $8,888     | $8,888         |
#
#    Examples:
#      | Announcement Name                                         | Coordinator | Grantee    |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE |
##      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC |

  @NYSED-3099 @NYSEDSprint-28 @US-NYSED-1867 @M05 @Dilip
  Scenario Outline:541466 - Verify that the grantee user see Support Staff Salaries, Award Budget Categories modal, having a 'Annualized Rate of Pay' column ( Editable, Optional, Currency Field without decimal, cannot negative and Blank for new row)
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    When I re-login to "Grants Portal" app as "<Grantee>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see "Annualized Rate of Pay" in flex table header "---subAwardStandAlone:-:SupportStaffSalariesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  |                        | 10                                                 | 1000             |
    Then I softly see the text containing "Saved Successfully!"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | Annualized Rate of Pay |
      | Position Title          | 10             | KKK                    |
    Then I softly see the text containing "Enter a valid numeric value."
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | Annualized Rate of Pay |
      | Position Title          | 10             | -100                   |
    Then I softly see the text containing "Annualized Rate of Pay cannot be negative."
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | Annualized Rate of Pay |
      | Position Title          | 10             | 87.88                  |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | $8,788                 |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions | Annualized Rate of Pay |
      | Position Title          | 10             | 8888                   |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:SupportStaffSalariesTableId---" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | $8,888                 |

    Examples:
      | Announcement Name                                         | Coordinator | Grantee    |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC |

  @NYSED-3119 @NYSED-3120 @M05
  Scenario Outline:Verify that Internal User can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Direct Grant
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
    And I wait for "10" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I navigate to "Budget" sub tab
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
    Then I softly see top right button "New" inside flex table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $200                 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $200                 |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    #NYSED-3119
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
     #NYSED-3120
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3112 @Prajwal @M05
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Travel Expenses' - Send to Subrecipient award
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
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3112
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $1000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      |             | Total                       |                 |                      |                     | $1,000               |
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item1        | Yes             | Provider of Services | Calculation of Cost | $1000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      | Action menu | Description of Item1        | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      |             | Total                       |                 |                      |                     | $2,000               |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item2        | Yes             | Provider of Services | Calculation of Cost | $1000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      | Action menu | Description of Item1        | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      | Action menu | Description of Item2        | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      |             | Total                       |                 |                      |                     | $3,000               |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure |
      | Description of Item2        | 1200                 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      | Action menu | Description of Item1        | Yes             | Provider of Services | Calculation of Cost | $1,000               |
      | Action menu | Description of Item2        | Yes             | Provider of Services | Calculation of Cost | $1,200               |
      |             | Total                       |                 |                      |                     | $3,200               |
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click on "Delete" icon for "Description of Item" inside flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    When I navigate to "Budget" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category                  | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries      | 15                   | $0           |
      | Action menu | Support Staff Salaries           | 16                   | $0           |
      | Action menu | Purchased Services               | 40                   | $2,200       |
      | Action menu | Supplies and Materials           | 45                   | $0           |
      | Action menu | Travel Expenses                  | 46                   | $0           |
      | Action menu | Employee Benefits                | 80                   | $0           |
      | Action menu | Indirect Cost                    | 90                   | $0           |
      | Action menu | BOCES Purchased Services         | 49                   | $0           |
      | Action menu | Minor Remodeling                 | 30                   | $0           |
      | Action menu | Equipment                        | 20                   | $0           |
      |             | Focus Area : <Announcement Name> |                      | $2,200       |
      |             | Total                            |                      | $2,200       |
      |             | Grand Total                      |                      | $2,200       |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3119 @NYSED-3120 @Prajwal @M05
  Scenario Outline:Verify that Internal User can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Direct Grant
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
    And I wait for "10" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I navigate to "Budget" sub tab
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
    Then I softly see top right button "New" inside flex table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $200                 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:PurchasedServicesTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $200                 |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    #NYSED-3119
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    #NYSED-3120
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3195 @NYSEDSprint-25 @US-NYSED-1873 @M05
  Scenario Outline:  Verify that Internal User can see the 'View/Add Line Item Details' inline action in all states of Award and not able to add the new budget line item. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I enter value "90" into field "ApprovedbyODon__c"
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
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 1000                 |
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
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I wait for "3" seconds
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
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "4" seconds
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
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
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
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Edit" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly cannot see row level action button "Delete" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Traveler" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3197 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita
  Scenario Outline: Verify that the Grantee user see Travel Expenses, Award Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, Short text 255 Character and Required)
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
      | Position Title       | Destination | Purpose | Automation Benefits- 1          |                     | 1000                 |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I wait for "2" seconds
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 1000                 |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost         | Proposed Expenditure |
      | Position Title2      | Destination | Purpose | Automation Benefits- 1          | ---AUTOEnvData:-:Char256--- | 88.988               |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Calculation of Cost" against the value "Purpose" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3199 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita
  Scenario Outline: Verify that the Grantee user see Travel Expenses, Award Budget Categories modal, having a 'Destination' column (Editable, Blank for new row, Short text 255 Character and Required)
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
      | Position Title       |             | Purpose | Automation Benefits- 1          | Calculation         | 88.988               |
    Then I softly see the text containing "Complete this field."
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I wait for "2" seconds
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination                 | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | ---AUTOEnvData:-:Char256--- | Purpose | Automation Benefits- 1          | Calculation         | 100                  |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Destination" against the value "Purpose" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
      | Position of Traveler | Destination |
      | Position Title       | Destination |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $100                 |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3200 @NYSED-3207 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita
  Scenario Outline: Verify that the Grantee user see Travel Expenses, Award Budget Categories modal, having a 'Purpose' column (Editable, Blank for new row, Short text 255 Character and Required)
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    #NYSED-3207
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination |         | Automation Benefits- 1          | Calculation         | 88.988               |
    Then I softly see "Required fields missing" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose                     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination | ---AUTOEnvData:-:Char256--- | Automation Benefits- 1          | Calculation         | 100                  |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
      | Position of Traveler | Purpose |
      | Position Title       | Purpose |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $100                 |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

#  @NYSED-3084 @NYSEDSprint-25 @US-NYSED-1867 @M05 @Pranita @wip @wip-AsPerMatchNoEnhancement
#  Scenario Outline: Validate that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Professional Staff Salaries: Direct Grant
#    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
#    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
#    Given I login to "As a Grantor" app as "<Coordinator>" user
#    When I navigate to "Announcements" tab
#    And I navigate to "Formula" content inside "Announcements" subheader on left panel
#    And I click toggle button to select "Formula Announcements - All"
#    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
#    And I click on "View" icon for "<Announcement Name>" inside table
#    And I wait for "2" seconds
#    When I navigate to "Overview" sub tab
#    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
#    And I wait for "5" seconds
#    And I click modal button "Save and Continue"
#    And I wait for "3" seconds
#    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
#    And I wait for "3" seconds
#    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I click on "Edit" in the page details
#    And I navigate to "Overview" sub tab
#    And I generate the random PROJECTID and save as "uniquePROJECTID"
#    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
#    And I wait for "3" seconds
#    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
#    And I wait for "3" seconds
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I get the "EGMS ID"
#    And I navigate to "Budget" sub tab
#    Then I softly can see page block "Subaward budget"
#    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
#    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
#    Then I see only the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
#      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
#    And I wait for "4" seconds
#    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    And I refresh the page
#    When I navigate to "Overview" sub tab
#    And I wait for "10" seconds
#    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Sent To Subrecipient"
#    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    And I wait for "2" seconds
#    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
#    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
#    Then I see only the following headers in table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" :
#      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
#    And I wait for "4" seconds
#    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#    Then I softly do not see "Total Project Cost" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
#
#    Examples:
#      | Announcement Name                                         | Coordinator | ExternalUser |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3088 @NYSEDSprint-25 @US-NYSED-1867 @M05
  Scenario Outline: Verify that the grantee user see Professional Staff Salaries, Award Budget Categories modal, having a Additional Cost (e.g., Per Diem, Teacher Stipends) column (Editable, Optional, Currency Field without decimal, cannot negative and Blank for new row)
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
    And I wait for "7" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    And I wait for "2" seconds
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
    And I wait for "2" seconds
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
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see "Additional Cost (e.g., Per Diem, Teacher Stipends)" in flex table header "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 5              | 12  | 100                    |                                                    | 1000             |
    Then I softly see value "$0" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly cannot see the following messages in the page details :
      | Required Fields Missing |
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 5              | 12  | 100                    | test                                               | 1000             |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 12  | 100                    | 44.5                                               | 1000             |
    Then I softly see value "$445" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 34             | 12  | 100                    | -100                                               | 1000             |
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 75             | 12  | 100                    | 100                                                | 1000             |
    Then I softly see value "$100" for title "Additional Cost (e.g., Per Diem, Teacher Stipends)" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3187 @NYSED-3188 @NYSED-3189 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita @ReviewReamaining
  Scenario Outline: Verify that Grantee User can add / update / delete details under budget category 'Travel Expenses' - Send to Subrecipient award
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
    #NYSED-3187
    And I navigate to "Budget" sub tab
    #NYSED-3189
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    #NYSED-3188
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 1000                 |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title2      | Destination | Purpose | Automation Benefits- 1          | Calculation         | 1000                 |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title2      | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title3      | Destination | Purpose | Automation Benefits- 1          | Calculation         | 1000                 |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title3      | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
      | Position of Traveler | Proposed Expenditure |
      | Position Title       | 100                  |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title2      | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |
      | Action menu | Position Title3      | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $100                 |
      |             | Total                |             |         |                                 |                     | $2,100               |
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    And I click on "Delete" icon for "Position Title" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    When I navigate to "Budget" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category                  | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries      | 15                   | $0           |
      | Action menu | Support Staff Salaries           | 16                   | $0           |
      | Action menu | Purchased Services               | 40                   | $0           |
      | Action menu | Supplies and Materials           | 45                   | $0           |
      | Action menu | Travel Expenses                  | 46                   | $2,000       |
      | Action menu | Employee Benefits                | 80                   | $0           |
      | Action menu | Indirect Cost                    | 90                   | $0           |
      | Action menu | BOCES Purchased Services         | 49                   | $0           |
      | Action menu | Minor Remodeling                 | 30                   | $0           |
      | Action menu | Equipment                        | 20                   | $0           |
      |             | Focus Area : <Announcement Name> |                      | $2,000       |
      |             | Total                            |                      | $2,000       |
      |             | Grand Total                      |                      | $2,000       |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3205 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita
  Scenario Outline:Verify that users (Internal and Grantee) cannot see Cash Match and Non Cash Match columns if Subrecipient Match is set as No on the announcement: Travel Expenses. - Direct Grant
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Grand Total                 |                      | $0           |
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
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
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Grand Total                 |                      | $0           |
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3202 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita
  Scenario Outline:Verify that the Grantee user see Travel Expenses, Award Budget Categories modal, having a 'Type (Air, Bus, Train, Mileage)' column (Editable, Blank for new row, Short text 255 Character and Required)
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
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
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
      | Position Title       | Destination | Purpose |                                 | Calculation         | 88.988               |
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
      | Position Title       | Destination | Purpose | ---AUTOEnvData:-:Char256---     | Calculation         | 1000                 |
    Then I softly see "Saved Successfully!" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | ---AUTOEnvData:-:Char255---     | Calculation         | $1,000               |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
      | Position of Traveler | Type (Air, Bus, Train, Mileage) |
      | Position Title       | Automation Benefits- 1          |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $1,000               |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-3762 @NYSED-3763 @NYSED-3764 @NYSED-3765 @US-NYSED-3451 @M05 @VaibhavChandratate
  Scenario Outline: Verify that the Performance tab is not visible to the Internal users on the Subaward layout Direct Grant Award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
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
    Then I softly cannot see "Performance" sub tab at view detail page
    When I navigate to "Overview" sub tab
    #NYSED-3763
    Then I softly see "Contacts" page block displayed
#    Then I softly see "Goals and Objectives" page block displayed
#    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
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
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
#    #NYSED-3764
#    When I click on "Remove" icon for "{SavedValue:AutomationObjective}" inside flex table with id "---subAwardStandAlone:-:objectivesTableId---"
#    Then I softly see the following messages in the page details contains:
#      | Record removed successfully. |
#    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:objectivesTableId---"
#    And I click on "Send to Grant Finance Office" in the page details
#    And I wait for "4" seconds
#    Then I softly see the following messages in the page details contains:
#      | Overview Tab - Associate at least one Objective if Objective is required on the Grant. |
#    #NYSED-3765
#      | Overview Tab - Enter Target values in the Key Performance Indicators (KPIs) section.   |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see "Performance" sub tab at view detail page
    When I navigate to "Overview" sub tab
    #NYSED-3763
    Then I softly see "Contacts" page block displayed
#    Then I softly see "Goals and Objectives" page block displayed
#    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see "Performance" sub tab at view detail page
    When I navigate to "Overview" sub tab
    #NYSED-3763
    Then I softly see "Contacts" page block displayed
#    Then I softly see "Goals and Objectives" page block displayed
#    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see "Performance" sub tab at view detail page
    When I navigate to "Overview" sub tab
    #NYSED-3763
    Then I softly see "Contacts" page block displayed
#    Then I softly see "Goals and Objectives" page block displayed
#    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see "Performance" sub tab at view detail page
    When I navigate to "Overview" sub tab
    #NYSED-3763
    Then I softly see "Contacts" page block displayed
#    Then I softly see "Goals and Objectives" page block displayed
#    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3134 @NYSED-3135 @Nikita
  Scenario Outline: 541288 - Verify that Grantee User cannot add / update / delete details under budget category 'Supplies and Materials' apart from Send to Subrecipient award state - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
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
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    Then I softly see "Subaward Budget Category" opens in overLay window
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SuppliesAndMaterialsTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure |
      | Description of Item         | 200                                                      | 2        | 100       | 100             | 1000                 |
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I pause execution for "2" seconds
    #NYSED-3135
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    #NYSED-3135
    When I re-login to "Grants Portal" app as "<UserType1>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    #NYSED-3134
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | UserType    | UserType1  |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | GRANTEE_LEA | GRANTEE_VO |

#  @NYSED-3198 @NYSEDSprint-25 @US-NYSED-1871 @M05 @Yogita @wip @wip-AsPerMatchNoEnhancement
#  Scenario Outline: Verify that the Grantee user see Travel Expenses, Award Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)
#    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
#    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
#    Given I login to "As a Grantor" app as "<Coordinator>" user
#    When I navigate to "Announcements" tab
#    And I navigate to "Formula" content inside "Announcements" subheader on left panel
#    And I click toggle button to select "Formula Announcements - All"
#    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
#    And I click on "View" icon for "<Announcement Name>" inside table
#    And I wait for "2" seconds
#    When I navigate to "Overview" sub tab
#    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
#    And I wait for "5" seconds
#    And I enter value "No" into field "NYSED_Contractual__c"
#    And I click modal button "Save and Continue"
#    And I wait for "3" seconds
#    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
#    And I enter value "Automation Grant Description" into field "GrantDescription__c"
#    When I click on "Save" in the page details
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I click on "Edit" in the page details
#    And I navigate to "Overview" sub tab
#    And I generate the random PROJECTID and save as "uniquePROJECTID"
#    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
#    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I get the "EGMS ID"
#    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
#    And I wait for "2" seconds
#    And I navigate to "Budget" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
#      | Funding Account             | Enc Life |
#      | {SavedValue:fundingAccount} | 1000     |
#    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
#    And I navigate to "Budget" sub tab
#    And I wait for "2" seconds
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Sent To Subrecipient"
#    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
#    And I navigate to "Budget" sub tab
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    And I wait for "3" seconds
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | test        | Purpose | Automation Benefits- 1          | of                  | 88.988               |            | 10             |
#    And I wait for "3" seconds
#    Then I softly see the following messages in the page details :
#      | Saved Successfully! |
#    And I click on "Delete" icon for "Traveler" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | Record deleted successfully. |
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | test        | Purpose | Automation Benefits- 1          | of                  | 88.988               | -10        | 10             |
#    Then I softly see the following messages in the page details contains:
#      | Cash Match cannot be negative. |
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | test        | Purpose | Automation Benefits- 1          | of                  | 88.988               | test       | 10             |
#    Then I softly see the text containing "Enter a valid numeric value."
#    And I click on "Delete" icon for "Traveler" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | Record deleted successfully. |
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | test        | Purpose | Automation Benefits- 1          | of                  | 88.988               | 10.9888    | 10             |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    Then I softly see value "$109,888" for title "Cash Match" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
#    And I wait for "2" seconds
#    And I click on "Delete" icon for "Traveler" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | Record deleted successfully. |
#    And I click modal button "Close"
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 100                  | 10         | 100            |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
#      | Position of Traveler | Cash Match |
#      | Traveler             | 100        |
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
#      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
#      | Action menu | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | $100                 | $100       | $100           | $200        | $300               |
#    And I click on "Delete" icon for "Traveler" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | Record deleted successfully. |
#    And I click modal button "Close"
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    And I wait for "3" seconds
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 100                  | 10         |                |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    And I click on "Delete" icon for "Traveler" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | Record deleted successfully. |
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 88.988               | 10         | -10            |
#    Then I softly see the following messages in the page details contains:
#      | Non-Cash Match cannot be negative. |
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 88.988               | 10         | test           |
#    Then I softly see the text containing "Enter a valid numeric value."
#    And I click on "Delete" icon for "Traveler" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | Record deleted successfully. |
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 88.988               | 10         | 10.9888        |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    Then I softly see value "$109,888" for title "Non-Cash Match" inside table "---subAwardStandAlone:-:AwardTravelExpensesTableId---"
#    And I click on "Delete" icon for "Traveler" inside flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" without waiting for record
#    Then I softly see the following messages in the page details contains:
#      | Record deleted successfully. |
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "New" :
#      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
#      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 100                  | 100        | 100            |
#    Then I softly see the following messages in the page details contains:
#      | Saved Successfully! |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" by clicking "Edit" :
#      | Position of Traveler | Non-Cash Match |
#      | Traveler             | 100            |
#    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:AwardTravelExpensesTableId---" :
#      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
#      | Action menu | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | $100                 | $100       | $100           | $200        | $300               |
#      |             | Total                |             |         |                                 |                     | $100                 | $100       | $100           | $200        | $300               |
#
#    Examples:
#      | Announcement Name                                         | Coordinator |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |