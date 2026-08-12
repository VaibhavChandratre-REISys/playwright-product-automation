@appReviewNysed
Feature: Validate all scenarios in the Application Review

  @492330 @VerifythatonFDMrecordInternalusercanseecolumnsAppropriationamountandAvailablebalanceareaddedonfundingaccountsreadonlyavailablewithtotalsandcorrectvaluesshouldshowupfromtherelatedfundingaccounts @Sprint-01 @US-4879309
  Scenario Outline: Verify that on FDM record Internal user can see columns 'Appropriation amount' and 'Available balance' are added on funding accounts - read-only , available with totals and correct values should show up from the related funding accounts
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime FDM Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccount1}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount1}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    Then I softly see "Funding Account" in flex table header "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see "Appropriation Amount" in flex table header "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see "Appropriation Amount" in flex table header "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see "FDM Pre-Encumbrance" in flex table header "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see "Encumbrance Balance" in flex table header "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see "Spent" in flex table header "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see "Pre-Encumbrance Balance" in flex table header "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Appropriation Amount" as "AppropriationAmount1"
    And I save the field labeled "Available Balance" as "AvailableBalance1"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    And I save the field labeled "Appropriation Amount" as "AppropriationAmount2"
    And I save the field labeled "Available Balance" as "AvailableBalance2"
    And I click on back arrow
    Then I softly see value "{SavedValue:AppropriationAmount1}" for title "Appropriation Amount" against the value "{SavedValue:fundingAccount}" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see value "{SavedValue:AppropriationAmount2}" for title "Appropriation Amount" against the value "{SavedValue:fundingAccount1}" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I save the value from row "1" for column name "Appropriation Amount" as "AppropriationAmount1" from flex table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I save the value from row "2" for column name "Appropriation Amount" as "AppropriationAmount2" from flex table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I save the value from row "3" for column name "Appropriation Amount" as "Total" from flex table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see addition of two fields "{SavedValue:AppropriationAmount1}" and "{SavedValue:AppropriationAmount2}" is equal to "{SavedValue:Total}"
    Then I softly see value "{SavedValue:AvailableBalance1}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see value "{SavedValue:AvailableBalance2}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance1" from flex table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance2" from flex table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I save the value from row "3" for column name "Available Balance" as "BalanceTotal" from flex table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly see addition of two fields "{SavedValue:AvailableBalance1}" and "{SavedValue:AvailableBalance2}" is equal to "{SavedValue:BalanceTotal}"

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |

  @505800 @Sprint-06 @US-501279
  Scenario Outline: Verify that Fund Year field is added at announcement list view, next to Announcement Name Column.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmTableId---" :
      | Actions | EGMS ID | Announcement Title | Announcement Fund Year | # Applications | Status |
    And I wait for "3" seconds
    And I click toggle button to select "Funding Decision Memos (FDM) - Submitted"
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmTableId---" :
      | Actions | EGMS ID | Announcement Title | Announcement Fund Year | # Applications | Status |
    And I wait for "3" seconds
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmTableId---" :
      | Actions | EGMS ID | Announcement Title | Announcement Fund Year | # Applications | Status |
    And I wait for "3" seconds
    And I click toggle button to select "Funding Decision Memos (FDM) - Created"
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmTableId---" :
      | Actions | EGMS ID | Announcement Title | Announcement Fund Year | # Applications | Status |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @538751 @538752 @NYSEDSprint-14 @US-525073 @M05 @October2025
  Scenario Outline:Verify that 'Initiate Review Process' action is visible to the announcement owner only.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 500    | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 0      | 0          | 0              |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    #538751
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #538751
    Then I softly see value "In Progress" for title "Status" against the value "Program Office Review" inside table "---applicationReview:-:reviewStepsTableId---"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    #538751
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    Then I softly cannot see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"

    Examples:
      | Coordinator |
      | PO          |

  @540044 @NYSED-2795-RI @NYSED-2794-RI @NYSED-2788-RI @NYSED-2780-RI @NYSED-2928-RI @NYSEDSprint-15 @US-528127 @NYSEDSprint-25 @US-NYSED-1854 @US-NYSED-1860 @M05 @October2025
  Scenario Outline: Verify that the 'Create and Edit' and 'Submit and Certify' users see the validation message when the Total Budgeted Amount is more than Allocation Amount on application created for Formula BAFA Announcement and application status is Revision Initiated.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I click on "Cancel" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Cancel Revision" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Cancel Revision" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    And I navigate to "Revisions" sub tab
    Then I softly see that "Due Date" rendered in view mode only
    Then I softly see that "Revisions Request Status " rendered in view mode only
    Then I softly see that "Applicant Name" rendered in view mode only
    Then I softly see that "Application Sections for Revisions" rendered in view mode only
    Then I softly see that "Details" rendered in view mode only
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Cancel Revision" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    And I navigate to "Revisions" sub tab
    Then I softly see that "Due Date" rendered in view mode only
    Then I softly see that "Revisions Request Status " rendered in view mode only
    Then I softly see that "Applicant Name" rendered in view mode only
    Then I softly see that "Application Sections for Revisions" rendered in view mode only
    Then I softly see that "Details" rendered in view mode only
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    Then I softly see field "Details" as "Automation Details"
    Then I softly see field "Application Sections for Revisions" as "Budget Tab: Budget Details"
    Then I softly see field "Due Date" as "{Date:M/d/yyyy::d+7}"
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Revision Initiated"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Supplies and Materials" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    #NYSED-2795
    Then I softly can see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    #NYSED-2788
    Then I softly can see top right button "New" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    #NYSED-2795
    Then I softly see column header "Actions" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Cash Match" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Non-Cash Match" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Total Match" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Total Project Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2        | 100       | 100             | 1000                 | 100        | 100            |
      | Description of Item1        | 200                                                      | 3.5      | 50        | 100             | 1000                 | 100        | 100            |
      | Description of Item2        | 200                                                      | 2,3      | 30        | 100             | 1000                 | 100        | 100            |
    #NYSED-2794 #NYSED-2788 #NYSED-2780
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "3.50" for title "Quantity" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$50" for title "Unit Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$275" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item1" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item1" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item1" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2928
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2928
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Description of Item1" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item2" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    #NYSED-2788
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description of Item         | 300                                                      |
    #NYSED-2780 #NYSED-2788
    Then I softly see value "300" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2780
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category        | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Supplies and Materials | 45                   | $1,000 | $100       | $100           | $200        | $1,200             |
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | BOCES         | Calculation         | 10000                | 100        | 0              |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #540044
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |
    Then I softly can see top right button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I refresh the page
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | BOCES         | Calculation         | 1000                 | 100        | 0              |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "7" seconds
    #540044
    Then I softly see field "Status" as "Revision Submitted"
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @537813 @537816 @537815 @NYSEDSprint-14 @US-528127 @M05 @October2025
  Scenario Outline: Verify that the 'Create and Edit' and 'Submit and Certify' users see the validation message when the Total Budgeted Amount is more than the Allocation Amount on application created for Formula BA Announcement and application status is Revision Initiated.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I refresh the page
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement Application Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PO Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:FO Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Description of Item2    | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537813
    #FormsTable
    Then I softly can see row level action button "Edit" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see row level action button "Review Form" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    When I click on "Review Form" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    Then I softly see "Review Categories" page block displayed
    And I click modal button "Close"
    #Reviewers section
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    Then I softly can see top right button "Add" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    When I click on "Remove" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:reviewersTableId---"
    #Applications section
    Then I softly can see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Request Revision" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    #Reviews table
    Then I softly can see top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:FD Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537813
    #FormsTable
    Then I softly can see row level action button "Edit" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see row level action button "Review Form" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    When I click on "Review Form" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    Then I softly see "Review Categories" page block displayed
    And I click modal button "Close"
    #Reviewers section
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    Then I softly can see top right button "Add" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    When I click on "Remove" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:reviewersTableId---"
    #Applications section
    Then I softly can see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Request Revision" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    #Reviews table
    Then I softly can see top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I click on "Remove" icon for "{SavedValue:FD Username}" inside flex table with id "---announcement:-:CoordinatorsTableId---" with wait for record
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name                     |
      | Program Coordinator | {SavedValue:PM Username} |
    And I collapse nested table containing column value "Program Office Review"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537816
    #FormsTable
    Then I softly can see row level action button "Edit" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see row level action button "Review Form" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    When I click on "Review Form" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    Then I softly see "Review Categories" page block displayed
    And I click modal button "Close"
    #Reviewers section
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    Then I softly can see top right button "Add" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    When I click on "Remove" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:reviewersTableId---"
    #Applications section
    Then I softly can see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Request Revision" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    #Reviews table
    Then I softly can see top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:FD Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537816
    #FormsTable
    Then I softly can see row level action button "Edit" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see row level action button "Review Form" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    When I click on "Review Form" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    Then I softly see "Review Categories" page block displayed
    And I click modal button "Close"
    #Reviewers section
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    Then I softly can see top right button "Add" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    #Applications section
    Then I softly can see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Request Revision" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    #Reviews table
    Then I softly can see top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537813
    #FormsTable
    Then I softly cannot see row level action button "Edit" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly can see row level action button "Review Form" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    Then I softly cannot see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    When I click on "Review Form" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    Then I softly see "Review Categories" page block displayed
    And I click modal button "Close"
    #Reviewers section
    Then I softly cannot see top right button "Add" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly cannot see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    #Applications section
    Then I softly cannot see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see row level action button "Assign" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see row level action button "Request Revision" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    #Reviews table
    Then I softly cannot see top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @537572 @NYSEDSprint-14 @US-525073 @537572-Announcement @AnnouncementNewReviewStepAdded @M05 @October2025
  Scenario Outline:Verify all the review step operations with the coordinators user - Newly added step
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement Application Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name             | Step Weight (%) |
      | Program Office Review | 40              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Title                 | Step Weight (%) |
      | Grants Finance Review | 40              |
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PO Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:FO Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "New" :
      | Step Order | Step Name | Description | Step Weight (%) |
      | 3          | Demo Step | Automation  | 20              |
    And I expand nested table containing column value "Demo Step"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "New" :
      | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review | 100.00%         | 1                                         | Checked   | Yes                    |
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewPanelTableId---" by clicking "New" :
      | Section Order | Section Header                 | Section Weight (%) |
      | 1             | Automation Dummy Office Review | 100                |
    And I expand nested table containing column value "Automation Dummy Office Review"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question                | Type    | Max Score |
      | 1              | Automation Dummy Review | Written | 100       |
    And I click modal button "Close"
    And I collapse nested table containing column value "Demo Step"
    And I expand nested table containing column value "Demo Step"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                       | Role                       |
      | {SavedValue:EXE1 Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Demo Step"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Equipment     | 1000   | 100        | 100            |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Demo Step" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537572
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Due in Days |
      | Dummy Program Review | 0           |
    #537572
    Then I softly see the following messages in the page details contains:
      | Due in days cannot be less than 1 |
    When I click on "Undo" icon for "Dummy Program Review" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Minimum # of Reviews Required |
      | Dummy Program Review | 0                             |
    #537572
    Then I softly see the following messages in the page details contains:
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    When I click on "Undo" icon for "Dummy Program Review" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Required? |
      | Dummy Program Review | Unchecked |
    #537572
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    When I click on "Undo" icon for "Dummy Program Review" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:FD1 Username} |
    #537572
    Then I see the following rows under the following headers in table with id "---applicationReview:-:reviewersTableId---" :
      | Actions     | Reviewer                 | Email                          | Organization | # of Reviews Assigned |
      | Action menu | {SavedValue:FD Username} | {SavedValue:AutomationFDEmail} | NYSED        | 0                     |
    #537572
    Then I softly can see row level action button "Assign" against "{SavedValue:FD1 Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:FD1 Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    When I click on "Remove" icon for "{SavedValue:FD1 Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    #537572
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:FD1 Username} |
    When I click on "Assign" icon for "{SavedValue:FD1 Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    #537572
    Then I softly see value "Assigned" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    #537572
    Then I softly can see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Due in Days |
      | Dummy Program Review | 7           |
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Demo Step" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "3" seconds
    Then I softly can see row level action button "Send Back to Reviewer" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @537572 @NYSEDSprint-14 @US-525073 @537572-Program @ProgramNewReviewStepAdded @M05 @October2025
  Scenario Outline:Verify all the review step operations with the coordinators user - Newly added step
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter unique value in field with apiName "Fund_Code__c"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role    |
      | Automation FD  | Program Contact |
      | Automation EXE | Fiscal Contact  |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name             | Step Weight (%) |
      | Program Office Review | 40              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Title                 | Step Weight (%) |
      | Grants Finance Review | 40              |
    And I collapse nested table containing column value "Grants Finance Review"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name | Description | Step Weight (%) |
      | 3          | Demo Step | Automation  | 20              |
    And I expand nested table containing column value "Demo Step"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:ReviewFormsTableID---" by clicking "New" :
      | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review | 100.00%         | 1                                         | Checked   | Yes                    |
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header                 | Section Weight (%) |
      | 1             | Automation Dummy Office Review | 100                |
    And I expand nested table containing column value "Automation Dummy Office Review"
    When I enter the following values into flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "New" :
      | Question Order | Question                | Type    | Max Score |
      | 1              | Automation Dummy Review | Written | 10        |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    #539255
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    And I pause execution for "2" seconds
    And I click on "Activate" in the page details
    And I pause execution for "2" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I enter value "Automation Runtime Formula Announcement" into field "AnnouncementName__c"
    And I enter value "1995" into field "NYSED_Year__c"
    And I enter value "No" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement Application Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Step Name                | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PO Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:FO Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I expand nested table containing column value "Demo Step"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                       | Role                       |
      | {SavedValue:EXE1 Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Demo Step"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Equipment     | 1000   | 100        | 100            |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Demo Step" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537572
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Due in Days |
      | Dummy Program Review | 0           |
    #537572
    Then I softly see the following messages in the page details contains:
      | Due in days cannot be less than 1 |
    When I click on "Undo" icon for "Dummy Program Review" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Minimum # of Reviews Required |
      | Dummy Program Review | 0                             |
    #537572
    Then I softly see the following messages in the page details contains:
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    When I click on "Undo" icon for "Dummy Program Review" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Required? |
      | Dummy Program Review | Unchecked |
    #537572
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    When I click on "Undo" icon for "Dummy Program Review" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:FD1 Username} |
    #537572
    Then I see the following rows under the following headers in table with id "---applicationReview:-:reviewersTableId---" :
      | Actions     | Reviewer                 | Email                           | Organization | # of Reviews Assigned |
      | Action menu | {SavedValue:FD Username} | {SavedValue:AutomationFD1Email} | NYSED        | 0                     |
    #537572
    Then I softly can see row level action button "Assign" against "{SavedValue:FD1 Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:FD1 Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    When I click on "Remove" icon for "{SavedValue:FD1 Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    #537572
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:FD1 Username} |
    When I click on "Assign" icon for "{SavedValue:FD1 Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    #537572
    Then I softly see value "Assigned" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    #537572
    Then I softly can see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see top right button "Promote to FDM" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name            | Due in Days |
      | Dummy Program Review | 7           |
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "3" seconds
    Then I softly can see row level action button "Send Back to Reviewer" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @541059 @541217 @541060 @541058 @541247 @541345 @NYSEDSprint-16 @US-538018 @Sprint-16 @US-539115 @M05 @October2025
  Scenario Outline:Verify that all the internal users can see the Previous Review Step page-level action on the Funding Decision Memo layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    And I click on "Previous Review Step" in the page details
    And I wait for "2" seconds
    #541059
    Then I softly see value "Grant Finance Review Form" for title "Form Name" inside table "---applicationReview:-:formTableId---"
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    Then I softly see field "Subaward Abbreviation" inside page block
    When I navigate to "Responsibilities" sub tab
    #541217
    Then I softly can see top right button "New" in flex table with id "---subAwardFromFDM:-:fdmApproverTableId---"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                      | FDM    |
      | {SavedValue:FD1 Username} | Step 1 |
    #541217
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:fdmApproverTableId---" :
      | Actions     | Name                      | FDM    |
      | Action menu | {SavedValue:FD1 Username} | Step 1 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "Edit" :
      | FDM    | Name                     |
      | Step 1 | {SavedValue:FD Username} |
    #541217
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:fdmApproverTableId---" :
      | Actions     | Name                     | FDM    |
      | Action menu | {SavedValue:FD Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Project ID Seq. No." as "ProjectIDSeqNo" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    #541060
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:recommendedAppTableId---" :
      |  | Actions     | EGMS ID             | Application Title   | Subrecipient Organization    | Grant | Contractual? | Fund Year | Project ID Seq. No.         | Project ID                        | Score | Organization Risk Level | Allocation Amount | Total Budgeted Amount | Total Commitment Amount | Recommend for Funding | Comments    | Final Decision | Applicant Notified? |
      |  | Action menu | {SavedValue:EGMSID} | <Announcement Name> | {SavedValue:SubrecipientOrg} | N/A   | No           | 1990-01   | {SavedValue:ProjectIDSeqNo} | 199001{SavedValue:ProjectIDSeqNo} |       | NA                      |                   | $1,000                | $1,000                  | Yes                   | Recommended | Pending        | False               |
      |  |             | Total               |                     |                              |       |              |           |                             |                                   |       |                         |                   | $1,000                |                         |                       |             |                |                     |
    Then I softly cannot see top right button "Notify Selected Applicants" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    #541058
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #541058
    Then I softly see field "Subaward Abbreviation" as "AWS"
    Then I softly see field "OSC Approved?" as "Yes"
    Then I softly see field "Justification" as "Justified"
    And I click on "Submit for Approval" in the page details
    #541058
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:ANNEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #541247
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID                | Task Type   | Subject                                             | Due Date Only        | Status      |
      | Action menu | {SavedValue:ANNEGMSID} | Approve FDM | Approve FDM for Announcement {SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:ANNEGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FD1 Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:ANNEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #541345
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID                | Task Type   | Subject                                             | Due Date Only        | Status      |
      | Action menu | {SavedValue:ANNEGMSID} | Approve FDM | Approve FDM for Announcement {SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | FO          |

  @541068 @NYSEDSprint-16 @US-538018 @M05 @October2025
  Scenario Outline:Verify that the associated coordinators see the inline action 'Edit' in the Non-Recommended Applications section when the Funding Decision Memo is in the Created state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Project ID Seq. No." as "ProjectIDSeqNo" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    #541068
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:recommendedAppTableId---" :
      |  | Actions     | EGMS ID             | Application Title   | Subrecipient Organization    | Grant | Contractual? | Fund Year | Project ID Seq. No.         | Project ID                        | Score | Organization Risk Level | Allocation Amount | Total Budgeted Amount | Total Commitment Amount | Recommend for Funding | Comments    | Final Decision | Applicant Notified? |
      |  | Action menu | {SavedValue:EGMSID} | <Announcement Name> | {SavedValue:SubrecipientOrg} | N/A   | No           | 1990-01   | {SavedValue:ProjectIDSeqNo} | 199001{SavedValue:ProjectIDSeqNo} |       | NA                      |                   | $1,000                | $1,000                  | Yes                   | Recommended | Pending        | False               |
      |  |             | Total               |                     |                              |       |              |           |                             |                                   |       |                         |                   | $1,000                |                         |                       |             |                |                     |
    Then I softly cannot see top right button "Notify Selected Applicants" in flex table with id "---subAwardFromFDM:-:fdmNonRecommendedTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | FO          |

  @541063 @NYSEDSprint-16 @US-538018 @M05 @October2025
  Scenario:Verify that the associated coordinators see the inline action 'Initiate Revision' in the Recommended Applications section when the Funding Decision Memo is in the Approved state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "5" seconds
    #541063
    Then I softly can see row level action button "Initiate Revision" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @543029 @NYSEDSprint-17 @US-540528 @M05 @Bug-Ticket-NYSED-1476 @Bug-Ticket-NYSED-1500 @wip @AutomationNotNeeded
  Scenario Outline:Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related competitive opportunity for child organization when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Award" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMP_DIREC_MAXIMUM_APPLICATION_ALLOWED_2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Related Log" sub tab
    #543029
    Then I softly see "Total Records: 2" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ParentAppEGMSID1}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ParentAppEGMSID2}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID2"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Related Log" sub tab
    #543029
    Then I softly see "Total Records: 4" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ChildAppEGMSID1}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ChildAppEGMSID2}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "7" seconds
    And I switch to tab number "1"
    And I wait for "7" seconds
    #543029
    Then I softly see field "Status" as "Draft"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID2}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID2}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #543029
    Then I softly see field "Status" as "Review Initiated"

    Examples:
      | UserType   | Announcement Name                                              |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Award} |

  @543027 @NYSEDSprint-17 @US-540528 @M05 @Bug-Ticket-NYSED-1476 @Bug-Ticket-NYSED-1500 @wip @AutomationNotNeeded
  Scenario Outline:Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related competitive opportunity for self when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Award" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUMCOMP_DIREC_MAXIMUM_APPLICATION_ALLOWED_2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Related Log" sub tab
    And I pause execution for "4" seconds
    #543027
    Then I softly see "Total Records: 2" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ParentAppEGMSID1}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ParentAppEGMSID2}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID2"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Related Log" sub tab
    And I pause execution for "4" seconds
    #543027
    Then I softly see "Total Records: 4" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ChildAppEGMSID1}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    Then I softly see value "{SavedValue:ChildAppEGMSID2}" for title "EGMS ID" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Lump Sum      | 1000   | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "7" seconds
    And I switch to tab number "1"
    And I wait for "7" seconds
    #543027
    Then I softly see field "Status" as "Draft"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID2}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID2}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Lump Sum      | 1000   | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #543027
    Then I softly see field "Status" as "Review Initiated"

    Examples:
      | UserType   | Announcement Name                                              |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Award} |

  @542993 @539640 @539636 @539644 @539631 @NYSEDSprint-17 @US-538616 @NYSEDSprint-16 @US-535156 @M05
  Scenario Outline:Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s  click on the 'Send to Previous Step' button the application decision status name changes dynamically to 'Sent to <Previous Review Step Name> Step'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
      #542993 #539640 #539636 #539631
    Then I softly see value "Sent to Program Office Review Step" for title "Decision Status" against the value "<Announcement Name>" inside table "---applicationReview:-:appTableId---"
    Then I softly can see row level action button "View" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly cannot see row level action button "Assign" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly cannot see row level action button "Request Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Reject" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
      #539640 #539636
    Then I softly see the following messages in the page details contains:
      | Application cannot be rejected as it is in Sent to Program Office Review Step Status. |
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
      #539640 #539636
    Then I softly see the following messages in the page details contains:
      | Application cannot be sent to the previous step as it is in Sent to Program Office Review Step Status. |
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
      #539640 #539636
    Then I softly see the following messages in the page details contains:
      | Application cannot be promoted to FDM as it is in Sent to Program Office Review Step Status. |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "3" seconds
    #539644
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:assignApplicationsTableId---"

    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |

  @543012 @NYSEDSprint-17 @US-538616 @M05
  Scenario Outline:Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s  click on the 'Send to Previous Step' button the application decision status name changes dynamically to 'Sent to <Previous Review Step Name> Step'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    #543012
    Then I softly see value "Assigned" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    #543012
    Then I softly see value "Sent to Program Office Review Step" for title "Decision Status" against the value "<Announcement Name>" inside table "---applicationReview:-:appTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:appreviewsTableId---"

    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |

  @539715 @NYSEDSprint-17 @US-538616 @M05
  Scenario Outline:Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s can see the application status change as 'Review Incomplete' when clicks on the 'Send to Previous Step' button for the application which is in Review In Progress.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    #539715
    Then I softly see value "Sent for Review" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    #539715
    Then I softly see value "Review Incomplete" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"

    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |

  @539670 @NYSEDSprint-17 @US-538616  @M05
  Scenario Outline:Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s can see the validation if sending the application for Review using inline action button 'Send back to the reviewer', as application is 'Sent to Previous Step' |
  |Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s can see the validation when clicks on the 'Send to Previous Step' button for the application which is in Revision In Progress status.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "9" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    #539670
    Then I softly see value "Sent to Program Office Review Step" for title "Decision Status" against the value "<Announcement Name>" inside table "---applicationReview:-:appTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "Send Back to Reviewer" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    #539670
    Then I softly see the following messages in the page details contains:
      | Application cannot be Send back for review as it is in Sent to Program Office Review Step Status. |

    Examples:
      | UserType   | Announcement Name                                               |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Review} |

  @543007 @539623 @539622 @539618 @539621 @539619 @NYSEDSprint-17 @US-538616 @NYSEDSprint-16 @US-535156 @M05 @Bug-Ticket-546187
  Scenario Outline:Verify that the related tasks are closed for the reviewer when the application (Sent for Review) is sent back to previous step.
  |Verify that the Announcement Owner cannot see a new section button, 'Send to Previous Step' on the Review Step layout -> Applications section.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I login to "As a Grantor" app as "PO" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    #539618
    And I save the field labeled "Total Budgeted Amount" as "TotalBudgetedAmount"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539621 #BugTicket546187
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    #539618
    Then I softly cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly see value "{SavedValue:TotalBudgetedAmount}" for title "Requested Amount" inside table "---applicationReview:-:appTableId---"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:appTableId---" :
      |  |  | Actions     | EGMS ID             | Application Title   | Applicant Organization       | Requested Amount                 | Submitted On    | Minimum Reviews | Organization Risk Level | Decision Status |
      |  |  | Action menu | {SavedValue:EGMSID} | <Announcement Name> | {SavedValue:SubrecipientOrg} | {SavedValue:TotalBudgetedAmount} | {Date:M/d/uuuu} | True            | NA                      | Pending         |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539623
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539622
    Then I softly can see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    #539619
    Then I softly cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly see value "{SavedValue:TotalBudgetedAmount}" for title "Requested Amount" inside table "---applicationReview:-:appTableId---"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:appTableId---" :
      |  |  | Actions     | EGMS ID             | Application Title   | Applicant Organization       | Requested Amount                 | Submitted On    | Minimum Reviews | Organization Risk Level | Decision Status |
      |  |  | Action menu | {SavedValue:EGMSID} | <Announcement Name> | {SavedValue:SubrecipientOrg} | {SavedValue:TotalBudgetedAmount} | {Date:M/d/uuuu} | False           | NA                      | Pending         |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    #543007
    Then I see the following rows under the following headers in table with id "---applicationReview:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type          | Subject                                                                                                             | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Application Review | Conduct Grants Finance Review Review for Application #{SavedValue:EGMSID} Submitted by {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    #543007
    Then I softly see value "Sent to Program Office Review Step" for title "Decision Status" against the value "<Announcement Name>" inside table "---applicationReview:-:appTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    #543007
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I pause execution for "2" seconds
    And I navigate to "Applications" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" panel
    #543007
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:PhaseRespectivecompletedTaskTableId---"

    Examples:
      | UserType   | Announcement Name                                               |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Review} |

  @539671 @539727 @539718 @NYSEDSprint-16 @US-535156 @M05
  Scenario Outline:Verify that the Program Office Review Step OR the First review step associated coordinator/s can see below system behavior, when the application is in 'Sent to Previous Step' status
  |Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s can see below system behavior, when the application is 'Promote to next step' and application is already present at next review step with 'Sent to Previous step'|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    Then I softly see value "Sent to Program Office Review Step" for title "Decision Status" inside table "---applicationReview:-:appTableId---"
    And I save the field labeled "Announcement EGMS ID" as "AnnouncementEGMSID"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539671
    Then I softly see field "Status" as "In Progress"
    Then I softly see value "Pending" for title "Decision Status" inside table "---applicationReview:-:appTableId---"
    Given I expand nested table containing column value "{SavedValue:EGMSID}"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:reviewFormsTableId---" :
      | Actions     | Form Name | Reviews Assigned | Reviews Required | Recommendations | Minimum Number of Reviews Completed | Review Response Shared |
      | Action menu | Group 1   | 1                | 0                |                 | True                                | Yes                    |
      | Action menu | Group 2   | 1                | 0                |                 | True                                | Yes                    |
    #539671
    Then I softly can see row level action button "Send Back to Reviewer" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "Send Back to Reviewer" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    #539671
    Then I softly see value "Sent for Review" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    Then I softly see value "Sent to Program Office Review Step" for title "Decision Status" inside table "---applicationReview:-:appTableId---"
    And I save the field labeled "Announcement EGMS ID" as "AnnouncementEGMSID"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly see value "Promoted to Grants Finance Review Step" for title "Decision Status" inside table "---applicationReview:-:appTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    #539727
    Then I softly see value "Pending" for title "Decision Status" inside table "---applicationReview:-:appTableId---"
    Then I softly can see row level action button "View" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly can see row level action button "Assign" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly can see row level action button "Request Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    #539727
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---applicationReview:-:assignApplicationsTableId---"
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "9" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    #539718
    Then I softly see the following messages in the page details contains:
      | The application "{SavedValue:EGMSID}" cannot be sent to the previous review step as it is in "Review Completed" status. |

    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |

  @539463 @539468 @539470 @539469 @NYSEDSprint-16 @US-535156 @NYSEDSprint-16 @US-524013 @M05
  Scenario Outline:Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s can see the validation when clicks on the 'Send to Previous Step' button for the application which is in Revision In Progress status.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I login to "As a Grantor" app as "PO" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539463
    Then I softly can see top right button "Notify" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539470
    Then I softly cannot see top right button "Notify" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539469
    Then I softly cannot see top right button "Notify" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539468
    Then I softly can see top right button "Notify" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539470
    Then I softly cannot see top right button "Notify" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539469
    Then I softly cannot see top right button "Notify" in page detail

    Examples:
      | UserType   | Announcement Name                                               |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Review} |

  @542650 @NYSEDSprint-17 @US-540317 @M05
  Scenario Outline:Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s can see the validation when clicks on the 'Send to Previous Step' button for the application which is in Revision In Progress status.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I login to "As a Grantor" app as "PO" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    #542650
    Then I softly see the following messages in the page details contains:
      | Application cannot be promoted to next step as it is in Revision In-Progress Status. |

    Examples:
      | UserType   | Announcement Name                                               |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Review} |

  @542648 @NYSEDSprint-17 @US-540317 @M05 @Bug-Ticket-NYSED-10169
  Scenario Outline:Verify that the associated coordinator cannot send the application back to the reviewer from the reviews section when the decision status in the applications section is 'Revision In-Progress'. - Program Office Review Step
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I login to "As a Grantor" app as "PO" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:FO1 Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I click on "Assign" icon for "{SavedValue:FO1 Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Decline" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Decline" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "2" seconds
    When I check "Automation FD" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "Send Back to Reviewer" icon for "Automation FD" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    #542648
    Then I softly see the following messages in the page details contains:
      | Application cannot be sent back to the reviewer as it is in Revision In-Progress Status. |
    And I pause execution for "2" seconds
    When I check "Automation FO" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "Send Back to Reviewer" icon for "Automation FO" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    #542648
    Then I softly see the following messages in the page details contains:
      | Application cannot be sent back to the reviewer as it is in Revision In-Progress Status. |
    And I pause execution for "2" seconds
    When I check "Automation FO1" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "Send Back to Reviewer" icon for "Automation FO1" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    #542648
    Then I softly see the following messages in the page details contains:
      | Application cannot be sent back to the reviewer as it is in Revision In-Progress Status. |

    Examples:
      | UserType   | Announcement Name                                               |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Review} |

  @539719 @539468 @539470 @539469 @NYSEDSprint-16 @US-535156 @NYSEDSprint-16 @US-524013 @M05
  Scenario Outline:Verify that the Grant Finance Review Step OR the Last review step associated coordinator/s  click on the 'Send to Previous Step' button the application decision status name changes dynamically to 'Sent to <Previous Review Step Name> Step'
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name              | Description | Step Weight (%) |
      | 3          | Management Review Step | test        | 20              |
    And I expand nested table containing column value "Management Review Step"
    When I enter the following values into flex table with id "---program:-:ReviewFormsTableID---" by clicking "New" :
      | Form Name                   | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Management Review Step Form | 100             | 1                                         | Checked   | Yes                    |
    And I wait for "2" seconds
    And I click on "Review Form" icon for "Management Review Step Form" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header               | Section Weight (%) |
      | 1             | Automation Management Review | 100                |
    And I expand nested table containing column value "Automation Management Review"
    When I enter the following values into flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "New" :
      | Question Order | Question          | Type    | Max Score |
      | 1              | Automation Review | Written | 100       |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name             | Step Weight (%) |
      | Program Office Review | 40              |
      | Grants Finance Review | 40              |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I pause execution for "2" seconds
    And I enter value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I enter value "Automation Runtime Formula Announcement" into field "AnnouncementName__c"
    And I enter value "1995" into field "NYSED_Year__c"
    And I enter value "No" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I pause execution for "2" seconds
    And I save the field labeled "Announcement Name" as "AnnouncementTitle"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 10000             |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PO Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:FO Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I expand nested table containing column value "Management Review Step"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:FD Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Management Review Step"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Publish" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 600    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:AnnouncementTitle}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:AnnouncementTitle}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "{SavedValue:AnnouncementTitle}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send to Previous Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I check "{SavedValue:AnnouncementTitle}" boxes in flex table with id "---applicationReview:-:appTableId---"
    #539719
    Then I softly see the following messages in the page details contains:
      | The application {SavedValue:EGMSID} cannot be sent to the previous review step as it is in "Management Review Step" status. |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review Step" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I pause execution for "2" seconds
    #539468
    Then I softly can see top right button "Notify" in page detail
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review Step" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I pause execution for "2" seconds
    #539470
    Then I softly cannot see top right button "Notify" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnouncementTitle}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementTitle}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #539469
    Then I softly cannot see top right button "Notify" in page detail

    Examples:
      | UserType   | Announcement Name                                               |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Review} |

  @539308 @539306 @537857 @NYSEDSprint-14 @US-536498 @Sprint-14 @US-536504 @M05
  Scenario Outline:Verify that the removed associated coordinator/s with the Program Office Review Step should not received the task and email when a Subrecipient submits the revision to Grantor.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:FD Username} | Program Coordinator |
    And I wait for "2" seconds
    When I click on "Remove" icon for "{SavedValue:PO Username}" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Revision Initiated"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | BOCES         | Calculation         | 1000                 | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "7" seconds
    Then I softly see field "Status" as "Revision Submitted"
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Completed Tasks" content inside "Application Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" panel
    #537857
    Then I see the following rows under the following headers in table with id "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Completed Tasks" content inside "Application Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" panel
    #537857
    Then I see the following rows under the following headers in table with id "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    #539308
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left side link
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    #539306
    Then I see the following rows under the following headers in table with id "---applicationReview:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Priority | Task Type       | Subject                                                                                  | Assigned By                      | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Low      | Review Revision | Revise Revised Application #{SavedValue:EGMSID} for Announcement #{SavedValue:ANNEGMSID} | {SavedValue:GRANTEE_SC Username} | {Date:M/d/yyyy::d+7} | Not Started |

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @549735 @NYSEDSprint-03 @US-487966 @M05 @executionRemaining
  Scenario: :Verify that coordinator can see "Send Back to Reviewer" action when the status of the application review is "Review Completed" and FDM is in submitted for approval state but see validation on click. - Program Office Review
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Send Back to Reviewer" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
      #549735
    Then I softly see the following messages in the page details contains:
      | Cannot send back the application review to the reviewer because the application is already promoted to a Funding Decision Memo (FDM) and the FDM is in status submitted for Approval, Approved or Rejected |

  @496437 @549736 @NYSEDSprint-03 @US-487966 @M05
  Scenario: Verify that coordinator can see "Send Back to Reviewer" action when the status of the application review is "Review Completed" and FDM is in submitted for approval state but see validation on click. - Program Office Review
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title                                               | Total Commitment Amount | Recommend for Funding | Comments    |
      | {SavedValue:Automation Runtime Announcement Application Review} | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Send Back to Reviewer" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
      #496437
    Then I softly see the following messages in the page details contains:
      | Cannot send back the application review to the reviewer because the application is already promoted to a Funding Decision Memo (FDM) and the FDM is in status submitted for Approval, Approved or Rejected |
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    And I "Reject" in the approval decision
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Send Back to Reviewer" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
      #549736
    Then I softly see the following messages in the page details contains:
      | Cannot send back the application review to the reviewer because the application is already promoted to a Funding Decision Memo (FDM) and the FDM is in status submitted for Approval, Approved or Rejected |

  @496624 @NYSEDSprint-03 @US-487966 @M05 @executionRemaining
  Scenario:Verify that associated coordinator can see "Send Back to Reviewer" action when the status of the application review is "Review Completed" and FDM is in created state. - Program Office Review
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Send Back to Reviewer" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    #496624
    Then I softly see value "Sent for Review" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    Then I softly cannot see row level action button "Send Back to Reviewer" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:appreviewsTableId---"

  @NYSED-2925-RI @NYSED-2917-RI @NYSED-2548-RI @NYSED-2833-RI @NYSED-2841-RI @NYSED-2831-RI @NYSED-2824-RI @NYSED-2823-RI @NYSED-2825-RI @NYSEDSprint-25 @US-NYSED-1854 @Sprint-24 @US-NYSED-1857 @US-NYSED-1856 @M05
  Scenario Outline: 533590-Verify that grantee user cannot see the inline action name as 'View/Add Line Item Details', under the budget categories table if 'Is a Detailed Budget Required on the Application? - No' on the announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I wait for "5" seconds
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    #NYSED-2925
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Cash Match | Non-Cash Match |
      | Description of Item | 1200       | 1200           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$1,200" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$1,200" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$2,400" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$12,400" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2917
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $10,000 | $1,200     | $1,200         | $2,400      | $12,400            |
      |             | Grand Total                 |                      | $10,000 | $1,200     | $1,200         | $2,400      | $12,400            |
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2548
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" against the value "49" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Destination   | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2548
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title              | Destination   | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Purpose       | Cost                | 88.988               | 88.988     | 88.988         |
    And I wait for "3" seconds
    #NYSED-2548
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title              | Destination   | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title              | Purpose       | Cost                | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                       |               |                     | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | and           | test                | 88.988               | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title              | and           | test                | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2548
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Minor Remodeling            | 30                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0      | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | 88.988               | 88.988     | 88.988         |
    #NYSED-2833 #NYSED-2841
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | 88.988               | 88.988     | 88.988         |
    #NYSED-2833 #NYSED-2841
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total          | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "Edit" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | $88,989              | 88.989     | 88.989         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,989              | $88,989    | $88,989        | $177,978    | $266,967           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
   #NYSED-2833 #NYSED-2841
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2841
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $88,989 | $88,989    | $88,989        | $177,978    | $266,967           |
      | Action menu | BOCES Purchased Services    | 49                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0      | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $88,989 | $88,989    | $88,989        | $177,978    | $266,967           |
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2840
    Then I softly see value "Indirect Cost" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2840
    Then I softly see value "Indirect Cost" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    #NYSED-2833
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2831 #NYSED-2825 #NYSED-2824
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 28.99                | 50         | 10             |
      | Automation Benefits- 2 | 100                  | 7.88       | 20             |
      | Automation Benefits- 3 | 500.78               | 10         | 2              |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits- 1 | $2,899               | $50        | $10            | $60         | $2,959             |
      | Automation Benefits- 2 | $100                 | $788       | $20            | $808        | $908               |
      | Automation Benefits- 3 | $50,078              | $10        | $2             | $12         | $50,090            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 2 | 20                   | 20         | 20             |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits- 1 | $2,899               | $50        | $10            | $60         | $2,959             |
      | Automation Benefits- 2 | $20                  | $20        | $20            | $40         | $60                |
      | Automation Benefits- 3 | $50,078              | $10        | $2             | $12         | $50,090            |
      | Total                  | $52,997              | $80        | $32            | $112        | $53,109            |
    When I click on "Delete" icon for "Automation Benefits- 2" inside flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits- 1 | $2,899               | $50        | $10            | $60         | $2,959             |
      | Automation Benefits- 3 | $50,078              | $10        | $2             | $12         | $50,090            |
      | Total                  | $52,977              | $60        | $12            | $72         | $53,049            |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category   | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Employee Benefits | 80                   | $52,977 | $60        | $12            | $72         | $53,049            |
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    #NYSED-2823
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    #NYSED-2823
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @NYSED-2783-AR @NYSED-2920-RI @NYSED-2819-RI @NYSED-2802-RI @NYSED-2859-RI @NYSED-2641-RI @NYSED-2900-RI @537852 @537853 @US-NYSED-1854 @Sprint-24 @US-NYSED-1860 @US-NYSED-1857 @US-NYSED-1856 @US-NYSED-1859 @US-NYSED-1855 @US-NYSED-1851 @Sprint-14 @US-536504 @passed @M05
  Scenario Outline: 533590-Verify that grantee user cannot see the inline action name as 'View/Add Line Item Details', under the budget categories table if 'Is a Detailed Budget Required on the Application? - No' on the announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #537853
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #537852
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I wait for "5" seconds
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2783
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Supplies and Materials" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
      #NYSED-2920
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly can see row level action button "Edit" against "Equipment" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    #NYSED-2836
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Indirect Cost" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2819
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly can see row level action button "Edit" against "Employee Benefits" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    #NYSED-2802
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Travel Expenses" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2859
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Minor Remodeling" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2641
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2900
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @NYSED-2806-RI @NYSED-2807-RI @NYSED-2799-RI @NYSED-2770-RI @NYSED-2769-RI @NYSED-2778-RI @NYSED-2864-RI @NYSED-2863-RI @NYSED-2643-RI @Sprint-24 @US-NYSED-1855 @US-NYSED-1853 @US-NYSED-1859 @M05
  Scenario Outline: 533590-Verify that grantee user cannot see the inline action name as 'View/Add Line Item Details', under the budget categories table if 'Is a Detailed Budget Required on the Application? - No' on the announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 88988                | 88988      | 88988          |
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Purpose     | Destination | Automation Benefits- 2          | Calculation         | 88988                | 88988      | 88988          |
    #NYSED-2799
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title       | Destination | Purpose     | Automation Benefits- 1          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title       | Purpose     | Destination | Automation Benefits- 2          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                |             |             |                                 |                     | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Automation Benefits- 2" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Automation Benefits- 2" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    When I click on "Delete" icon for "Automation Benefits- 2" inside flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    #NYSED-2799
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                |             |         |                                 |                     | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    Then I softly can see row level action button "Edit" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Automation Benefits- 1" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2799
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Employee Benefits           | 80                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0      | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    #NYSED-2769
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    #NYSED-2806
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2769
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    #NYSED-2806
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2769
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2807
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                |             |         |                                 |                     | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Position of Traveler | Destination |
      | Position Title       | and         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title       | and         | Purpose | Automation Benefits- 1          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                |             |         |                                 |                     | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    #NYSED-2807
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item1        |                 | Provider of Services1 | Calculation of Cost1 | 200                  | 200        | 200            |
    #NYSED-2778
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item1        | Yes             | Provider of Services1 | Calculation of Cost1 | 200                  | 200        | 200            |
   #NYSED-2770
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | 200                  | 200        | 200            |
    #NYSED-2763 #NYSED-2778
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description of Item1        | Yes             | Provider of Services1 | Calculation of Cost1 | $200                 | $200       | $200           | $400        | $600               |
      | Action menu | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | $200                 | $200       | $200           | $400        | $600               |
      |             | Total                       |                 |                       |                      | $500                 | $500       | $500           | $1,000      | $1,500             |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2763
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category    | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Purchased Services | 40                   | $500   | $500       | $500           | $1,000      | $1,500             |
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "Delete" icon for "Description of Item2" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    #NYSED-2763 #NYSED-2770
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description of Item1        | Yes             | Provider of Services1 | Calculation of Cost1 | $200                 | $200       | $200           | $400        | $600               |
      |             | Total                       |                 |                       |                      | $300                 | $300       | $300           | $600        | $900               |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2763
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category    | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Purchased Services | 40                   | $300   | $300       | $300           | $600        | $900               |
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "Delete" icon for "Description of Item1" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | No              | 200                  | 200        | 200            |
    #NYSED-2770 #NYSED-2778
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | No              | Provider of Services | Calculation of Cost | $200                 | $200       | $200           | $400        | $600               |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    #NYSED-2770
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2865
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title                      | Provider of Service        | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2865 #NYSED-2864
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title                      | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                               |                            |                     | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2865
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget   | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $177,976 | $177,976   | $177,976       | $355,952    | $533,928           |
      | Action menu | Equipment                   | 20                   | $0       | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $177,976 | $177,976   | $177,976       | $355,952    | $533,928           |
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    #NYSED-2864
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2865
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Equipment                   | 20                   | $0      | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Calculation of Cost |
      | Position Title                      | Cost                |
    #NYSED-2864
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title                      | Provider of Service        | Cost                | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                               |                            |                     | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2863
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2643
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2863
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2643
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    #NYSED-2864
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @NYSED-2638-RI @NYSED-2906-RI @NYSED-2905-RI @Sprint-24 @US-NYSED-1851 @US-NYSED-1852 @M05
  Scenario Outline: Verified that the grantee user can see on save all the added value sums up properly at the category level- Professional Staff Salaries
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | 88.988           | 88.988     | 88.988         |
    #NYSED-2638
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | 88.988           | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                   |                | 20.00 | $177,976               | $20                                                | $177,976         | $177,976   | $177,976       | $355,952    | $533,928           |
    #NYSED-2638
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
     #NYSED-2638
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget   | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $177,976 | $177,976   | $177,976       | $355,952    | $533,928           |
      | Action menu | Support Staff Salaries      | 16                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0       | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $177,976 | $177,976   | $177,976       | $355,952    | $533,928           |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             |     | 10                     | 10                                                 | 10000            | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             |     | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE    |
      | Position Title          | 10.877 |
    #NYSED-2906
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.87 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE    | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10.877 | 10                     | 10                                                 | 10000            | 100        | 100            |
    #NYSED-2907 #NYSED-2906
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.87 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
      | Action menu | Position Title          | 10             | 10.87 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
      |             | Total                   |                | 21.74 | $20                    | $20                                                | $20,000          | $200       | $200           | $400        | $20,400            |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2907 #NYSED-2906
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $20,000 | $200       | $200           | $400        | $20,400            |
      | Action menu | Purchased Services          | 40                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0      | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $20,000 | $200       | $200           | $400        | $20,400            |
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2905
    Then I softly see value "Support Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2905
    Then I softly see value "Support Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    #NYSED-2906
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @545703 @538261 @537814 @537845 @537822 @537832 @537847 @537855 @537844 @Sprint-19 @US-544005 @Sprint-14 @US-536366 @Sprint-14 @US-536504 @M05 @BugTicket-NYSED-4023
  Scenario Outline: Verify that the grantee user sees a validation message after clicking the Save button when the budget entered for each line item under the Equipment budget category is less than $10,000.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:grantorApplicationNotesTableId---"
    And I navigate to "Revisions" sub tab
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #537855
    Then I softly see "No Records Found" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #538261
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    #537814 #537847 #537844
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    #537844
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    And I navigate to "Budget" sub tab
    Then I softly cannot see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left side link
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #537855
    Then I softly see "No Records Found" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #538261
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    #537814 #537847 #537844
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    #537844
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    And I navigate to "Budget" sub tab
    Then I softly cannot see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #537845
    Then I softly see field "Details" as "Automation Request Iniatiation"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 9000                 | 100        | 100            |
    #545703
    Then I softly see the following messages in the page details contains:
      | Budget entries under the Equipment category must not be less than $10,000 per line item. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    #545703
    Then I softly cannot see the following messages in the page details contains:
      | Budget entries under the Equipment category must not be less than $10,000 per line item. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #538261
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    #537814
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    #537845
    Then I softly see field "Details" as "Request Iniatiation"
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "K.B.Street" into field "Addressline1__c"
    When I enter value "Automation" into field "Addressline2__c"
    When I enter value "12" into field "County__c"
    When I enter value "Chicago" into field "City__c"
    When I enter value "34565" into field "Zip4__c"
    When I enter value "USA" into field "Country__c"
    When I enter value "AK" into field "State__c"
    And I enter value "Manual Test" into field "ProjectAbstract__c"
    #537822
    Then I softly see fields "Title__c" is in edit mode
    And I click on "Save" in the page details
    #537822
    Then I softly see field "Street" as "K.B.Street"
    Then I softly see field "PO Box" as "Automation"
    Then I softly see field "City" as "Chicago"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "34565"
    Then I softly see field "Country" as "USA"
    Then I softly see field "Project Abstract" as "Manual Test"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 30     |
    #537822
    Then I softly see value "30" for title "Target" inside table "---applicationIntake:-:kpiTableId---"
    When I navigate to "Budget" sub tab
    #537832
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Testing" into field "Justification__c"
    And I click on "Save" in the page details
    #537832
    Then I softly see field "Budget Narrative" as "Testing"

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_CE   |
#      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @538259 @541054 @539746 @541111 @496206 @Sprint-14 @US-536366 @Sprint-16 @US-53783 @Sprint-04 @US-492720 @M05 @Bug-Ticket-NYSED-10170
  Scenario Outline: Verify that the Submit to Grantor action button is visible to only the users with the 'Submit and Certify' role when the application is in the Revision initiated state and the revision is in the 'Sent to Subrecipient' state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "10" seconds
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---" with wait for record
    And I navigate to "Revisions" sub tab
    #541054
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    #539746
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                           | Description      |
      | Notes Record Of Cordinator User | Automation Notes |
    #539746
    Then I softly see value "Notes Record Of Cordinator User" for title "Title" inside table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "Edit" :
      | Title                           | Description  |
      | Notes Record Of Cordinator User | Manual Notes |
    #539746
    Then I softly can see row level action button "Edit" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I click on "Delete" icon for "Manual Notes" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    #539746
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Given I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---" with wait for record
    And I navigate to "Revisions" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    #539746
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                           | Description      |
      | Notes Record Of Cordinator User | Automation Notes |
    #539746
    Then I softly see value "Notes Record Of Cordinator User" for title "Title" inside table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "Edit" :
      | Title                           | Description  |
      | Notes Record Of Cordinator User | Manual Notes |
    #539746
    Then I softly can see row level action button "Edit" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I click on "Delete" icon for "Manual Notes" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    #539746
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---" with wait for record
    When I navigate to "Forms and Files" sub tab
    #539746
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                           | Description      |
      | Notes Record Of Cordinator User | Automation Notes |
    #539746
    Then I softly see value "Notes Record Of Cordinator User" for title "Title" inside table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "Edit" :
      | Title                           | Description  |
      | Notes Record Of Cordinator User | Manual Notes |
    #539746
    Then I softly can see row level action button "Edit" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I click on "Delete" icon for "Manual Notes" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    #539746
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Given I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---" with wait for record
    When I navigate to "Forms and Files" sub tab
    #539746
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                           | Description      |
      | Notes Record Of Cordinator User | Automation Notes |
    #539746
    Then I softly see value "Notes Record Of Cordinator User" for title "Title" inside table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "Edit" :
      | Title                           | Description  |
      | Notes Record Of Cordinator User | Manual Notes |
    #539746
    Then I softly can see row level action button "Edit" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I click on "Delete" icon for "Manual Notes" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    #539746
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Given I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---" with wait for record
    When I navigate to "Forms and Files" sub tab
    #539746
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                           | Description      |
      | Notes Record Of Cordinator User | Automation Notes |
    #539746
    Then I softly see value "Notes Record Of Cordinator User" for title "Title" inside table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "Edit" :
      | Title                           | Description  |
      | Notes Record Of Cordinator User | Manual Notes |
    #539746
    Then I softly can see row level action button "Edit" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I click on "Delete" icon for "Manual Notes" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    #539746
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Given I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---" with wait for record
    When I navigate to "Forms and Files" sub tab
    #539746
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                           | Description      |
      | Notes Record Of Cordinator User | Automation Notes |
    #539746
    Then I softly see value "Notes Record Of Cordinator User" for title "Title" inside table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Cordinator User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "Edit" :
      | Title                           | Description  |
      | Notes Record Of Cordinator User | Manual Notes |
    #539746
    Then I softly can see row level action button "Edit" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Manual Notes" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I click on "Delete" icon for "Manual Notes" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    #539746
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                           | Description      |
      | Notes Record Of Cordinator User | Automation Notes |
    Given I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---" with wait for record
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #496206
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    #496206
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #537845
    Then I softly can see top right button "Submit to Grantor" in page detail
    #541111
    Then I see only the following ordered page blocks :
      | Revision Request Details        |
      | Applicant Response              |
      | Explanation of Revisions Needed |
    Then I softly do not see "Available Forms for Revision" page block displayed
    Then I softly see field " Application Sections for Revisions" as "Budget Tab: Budget Details"

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @496209 @496212 @496209 @541139 @541140 @541137 @541134 @542175 @542173 @Sprint-04 @US-492720 @Sprint-16 @US-540283 @Sprint-16 @US-540283 @ExecutionPendingDueTOAPIIssue
    @492222 @490849 @Sprint-01 @US-490341
  Scenario Outline:Verify that when associated coordinator initiates revisions, the grantee should see correct task type & subject - FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    #490849
    Then I softly can see top right dropdown button "Previous Review Step" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Initiate Revision" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:recommendedTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I navigate to "Revisions" sub tab
    #541134
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    And I wait for "2" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    #541137
    Then I softly cannot see top right dropdown button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Cancel Revision" in page detail
    Then I softly can see top right dropdown button "Back to Current Review Step" in page detail
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #496209
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    #496209
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Revision Submitted"
    Given I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #496212
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type       | Subject                                                                                  | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Review Revision | Review Revised Application #{SavedValue:EGMSID} for Announcement #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    #496209
    Then I softly see field "Status" as "Revision Submitted"
    #541139 #492222
    Then I softly can see top right dropdown button "Request Revisions" in page detail
    Then I softly can see top right dropdown button "Complete Revision" in page detail
    Then I softly can see top right dropdown button "Back to Current Review Step" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    #541140
    Then I softly can see top right dropdown button "Back to Current Review Step" in page detail
    Given I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Funding Decision Memo"
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name                     |
      | Program Coordinator | {SavedValue:FD Username} |
    And I collapse nested table containing column value "Funding Decision Memo"
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    #542175
    Then I softly can see top right dropdown button "Request Revisions" in page detail
    Then I softly can see top right dropdown button "Complete Revision" in page detail
    Then I softly cannot see top right dropdown button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Cancel Revision" in page detail
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "8" into field "NegotiationDueDate__c"
    When I enter value "Overview: Application Overview" into field "ApplicationSectionsForRevision__c"
    When I enter value "Manual Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    #542173
    Then I softly see field "Due Date" as "{Date:M/d/yyyy::d+8}"
    Then I softly see field "Application Sections for Revisions" as "Overview: Application Overview"
    Then I softly see field "Details" as "Manual Details"

    Examples:
      | Announcement Name                                | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | FO          | GRANTEE_CE   |

  @541235 @541944 @541244 @541243 @Sprint-04 @US-492720 @ExecutionPendingDueTOAPIIssue
  Scenario Outline:Verify that the only FD user can see Inline action 'Create Subaward' when Funding Decision Memo is in Approved state, on the Funding Decision Memo layout -> Funding Decision Memo tab ->Recommended Applications section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    #541244
    Then I softly cannot see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly can see row level action button "Initiate Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    When I re-login to "As a Grantor" app as "<AnnouncementOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    #541243
    Then I softly cannot see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly can see row level action button "No Actions Available" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    #541235
    Then I softly can see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "7" seconds
    And I switch to tab number "1"
    And I wait for "7" seconds
    #541235
    Then I softly see field "Status" as "Draft"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "2" seconds
    #541944
    Then I softly cannot see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly see value "{SavedValue:GrantID}" for title "Grant" inside table "---applicationReview:-:recommendedTableId---"

    Examples:
      | Announcement Name                                | Coordinator | InternalUser | AnnouncementOwner |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          | FD           | PM                |

  @541231 @541232 @Sprint-16 @US-538058
  Scenario Outline:Verify that the only FD user can see the Funding Accounts section button 'Associate' on the Funding Decision Memo layout -> Funding Decision Memo tab
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<InternalUser>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    When I perform quick search for "{SavedValue:AutomationExternalFundingAccountTitle}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:AutomationExternalFundingAccountTitle}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I click modal button "Close"
    #541231
    Then I softly see value "{SavedValue:AutomationExternalFundingAccountTitle}" for title "Funding Account Title" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    #541232
    Then I softly can see row level action button "Edit" against "{SavedValue:AutomationExternalFundingAccountTitle}" in flex table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:AutomationExternalFundingAccountTitle}" in flex table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---" by clicking "Edit" :
      | Funding Account Title                              | FDM Pre-Encumbrance |
      | {SavedValue:AutomationExternalFundingAccountTitle} | 1000                |
    Then I softly see value "$1,000" for title "FDM Pre-Encumbrance" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"

    Examples:
      | Announcement Name                                | Coordinator | InternalUser | AnnouncementOwner |
      | {SavedValue:Automation Runtime FDM Announcement} | PO          | FD           | PM                |

  @541341 @541253 @490801 @490804 @Sprint-01 @US-490341 @Sprint-16 @US-539115 @M05
  Scenario Outline:Verify that the 2nd Approver see the task is generated when 1st/previous FDM Approver clicks on “Approve” button. .
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    #490801 #490804
    Then I softly can see top right dropdown button "Previous Review Step" in page detail
    Then I softly can see top right dropdown button "Back to Announcement" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Funding Decision Memo" in page detail
    And I click on "Previous Review Step" in the page details
    #490804
    Then I softly can see top right dropdown button "Next Review Step" in page detail
    Then I softly can see top right dropdown button "Back to Announcement" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    And I click on "Next Review Step" in the page details
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PM Username} | Step 1 |
      | {SavedValue:FD Username} | Step 2 |
    When I navigate to "Funding Decision Memo" sub tab
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:ANNEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:ANNEGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ANNEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #541341
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID                | Task Type   | Subject                                             | Due Date Only        | Status      |
      | Action menu | {SavedValue:ANNEGMSID} | Approve FDM | Approve FDM for Announcement {SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:ANNEGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ANNEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #541253
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID                | Task Type       | Subject                                                                          | Due Date Only        | Status      |
      | Action menu | {SavedValue:ANNEGMSID} | Initiate Awards | Initiate Awards for Announcement #{SavedValue:ANNEGMSID} and <Announcement Name> | {Date:M/d/yyyy::d+7} | Not Started |

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | FO          |

  @541224 @545470 @Sprint-04 @US-538018 @Sprint-19 @US-544882 @M05
  Scenario Outline:Verify that the new coordinators can see section level buttons and FD profile user can see the inline actions 'Create Subaward' in the Recommended Applications section when the Funding Decision Memo is in the Approved state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Funding Decision Memo"
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name                     |
      | Program Coordinator | {SavedValue:FD Username} |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I re-login to "As a Grantor" app as "<NewCoordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    #541224
    Then I softly can see top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    Then I softly cannot see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly can see row level action button "Initiate Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    #545470
    Then I see only the following headers in table with id "---applicationReview:-:rejectedApplicationTableId---" :
      |  | Actions | EGMS ID | Application Title | Subrecipient Organization | Comments | Applicant Notified? |
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    #541224
    Then I softly can see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "7" seconds
    And I switch to tab number "1"
    And I wait for "7" seconds
    #541224
    Then I softly see field "Status" as "Draft"

    Examples:
      | Announcement Name                                | Coordinator | NewCoordinator | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          | FD             | FD           |

  @545469 @545468 @Sprint-19 @US-544882 @M05
  Scenario Outline:Verify that the new coordinators can see section level buttons and FD profile user can see the inline actions 'Create Subaward' in the Recommended Applications section when the Funding Decision Memo is in the Approved state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    When I navigate to "Funding Decision Memo" sub tab
    #545469
    Then I see only the following headers in table with id "---subAwardFromFDM:-:recommendedAppTableId---" :
      |  | Actions | EGMS ID | Application Title | Subrecipient Organization | Grant | Contractual? | Fund Year | Project ID Seq. No. | Project ID | Score | Organization Risk Level | Allocation Amount | Total Budgeted Amount | Total Commitment Amount | Recommend for Funding | Comments | Final Decision | Applicant Notified? |
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I see only the following ordered options in dropdown field "NYSED_Contractual__c" :
      | Yes | No |
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | Yes                   | Recommended |
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:recommendedAppTableId---" :
      | Contractual? |
      | No           |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Contractual? |
      | <Announcement Name> | Yes          |
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:recommendedAppTableId---" :
      | Contractual? |
      | Yes          |
    #545468
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmNonRecommendedTableId---" :
      |  | Actions | EGMS ID | Application Title | Subrecipient Organization | Grant | Contractual? | Score | Organization Risk Level | Total Budgeted Amount | Total Commitment Amount | Recommended Budget | Recommend for Funding | Comments | Final Decision | Applicant Notified? |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Recommend for Funding |
      | <Announcement Name> | No                    |
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmNonRecommendedTableId---"
    Then I see only the following ordered options in dropdown field "NYSED_Contractual__c" :
      | Yes | No |

    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          |

  @545476 @Sprint-19 @US-544882 @M05
    @490816 @Sprint-01 @US-490341
  Scenario Outline:Verify that the associated coordinators of FDM cannot see a new field 'Contractual?' is added in 'Recommended Applications' OR 'Non-Recommended Application' section if Budget type is Lump Sum.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "LUMPSUM_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    When I navigate to "Funding Decision Memo" sub tab
    #545476
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmNonRecommendedTableId---" :
      |  | Actions | EGMS ID | Application Title | Subrecipient Organization | Grant | Score | Organization Risk Level | Total Budgeted Amount | Total Commitment Amount | Recommended Budget | Recommend for Funding | Comments | Final Decision | Applicant Notified? |
   #545476
    Then I see only the following headers in table with id "---subAwardFromFDM:-:recommendedAppTableId---" :
      |  | Actions | EGMS ID | Application Title | Subrecipient Organization | Grant | Fund Year | Project ID Seq. No. | Project ID | Score | Organization Risk Level | Allocation Amount | Budgeted Amount | Total Commitment Amount | Recommend for Funding | Comments | Final Decision | Applicant Notified? |
    #490816
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Previous Review Step" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          |

  @545714 @Sprint-19 @US-544005 @M05 @BugTicket-NYSED-3587
  Scenario Outline: Verify that the grantee user sees a validation message after clicking the Save button when the budget entered for each line item under the Equipment budget category is less than $10,000.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Equipment       | 1000   | 450        | 450            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545714
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budget entries under the Equipment category must not be less than $10,000. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Equipment       | 10000  | 450        | 450            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545714
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - Budget entries under the Equipment category must not be less than $10,000. |

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @545718 @Sprint-19 @Sprint-19 @US-544005 @BugTicket-NYSED-3587
  Scenario Outline: Verify that the grantee user sees a validation message after clicking the Save button when the budget entered for each line item under the Equipment budget category is less than $10,000.
    #NeedToAddCaseinAPI
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FOCUS_AREA_NO_DETAILEDBUDGETING_YES"
#    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "FS10EMPLOYEEBENEFITS_BUDGETCATEGORY"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Specific                | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    And I click modal button "Close"
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Specific" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 1000                 | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545718
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 100                                                | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545718
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @545700 @Sprint-19 @US-544005 @M05 @BugTicket-NYSED-3587
  Scenario Outline: Verify that the 'Submit and Certify' user sees a validation message after clicking the Submit Application button when the Equipment budget category amount is less than $10,000 at the category level.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Equipment       | 1000   | 450        | 450            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545700
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budget entries under the Equipment category must not be less than $10,000. |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Equipment       | 10000  | 450        | 450            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545700
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - Budget entries under the Equipment category must not be less than $10,000. |

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @545717 @Sprint-19 @US-544005 @M05 @BugTicket-NYSED-3587
  Scenario Outline:Verify that the 'Submit and Certify' user sees a validation message after clicking the Submit to Grantor button when the Focus Area is set to 'No' and the budget is not entered for the Professional Staff Salaries or Support Staff Salaries.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "FS10PURCHASEDSERVICES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category   | Budget | Cash Match | Non-Cash Match |
      | Employee Benefits | 5000   | 450        | 450            |
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    #545717
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    #545717
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @545707 @Sprint-19 @US-544005 @M05 @BugTicket-NYSED-3587
  Scenario Outline:Verify that the 'Submit and Certify' user sees a validation message after clicking the Submit Application button when the Focus Area is set to 'Yes' and budget is not entered for Professional Staff Salaries or Support Staff Salaries in each Focus Area.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category   | Budget | Cash Match | Non-Cash Match |
      | Employee Benefits | 5000   | 450        | 450            |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    #545707
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for {SavedValue:AutomationPermanentFocusArea} |
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
    When I click on "Submit Application" in the page details
    #545707
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for {SavedValue:AutomationPermanentFocusArea} |

    Examples:
      | Announcement Name                                               | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | GRANTEE_SC   |

  @545712 @Sprint-19 @US-544005 @M05 @BugTicket-NYSED-3587
  Scenario Outline:Verify that the 'Submit and Certify' user sees a validation message after clicking the Submit Application button when the Focus Area is set to 'No' and the budget is not entered for the Professional Staff Salaries or Support Staff Salaries.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category   | Budget | Cash Match | Non-Cash Match |
      | Employee Benefits | 5000   | 450        | 450            |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    #545712
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    #545712
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |

    Examples:
      | Announcement Name                                               | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | GRANTEE_SC   |

  @545716 @Sprint-19 @US-544005 @M05
  Scenario Outline:Verify that the 'Submit and Certify' user sees a validation message after clicking the Submit to Grantor button when the Focus Area is set to 'Yes' and budget is not entered for Professional Staff Salaries or Support Staff Salaries in each Focus Area.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTED_COMPETATIVE_DETAILE_BUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "FS10PURCHASEDSERVICES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 10000                | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545717
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for {SavedValue:AutomationPermanentFocusArea} |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 88.988         | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545717
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for {SavedValue:AutomationPermanentFocusArea} |

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @NYSED-3500-RI @NYSED-3496-RI @NYSEDSprint-26 @US-NYSED-2110 @M05
  Scenario Outline: Verify that the Grantee user sees that all fields present in the budget summary sections are computed properly.
  |Verify that the Grantee user sees that every line item entered against Purchased Services budget category is not considered in the Indirect cost calculation, if the Subcontract? is selected as ‘No’ in the budget line item.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside table
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | 49000                | 100        | 100            |
      | Description of Item1        | Yes             | Provider of Services1 | Calculation of Cost1 | 33000                | 200        | 200            |
      | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | 50000                | 300        | 300            |
      | Description of Item3        | Yes             | Provider of Services3 | Calculation of Cost3 | 24000                | 400        | 400            |
      | Description of Item4        | No              | Provider of Services4 | Calculation of Cost4 | 50000                | 500        | 500            |
      | Description of Item5        | No              | Provider of Services5 | Calculation of Cost5 | 2341                 | 600        | 600            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Professional Staff Salaries - Item 1" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 7119             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 69561                | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 25700            | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefit-1 | 5500                 | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3500 #NYSED-3496
    Then I softly see field "Waiver" as "N/A"
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$26,388"
    Then I softly see field "Budgeted Direct Amount" as "$316,221"
    Then I softly see field "Total Budgeted Amount" as "$316,221"
    Then I softly see value "$26,388" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$316,221" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$316,221" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @NYSED-3493-RI @NYSED-3495-RI @NYSEDSprint-26 @US-NYSED-2110 @M05 @Bug-Ticket-NYSED-3587
  Scenario Outline: Verify that the Grantee user sees that every line item entered against Purchased Services budget category is considered in the Indirect cost calculation, if the Subcontract? is selected as ‘Yes’ in the budget line item .
  |Verify that the Grantee user sees after editing the Subcontract? field or after deleting the line item in the Purchased Services budget category, is updated in the Indirect cost calculation|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside table
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | 24000                | 100        | 100            |
      | Description of Item1        | Yes             | Provider of Services1 | Calculation of Cost1 | 2223                 | 200        | 200            |
      | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | 50000                | 300        | 300            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Professional Staff Salaries - Item 1" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 7119             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$8,334"
    Then I softly see field "Budgeted Direct Amount" as "$83,342"
    Then I softly see field "Total Budgeted Amount" as "$83,342"
    Then I softly see value "$8,334" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? |
      | Description of Item         | No              |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$5,934"
    #WillUpdateThisOnceBugResolved
    Then I softly see field "Budgeted Direct Amount" as "$83,342"
    Then I softly see field "Total Budgeted Amount" as "$83,342"
    Then I softly see value "$5,934" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #WillUpdateThisOnceBugResolved
    Then I softly see value "$83,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? |
      | Description of Item         | Yes             |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$8,334"
    Then I softly see field "Budgeted Direct Amount" as "$83,342"
    Then I softly see field "Total Budgeted Amount" as "$83,342"
    Then I softly see value "$8,334" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$5,934"
    #WillUpdateThisOnceBugResolved
    Then I softly see field "Budgeted Direct Amount" as "$59,342"
    Then I softly see field "Total Budgeted Amount" as "$59,342"
    Then I softly see value "$5,934" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #WillUpdateThisOnceBugResolved
    Then I softly see value "$59,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$59,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @541072 @541094 @NYSEDSprint-16 @US-538018 @M05 @RecommendedApplication @Bug-Ticket-NYSED-6582
  Scenario Outline:Verify that when associated coordinator initiates revisions, the grantee should see correct task type & subject - FDM
  |Verify that the new coordinators can see the inline actions 'Initiate Revision' in the Recommended Applications section when the Funding Decision Memo is in the Approved state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "4" seconds
    #541072
    Then I softly can see top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly can see top right button "Notify Selected Applicants" in flex table with id "---subAwardFromFDM:-:fdmNonRecommendedTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Funding Decision Memo"
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name                     |
      | Program Coordinator | {SavedValue:FD Username} |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    Then I softly can see row level action button "Initiate Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    And I click on "Initiate Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:recommendedTableId---"
    And I wait for "15" seconds
    And I navigate to "Revisions" sub tab
    #541094
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail

    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          |

  @542228 @541088 @542227 @NYSEDSprint-16 @US-538018 @M05
  Scenario Outline:Verify that the 2nd Approver see the task is generated when 1st/previous FDM Approver clicks on “Approve” button. .
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "PO" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Reject" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    #542228
    Then I softly can see top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    Then I softly can see row level action button "Edit" against "<Announcement Name>" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    And I edit the following rows inline in flex table with id "---applicationReview:-:rejectedApplicationTableId---" by clicking "Edit" :
      | Application Title   | Comments |
      | <Announcement Name> | Rejected |
    And I click on top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    Then I softly can see top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    Then I softly see value "True" for title "Applicant Notified?" against the value "<Announcement Name>" inside table "---applicationReview:-:rejectedApplicationTableId---"
    #541088
    Then I softly can see top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    Then I softly cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Funding Decision Memo"
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name                     |
      | Program Coordinator | {SavedValue:FD Username} |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    #542227
    Then I softly can see top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"
    Then I softly cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "---applicationReview:-:rejectedApplicationTableId---"

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | FO          |

  @541972 @NYSEDSprint-16 @US-538018 @M05
  Scenario Outline:Verify that old coordinators cannot see the page-level, section-level, and inline actions on the Funding Decision Memo layout in all sections. - Created state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Funding Decision Memo"
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name                      |
      | Program Coordinator | {SavedValue:PO1 Username} |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    #541972
    Then I softly cannot see top right dropdown button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Submit For Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---subAwardFromFDM:-:fdmApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FO Username}" in flex table with id "---subAwardFromFDM:-:fdmApproverTableId---"

    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          |

  @541088-2 @NYSEDSprint-16 @US-538018 @M05
  Scenario Outline:Verify that internal users(except FD profile) other than coordinators cannot see the page-level, section-level, and inline actions on the Funding Decision Memo layout in all sections.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I navigate to "Funding Decision Memo" sub tab
    #541088
    Then I softly cannot see top right dropdown button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Submit For Approval" in page detail
    Then I softly cannot see top right button "Notify Selected Applicants" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly cannot see row level action button "View" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly cannot see row level action button "Initiate Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    Then I softly cannot see row level action button "Create Subaward" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---subAwardFromFDM:-:fdmApproverTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FO Username}" in flex table with id "---subAwardFromFDM:-:fdmApproverTableId---"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I navigate to "Funding Decision Memo" sub tab
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | No                    | Recommended |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I navigate to "Funding Decision Memo" sub tab
    Then I softly cannot see top right button "Notify Selected Applicants" in flex table with id "---subAwardFromFDM:-:fdmNonRecommendedTableId---"
    Then I softly cannot see row level action button "Edit" against "<Announcement Name>" in flex table with id "---subAwardFromFDM:-:fdmNonRecommendedTableId---"

    Examples:
      | Announcement Name                                | InternalUser | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           | FO          |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           | FO          |
