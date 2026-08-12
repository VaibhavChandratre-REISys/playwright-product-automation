@directGrantFromApprovedAnnouncementNysed @announcementExecution @announcementUAT @GrantSubawardNysed @grantUpdateFile2
Feature: Validate all scenarios in the award from direct grant approved announcement

  @NYSED-3138 @NYSEDSprint-25 @US-NYSED-1870 @M05 @Profanity @runforNY
  Scenario Outline: Validate that Internal User (FD Profile) cannot see the 'View/Add Line Item Details' inline action in all states of Award if 'Is a Detailed Budget Required on the Subaward?': NO and not able to add the new budget. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Subaward budget"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I wait for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Complete Review" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Reviewed"
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I click on "Send to Subrecipient" in the page details
    And I get the "EGMS ID"
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    And I click toggle button to select "Subawards - All"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"

    Examples:
      | Announcement Name                                | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FD          | GRANTEE_SC   |

  @NYSED-3138_1 @NYSEDSprint-25 @US-NYSED-1870 @M05 @Pranita @runforNY
  Scenario Outline: Validate that Internal User (FD Profile) cannot see the 'View/Add Line Item Details' inline action in Rejected states of Award if 'Is a Detailed Budget Required on the Subaward?': NO and not able to add the new budget. - Award created from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    And I wait for "10" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly can see page block "Subaward budget"
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on "Reject" in the page details without processing
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I wait for "5" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Subaward budget"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"

    Examples:
      | Announcement Name                                | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FD          | GRANTEE_SC   |