#      | {SavedValue:Automation Runtime FDM Announcement} | EXE          | FO          |
#      | {SavedValue:Automation Runtime FDM Announcement} | ADMIN        | FO          |

  @NYSED-6871 @NYSED-Sprint-31 @US-NYSED-3900 @M05
  Scenario Outline:Verify that when an internal user is the Announcement owner and as a coordinator, if the Revision is initiated on the application and submitted to the Grantor, then the ‘Applicant Response’ section should be visible to all profile users.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Revision Submitted"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "2" seconds
    #NYSED-6871
    Then I softly see field "Details" as "Automation Request Iniatiation" in "Applicant Response" pageblock
    Given I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "2" seconds
    #NYSED-6871
    Then I softly see field "Details" as "Automation Request Iniatiation" in "Applicant Response" pageblock
    Given I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "2" seconds
    #NYSED-6871
    Then I softly see field "Details" as "Automation Request Iniatiation" in "Applicant Response" pageblock
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "2" seconds
    #NYSED-6871
    Then I softly see field "Details" as "Automation Request Iniatiation" in "Applicant Response" pageblock
    Given I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Revisions" sub tab
    And I wait for "2" seconds
    #NYSED-6871
    Then I softly see field "Details" as "Automation Request Iniatiation" in "Applicant Response" pageblock

    Examples:
      | Announcement Name                                | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PO          | GRANTEE_SC   |

  @NYSED-8814 @NYSED-Sprint-32 @US-NYSED-6966 @M05
  Scenario Outline: Verify that the Internal user cannot see the ‘Funding Decision Memos (FDM) - My Records’ list filter from the Applications phase → Funding Decision Memos (FDM) left navigation module.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    #NYSED-8814
    Then I softly do not see toggle option "Funding Decision Memos (FDM) - My Records" inside flex table id "---subAwardFromFDM:-:fdmTableId---"

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |

  @NYSED-8405 @NYSED-Sprint-32 @US-NYSED-5962 @M05
  Scenario Outline: Verify that the internal user can add new Funding Accounts via FDM and view the newly added funding account in the Announcement layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    When I perform quick search for "{SavedValue:AutomationExternalFundingAccountTitle}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:AutomationExternalFundingAccountTitle}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    And I click modal button "Close"
    #NYSED-8405
    Then I softly see value "{SavedValue:AutomationExternalFundingAccountTitle}" for title "Funding Account Title" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---" by clicking "Edit" :
      | Funding Account Title                              | FDM Pre-Encumbrance |
      | {SavedValue:AutomationExternalFundingAccountTitle} | 1000                |
    Then I softly see value "$1,000" for title "FDM Pre-Encumbrance" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---" by clicking "Edit" :
      | Funding Account Title                    | FDM Pre-Encumbrance |
      | {SavedValue:InternalFundingAccountTitle} | 900                 |
    Then I softly see value "$900" for title "FDM Pre-Encumbrance" inside table "---subAwardFromFDM:-:fdmFundingAccountTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly see value "$900" for title "Pre-Encumbrance" against the value "{SavedValue:InternalFundingAccountTitle}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$1,000" for title "Pre-Encumbrance" against the value "{SavedValue:AutomationExternalFundingAccountTitle}" inside table "---announcement:-:fundingAccountsTableId---"


    Examples:
      | Announcement Name                                | Coordinator | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          | FD           |