@directedAnnouncementsNysed @announcementExecution @announcementUAT
Feature: Validate all scenarios in the directed Announcement tab

  @489008  @Sprint-00 @US-487276 @M04Announcement
  Scenario Outline: Verify that the Internal User does not see the question "Leverage Allowed?" on the create announcement modal.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    Then I softly cannot see field on modal "Leverage Allowed?" inside page block
    Examples:
      | UserType |
      | PM       |
#      | EXE      |

  @489496 @Sprint-00 @US-487276 @M04Announcement
  Scenario Outline: Verify that the Internal User does not see the question "Leverage Allowed?" on the create announcement modal.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block
    Examples:
      | UserType |
      | PM       |
#      | EXE      |

  @492305 @534228-D @Sprint-01 @US-487309 @M04Announcement
  Scenario Outline: Verify that the Internal User can see 'Cert Level' and 'Available balance' columns(after the Funding Account column)  on the Funding Accounts section of the Financials Tab on the announcement - Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    #534228
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
     #534228
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
     #534228
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I "Send to Owner" in the approval decision
    And I pause execution for "100" seconds
    Then I see field "Status" as "Draft"
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Cert Level | Available Balance | Pre-Encumbrance |
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
     #534228
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |
     #534228
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Financials" sub tab
    #492305
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |
     #534228
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | EXE      | {SavedValue:EXE Username} |

  @492317 @VerifythattheInternalUsercanseeAppropriationamountandAvailablebalancecolumnsaftertheFundingAccountcolumnontheFundingAccountssectionoftheFinancialsTabontheannouncementDirected @Sprint-01 @US-487309 @M04Announcement
  Scenario Outline: Verify that the Internal User can see 'Cert Level' and 'Available balance' columns(after the Funding Account column)  on the Funding Accounts section of the Financials Tab on the announcement - Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount1}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount1}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Cert Level" as "AppropriationAmount1"
    And I save the field labeled "Available Balance" as "AvailableBalance1"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    And I save the field labeled "Cert Level" as "AppropriationAmount2"
    And I save the field labeled "Available Balance" as "AvailableBalance2"
    And I click on back arrow
    Then I softly see field inside table "FundingAccount__r.AppropriationBalance__c" not in edit mode
    Then I softly see field inside table "FundingAccount__r.AvailableBalance__c" not in edit mode
    Then I softly see value "{SavedValue:AppropriationAmount1}" for title "Cert Level" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AppropriationAmount2}" for title "Cert Level" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Cert Level" as "AppropriationAmount1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Cert Level" as "AppropriationAmount2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Cert Level" as "Total" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AppropriationAmount1}" and "{SavedValue:AppropriationAmount2}" is equal to "{SavedValue:Total}"
    Then I softly see value "{SavedValue:AvailableBalance1}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AvailableBalance2}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Available Balance" as "BalanceTotal" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AvailableBalance1}" and "{SavedValue:AvailableBalance2}" is equal to "{SavedValue:BalanceTotal}"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I softly see field inside table "FundingAccount__r.AppropriationBalance__c" not in edit mode
    Then I softly see field inside table "FundingAccount__r.AvailableBalance__c" not in edit mode
    Then I softly see value "{SavedValue:AppropriationAmount1}" for title "Cert Level" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AppropriationAmount2}" for title "Cert Level" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Cert Level" as "AppropriationAmount1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Cert Level" as "AppropriationAmount2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Cert Level" as "Total" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AppropriationAmount1}" and "{SavedValue:AppropriationAmount2}" is equal to "{SavedValue:Total}"
    Then I softly see value "{SavedValue:AvailableBalance1}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AvailableBalance2}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Available Balance" as "BalanceTotal" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AvailableBalance1}" and "{SavedValue:AvailableBalance2}" is equal to "{SavedValue:BalanceTotal}"
    And I "Send to Owner" in the approval decision
    And I pause execution for "3" seconds
    Then I see field "Status" as "Draft"
    When I navigate to "Financials" sub tab
    Then I softly see field inside table "FundingAccount__r.AppropriationBalance__c" not in edit mode
    Then I softly see field inside table "FundingAccount__r.AvailableBalance__c" not in edit mode
    Then I softly see value "{SavedValue:AppropriationAmount1}" for title "Cert Level" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AppropriationAmount2}" for title "Cert Level" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Cert Level" as "AppropriationAmount1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Cert Level" as "AppropriationAmount2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Cert Level" as "Total" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AppropriationAmount1}" and "{SavedValue:AppropriationAmount2}" is equal to "{SavedValue:Total}"
    Then I softly see value "{SavedValue:AvailableBalance1}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AvailableBalance2}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Available Balance" as "BalanceTotal" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AvailableBalance1}" and "{SavedValue:AvailableBalance2}" is equal to "{SavedValue:BalanceTotal}"
    And I wait for "30" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    Then I softly see field inside table "FundingAccount__r.AppropriationBalance__c" not in edit mode
    Then I softly see field inside table "FundingAccount__r.AvailableBalance__c" not in edit mode
    Then I softly see value "{SavedValue:AppropriationAmount1}" for title "Cert Level" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AppropriationAmount2}" for title "Cert Level" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Cert Level" as "AppropriationAmount1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Cert Level" as "AppropriationAmount2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Cert Level" as "Total" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AppropriationAmount1}" and "{SavedValue:AppropriationAmount2}" is equal to "{SavedValue:Total}"
    Then I softly see value "{SavedValue:AvailableBalance1}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AvailableBalance2}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Available Balance" as "BalanceTotal" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AvailableBalance1}" and "{SavedValue:AvailableBalance2}" is equal to "{SavedValue:BalanceTotal}"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    When I navigate to "Financials" sub tab
    Then I softly see field inside table "FundingAccount__r.AppropriationBalance__c" not in edit mode
    Then I softly see field inside table "FundingAccount__r.AvailableBalance__c" not in edit mode
    Then I softly see value "{SavedValue:AppropriationAmount1}" for title "Cert Level" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AppropriationAmount2}" for title "Cert Level" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Cert Level" as "AppropriationAmount1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Cert Level" as "AppropriationAmount2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Cert Level" as "Total" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AppropriationAmount1}" and "{SavedValue:AppropriationAmount2}" is equal to "{SavedValue:Total}"
    Then I softly see value "{SavedValue:AvailableBalance1}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AvailableBalance2}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Available Balance" as "BalanceTotal" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AvailableBalance1}" and "{SavedValue:AvailableBalance2}" is equal to "{SavedValue:BalanceTotal}"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Financials" sub tab
    Then I softly see field inside table "FundingAccount__r.AppropriationBalance__c" not in edit mode
    Then I softly see field inside table "FundingAccount__r.AvailableBalance__c" not in edit mode
    Then I softly see value "{SavedValue:AppropriationAmount1}" for title "Cert Level" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AppropriationAmount2}" for title "Cert Level" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Cert Level" as "AppropriationAmount1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Cert Level" as "AppropriationAmount2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Cert Level" as "Total" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AppropriationAmount1}" and "{SavedValue:AppropriationAmount2}" is equal to "{SavedValue:Total}"
    Then I softly see value "{SavedValue:AvailableBalance1}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:AvailableBalance2}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance2" from flex table "---announcement:-:fundingAccountsTableId---"
    And I save the value from row "3" for column name "Available Balance" as "BalanceTotal" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see addition of two fields "{SavedValue:AvailableBalance1}" and "{SavedValue:AvailableBalance2}" is equal to "{SavedValue:BalanceTotal}"
    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | EXE      | {SavedValue:EXE Username} |

  @495631 @495664 @495676 @Sprint-03 @US-490908 @M04Announcement
  Scenario Outline: Verify that Internal user can see new required field  'Indirect Rate Type' is add on Announcement layout->Financials (tab)->Financial Details (section)	 with dropdown options - Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    Then I softly see field "Indirect Rate Type" inside page block
    Then I see only the following ordered options in dropdown field "Indirect_Rate_Type__c" :
      | --None-- | Restricted | Unrestricted | Not Allowed |
    And I enter value "--None--" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Financials Tab - Indirect Rate Type is required to submit for approval. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "a#@&" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see field "Maximum Indirect Rate %" as ""
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-123" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Financials Tab - The Maximum Indirect Rate cannot be Negative Value |
    And I enter value "30.888" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see field "Maximum Indirect Rate %" as "30.88%"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100.56" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Financials Tab - The Maximum Indirect Rate cannot be greater than 100%. |
    #@495664
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "a#@&" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see field "Maximum Indirect Rate %" as ""
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-123" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Financials Tab - The Maximum Indirect Rate cannot be Negative Value |
    And I enter value "30.888" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see field "Maximum Indirect Rate %" as "30.88%"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100.56" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Financials Tab - The Maximum Indirect Rate cannot be greater than 100%. |
    #495676
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    Then I softly do not see "Maximum Indirect Rate %" page block displayed
    When I click on "Save" in the page details
    When I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |

  @495671 @495685 @Sprint-03 @US-490908 @M04Announcement
  Scenario Outline: Verify that Internal user should not see validation if not enter value in field  'Maximum Indirect Rate %' for the optional type 'Restricted'  - Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition_NoIndirect" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    #495671
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    #495685
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Unrestricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "60" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see field "Maximum Indirect Rate %" as "60.00%"
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
    And I "Send to Owner" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Draft"
    And I pause execution for "60" seconds
    When I navigate to "Financials" sub tab
    #495671
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
      #495685
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Unrestricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "60" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see field "Maximum Indirect Rate %" as "60.00%"
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
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Financials" sub tab
    #495671
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    #495685
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Unrestricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | EXE      | {SavedValue:EXE Username} |
#      | PO       | {SavedValue:PO Username}  |

  @496015 @Sprint-03 @US-487967 @NYSED-1104-published @NYSEDSprint-21 @US-NYSED-927 @M04 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type" on Opportunity layout (Publish and Qualify)- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EXE Username}" in flex table with id "---announcement:-:contactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:PM Username}" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EXE Username}" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:PM Username}" in flex table with id "---announcement:-:contactTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @Dir @496069 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Unrestricted'- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
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
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I get the "EGMS ID"
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
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
    And I wait for "3" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Unrestricted"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "100.00%"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Unrestricted"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "100.00%"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @Dir @496070 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Unrestricted'- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
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
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I get the "EGMS ID"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
    And I wait for "3" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Restricted"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "100.00%"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Restricted"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "100.00%"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @Dir @496072 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user cannot see field "Maximum Indirect Rate%" on Opportunity layout (Publish and Qualify), when indirect rate is 'Not Allowed'- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
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
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I get the "EGMS ID"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Not Allowed"
    Then I softly do not see "Maximum Indirect Rate%" page block displayed
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Not Allowed"
    Then I softly do not see "Maximum Indirect Rate%" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @Dir @496084 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type" and 'Maximum Indirect Rate%' on Opportunity layout which is converted to application- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I wait for "2" seconds
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
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
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "<IndirectType>" into field "Indirect_Rate_Type__c"
    And I enter value "50" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I get the "EGMS ID"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "<IndirectType>"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "50.00%"

    Examples:
      | UserType   | IndirectType |
      | GRANTEE_SC | Restricted   |
      | GRANTEE_SC | Unrestricted |
#      | GRANTEE_CE      |   Restricted     |
#      | GRANTEE_CE      |   Unrestricted   |

  @Dir @496097 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type- Not Allowed" on Opportunity layout which is converted to application- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
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
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I get the "EGMS ID"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Not Allowed"
    Then I softly do not see "Maximum Indirect Rate%" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @504655 @504889 @Sprint-05 @US-500360 @M04Announcement
  Scenario Outline: Verify that FD can associate Funding Accounts and edit/remove 'Pre-Encumbrance' field when Directed/Formula announcement is in status- Created, Under Revision, Submitted for Review, and Review Completed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount2}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I get the "EGMS ID"
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    #504889
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I pause execution for "100" seconds
    Then I see field "Status" as "Draft"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    #504889
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |

  @504883 @Sprint-05 @US-500360 @M04Announcement
  Scenario: Verify that FD user can not associate and remove Funding Accounts but can edit funding accounts (Pre-Encumbrance is editable) when Directed/Formula announcement is in status- Publish and Closed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FUNDING_ACCOUNT"
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:AutomationExternalFundingAccountTitle}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:AutomationExternalFundingAccountTitle}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:AutomationExternalFundingAccountTitle}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode

  @504889-RJ @Sprint-05 @US-500360 @M04Announcement
  Scenario: Verify that FD users cannot edit 'Pre-Encumbrance' field when Formula/Directed announcement is in status- Submitted for Approval, Approved and Rejected Status
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount2}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
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
    And I "Reject" in the approval decision
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    #504889
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"

  @505004 @Sprint-05 @US-500360 @M04Announcement
  Scenario:Verify that when FD users, updates amounts on Funding information section, amounts should be recalculated on funding account- Directed/Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount2}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -3500           |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | t               |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | *&$             |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 1000000000000   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    Then I softly see field "Available Balance" as "{SavedValue:AvailableBalance}"
    And I click on back arrow
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | -3500           |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | t               |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | *&$             |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 1000000000000   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccount2}"
    Then I softly see field "Available Balance" as "{SavedValue:AvailableBalance}"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FUNDING_ACCOUNT"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -3500           |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | t               |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | *&$             |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 1000000000000   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    Then I softly see field "Available Balance" as "{SavedValue:AvailableBalance}"
    And I click on back arrow
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | -3500           |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | t               |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | *&$             |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 1000000000000   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccount2}"
    Then I softly see field "Available Balance" as "{SavedValue:AvailableBalance}"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -3500           |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | t               |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | *&$             |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 1000000000000   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I save the value from row "1" for column name "Available Balance" as "AvailableBalance" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    Then I softly see field "Available Balance" as "{SavedValue:AvailableBalance}"
    And I click on back arrow
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | -3500           |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | t               |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | *&$             |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 1000000000000   |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    And I save the value from row "2" for column name "Available Balance" as "AvailableBalance" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    Then I softly see field "Available Balance" as "{SavedValue:AvailableBalance}"

  @504919-D @Sprint-05 @US-500360 @M04Announcement
  Scenario Outline: Verify that an announcement owner see validation message when clicked on 'Submit for Approval' and any funding account is not associated on Formula/Directed/Competitive announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financials tab - At least 1 funding account needs to be associated with announcement, contact FD profile user for same. |
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | EXE      |
#      | ADMIN    |

  @503360 @Sprint-05 @US-499231 @bug_id_508787 @M04Announcement
  Scenario Outline: Verify that user should see below fields are removed from announcement layout- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly do not see "Federal/NGO Program" page block displayed
    Then I softly cannot see field "Internal Organization" inside page block
    Then I softly cannot see field "Internal Division/Office" inside page block
    Then I softly cannot see field "Program Type" inside page block
    Then I softly cannot see field "Program Income" inside page block
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |

  @503421 @Sprint-05  @US-499231 @M04Announcement
  Scenario Outline: Verify that user should not see validations related to 'Carry Over as N' - Directed Announcement in created state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I clear the value from field "First_Payment__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
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
    And I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Y' |
    And I softly see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "10" into field "First_Payment__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "First Payment %" as "10.00%"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |

  @503422 @Sprint-05 @US-499231 @M04Announcement
  Scenario Outline: Verify that user should not see validations related to 'Carry Over as N' - Directed Announcement in send back and under revision state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I navigate to "Overview" sub tab
    And I enter value "No" into field "Carry_Over__c"
    And I enter value "No" into field "Carryover_Limit__c"
    And I clear the value from field "Carryover_Limit_Percent__c"
    And I clear the value from field "First_Payment__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I get the "EGMS ID"
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
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    And I softly see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "50" into field "First_Payment__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.              |
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    And I "Send to Owner" in the approval decision
    And I wait for "60" seconds
    Then I softly see field "Status" as "Draft"
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I clear the value from field "First_Payment__c"
    When I click on "Save" in the page details
    Then I softly see field "Carry Over" as "No"
    Then I softly see field "Carry Over Limit %" as ""
    Then I softly see field "First Payment %" as ""
    And I click on "Submit For Approval" in the page details
    And I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    And I softly see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "50" into field "First_Payment__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.              |
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Carry Over Limit %" as ""
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    Then I softly see field "Carry Over" as "No"
    Then I softly see field "Carry Over Limit" as "No"
    Then I softly see field "Carry Over Limit %" as ""
    And I click on "Submit For Approval" in the page details
    And I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Carry Over Limit %" as ""

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | EXE      | {SavedValue:EXE Username} |

  @503369 @Sprint-05 @US-499231 @bug_id_511587 @M04Announcement
  Scenario Outline:Verify that user should see below fields are added at announcement layout and related validations- Directed Announcement with 'Carry Over as Yes'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Carry Over" inside page block
    Then I softly see field "Carry Over Limit" inside page block
    Then I softly see field "Carry Over Limit %" inside page block
    Then I softly see field "First Payment %" inside page block
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    When I hovering mouse on help text icon inside page block detail "Carry Over"
    Then I softly see "Indicates whether funds can be carried over to the next year." shown as help text
    Then I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Yes" into field "Carry_Over__c"
    When I clear the value from field "First_Payment__c"
    Then I softly see field "Carry Over Limit" inside page block
    When I hovering mouse on help text icon inside page block detail "Carry Over Limit"
    Then I softly see "Indicates whether a waiver is needed to carry appropriation forward. If "No" no waiver is required and any leftover money can be carried over" shown as help text
    And I enter value "Yes" into field "Carryover_Limit__c"
    When I hovering mouse on help text icon inside page block detail "Carry Over Limit %"
    Then I softly see "A percent of total available appropriation that can be carried over if a waiver is required and not received." shown as help text
    When I clear the value from field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    Then I softly see "The percentage of the approved budget that will be forwarded to the agency as a first payment. Input 0, for no advance." shown as help text
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.              |
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    Then I can see top right button "Edit" in page detail
    Then I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-11" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Carry Over Limit % cannot be negative. |
    And I enter value "#%" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    Then I softly see field "Carry Over Limit %" as ""
    Then I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100.55" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Carry Over Limit % cannot be greater than 100%. |
    And I enter value "40.5555" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    Then I softly see field "Carry Over Limit %" as "40.55%"
    Then I can see top right button "Edit" in page detail
    Then I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-11" into field "First_Payment__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | First Payment % cannot be negative. |
    And I enter value "#%" into field "First_Payment__c"
    When I click on "Save" in the page details
    Then I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100.55" into field "First_Payment__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | First Payment % cannot be greater than 100%. |
    And I enter value "40.5555" into field "First_Payment__c"
    When I click on "Save" in the page details
    Then I softly see field "First Payment %" as "40.55%"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | FD       |

  @503371 @Sprint-05 @US-499231 @M04Announcement
  Scenario Outline: Verify that user should see below validations on send back and under revision state records- Directed Announcement and  Carry Over as Yes
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I get the "EGMS ID"
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
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I wait for "60" seconds
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Yes" into field "Carry_Over__c"
    And I enter value "Yes" into field "Carryover_Limit__c"
    When I clear the value from field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    Then I can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.              |
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Yes" into field "Carryover_Limit__c"
    When I clear the value from field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    Then I can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.              |
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | EXE      | {SavedValue:EXE Username} |
#      | FO       | {SavedValue:PO Username}  |
#      | FD       | {SavedValue:EXE Username} |

  @506066 @Sprint-06 @US-494448 @M04Announcement
  Scenario Outline: Verify that Internal user see that fields are defaulted to 'No' and are hidden on the extended create announcement (directed) modal and Announcement Layout->Overview Tab->Announcement Specific Settings when the budget type is selected as 'Lump Sum'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    Then I see only the following ordered options in dropdown field "Budget_Category_Package__c" :
      | --None-- | FS-10 | Lump Sum |
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    Then I softly do not see "Focus Areas Required?" page block displayed
    Then I softly do not see "Allocation Level" page block displayed
    Then I softly do not see "Are Expense Details Required on Reimbursements?" page block displayed
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see "Focus Areas Required?" page block displayed
    Then I softly do not see "Allocation Level" page block displayed
    Then I softly do not see "Are Expense Details Required on Reimbursements?" page block displayed

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |

  @505712 @Sprint-06 @US-501279 @M04Announcement
    @NYSED-10276 @NYSED-Sprint-36 @US-NYSED-9919 @M06
  Scenario Outline: Verify that Fund Year field is added at the directed announcement list view, next to Announcement Name Column.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Directed Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Directed Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Directed Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Directed Announcements - All"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @505668-D @505652-D @Sprint-06 @US-501279 @M04Announcement
  Scenario Outline: Verify that Fund Year field is added at Announcement Layout->Overview tab->Information Section, is auto-populated as Fund Code + Last 2 digits of Year and is not editable
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Fund Code" as "1990"
    Then I softly see field "Year" as "2030"
    Then I softly see field "Fund Year" as "1990-30"
    When I click on "Edit" in the page details
    Then I softly see field "Fund Year" is not editable
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    #505652
    When I click on "Edit" in the page details
    Given I navigate to "Overview" sub tab
    And I enter value "--None--" into field "NYSED_Year__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required in the Overview tab under the Information section. |
    When I click on "Cancel" in the page details
    And I wait for "5" seconds
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Fund Code" as "1990"
    Then I softly see field "Year" as "2010"
    Then I softly see field "Fund Year" as "1990-10"
    When I click on "Edit" in the page details
    Then I softly see field "Fund Year" is not editable
    #505652
    Given I navigate to "Overview" sub tab
    And I enter value "--None--" into field "NYSED_Year__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required in the Overview tab under the Information section. |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | FO       | {SavedValue:FO Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | FD       | {SavedValue:FD Username}  |

  @506505 @507992 @507994 @507998 @509333 @507999 @508001 @508078 @Sprint-06 @US-504645 @US-503582 @M04Announcement
  Scenario Outline: Verify that the PM/PO/FD/FO profile users only can see the 'New' button on the Announcement phase->Directed announcement list view.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    Then I softly can see top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #507992
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    #507994
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I see only the following headers in table with id "---announcement:-:directedAddInviteApplicantTableId---" :
      |  | Institution ID | SED Code | Organization | Organization Type |
    #509333
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Selected Applicants are associated successfully |
    When I click modal button "Close"
    #507998
    Then I see only the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Last Updated By | Last Updated |
    #507999
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see field "Institution ID" is not editable
    Then I softly see field "SED Code" is not editable
    Then I softly see field "Applicants" is not editable
    #508001
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on top right button "Download in Excel " in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Institution ID | SED Code | Applicants                   |
      | 166485411256   | CACP12   | {SavedValue:SubrecipientOrg} |
    #508078
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "By Applicant and Focus Area.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @506602 @506532-D @506879-D @506542-D @506608-D @506613-D @508813 @Sprint-06 @US-504645 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner (PM/PO/FD/FO profile users only) can see that the announcement row level Edit action and record level edit action are available to the record owner only.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I wait for "5" seconds
    #506532
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Overview" sub tab
    And I enter value "10" into field "GranteeMatch__c"
    Then I softly see fields "Soft_Application_Due_Date__c" is in edit mode
    When I enter value "Yes" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Subrecipient Match (%)" as "10.00%"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    #508813 #MightbeInvalidNeedsToDiscussWithQA
    When I click on "Update Details" in the page details
    When I enter in modal value "-1" into field "Bud_Stop__c"
    When I enter in modal value "-20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d-1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d-20}"
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I enter value "12" into field "GranteeMatch__c"
    Then I softly see fields "Soft_Application_Due_Date__c" is in edit mode
    When I enter value "Yes" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Subrecipient Match (%)" as "12.00%"
    And I wait for "5" seconds
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d-1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d-20}"
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    #bug-id-515241
#    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Overview" sub tab
    And I enter value "13" into field "GranteeMatch__c"
    Then I softly see fields "Soft_Application_Due_Date__c" is in edit mode
    When I enter value "No" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Subrecipient Match (%)" as "13.00%"
    #506532-C
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |
#      | PO       | {SavedValue:PO Username}  | PM       | FO            | {SavedValue:FO Username}  |
#      | FO       | {SavedValue:FO Username}  | FD       | FD            | {SavedValue:FD Username}  |
#      | FD       | {SavedValue:FD Username}  | ADMIN    | EXE           | {SavedValue:FD Username}  |
#      | EXE      | {SavedValue:EXE Username} | FO       | PM            | {SavedValue:PM Username}  |

  @506608-D-Sprint6 @506613-D @Sprint-06 @US-504645 @M04Announcement @Bug-Ticket-539331
  Scenario Outline: Verify that the Announcement Owner (PM/PO/FD/FO profile users only) can see that the announcement row level Edit action and record level edit action are available to the record owner only.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    #@506613-D
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    And I wait for "5" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | You don`t have sufficient access to edit this record |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
     #506608-D
    And I navigate to "Announcements" tab
    And I wait for "4" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
     #@506608-C
    And I navigate to "Announcements" tab
    And I wait for "5" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    #@506613-D
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    And I wait for "4" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I softly see the following messages in the page details contains:
      | You don`t have sufficient access to edit this record |

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |
#      | PO       | {SavedValue:PO Username}  | PM       | FO            | {SavedValue:FO Username}  |
#      | FO       | {SavedValue:FO Username}  | FD       | FD            | {SavedValue:FD Username}  |
#      | FD       | {SavedValue:FD Username}  | ADMIN    | EXE           | {SavedValue:FD Username}  |
#      | EXE      | {SavedValue:EXE Username} | FO       | PM            | {SavedValue:PM Username}  |

  @NYSED-2039 @506541-D @NYSED-2042 @Sprint-06 @US-503093 @US-504645 @NYSEDSprint-24 @US-NYSED-1804 @M04Announcement
  Scenario Outline: Verify that Announcement owner can see updated 'Eligible Applicant Types' List at Announcement layout->Overview tab->Eligibility Details section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #NYSED-2042
    And I pause execution for "3" seconds
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Public School Districts" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Public Schools" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "BOCES" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Library Systems/Libraries" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Local Governments" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Institutions of Higher Education" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Community Based Organizations" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Other" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Non-public Schools" under list "Eligible Applicant Types"
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "Museums & Historical Societies" under list "Eligible Applicant Types"
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I enter value "Public Schools" into field "EligibleApplicantTypes__c"
    And I enter value "BOCES" into field "EligibleApplicantTypes__c"
    And I enter value "Library Systems/Libraries" into field "EligibleApplicantTypes__c"
    And I enter value "Local Governments" into field "EligibleApplicantTypes__c"
    And I enter value "Institutions of Higher Education" into field "EligibleApplicantTypes__c"
    And I enter value "Community Based Organizations" into field "EligibleApplicantTypes__c"
    And I enter value "Museums & Historical Societies" into field "EligibleApplicantTypes__c"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "Public School Districts"
    Then I softly see field "Eligible Applicant Types" as "Other"
    Then I softly see field "Eligible Applicant Types" as "Non-public Schools"
    Then I softly see field "Eligible Applicant Types" as "Public Schools"
    Then I softly see field "Eligible Applicant Types" as "BOCES"
    Then I softly see field "Eligible Applicant Types" as "Library Systems/Libraries"
    Then I softly see field "Eligible Applicant Types" as "Local Governments"
    Then I softly see field "Eligible Applicant Types" as "Institutions of Higher Education"
    Then I softly see field "Eligible Applicant Types" as "Community Based Organizations"
    Then I softly see field "Eligible Applicant Types" as "Museums & Historical Societies"

    Examples:
      | UserType | ReviewerUser | Reviewer                 | ReviewerUser1 | Reviewer1                |
      | PM       | PO           | {SavedValue:PO Username} | FO            | {SavedValue:FO Username} |
#      | PO       | FO           | {SavedValue:FO Username} | PO           | {SavedValue:PO Username} |
#      | FO       | FD           | {SavedValue:FD Username} | FO           | {SavedValue:FO Username} |
#      | FD       | EXE          | {SavedValue:FD Username} | FO           | {SavedValue:FO Username} |

  @509129 @508003 @508041 @508014 @508018 @508032 @508010 @508005 @508003 @Sprint-06 @US-503582 @M04Announcement
  Scenario Outline: Verify that the announcement owner sees the Applicants section's default sorting is by Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    #509129
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "Applicants.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any Applicants. |
    And I click modal button "Close"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
   #508003
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "Applicants.xlsx" into library
    And I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
      #508005
    And I Update "321456987443" value in "4" row and "1" column in "Applicants.xlsx"
    And I Update "NYH12" value in "4" row and "2" column in "Applicants.xlsx"
    And I Update "{SavedValue:SubrecipientSchoolOrg} " value in "4" row and "3" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I wait for "10" seconds
    And I refresh the page
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |
   ##508014
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "" value in "3" row and "1" column in "Applicants.xlsx"
    And I Update "" value in "4" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
      | Row #3 - The Institution ID is missing.      |
      | Row #4 - The Institution ID is missing.      |
    And I click modal button "Close"
    #508018
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "-12564" value in "3" row and "1" column in "Applicants.xlsx"
    And I Update "12.365" value in "4" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                            |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "1234567891231" value in "3" row and "1" column in "Applicants.xlsx"
    And I Update "1234567891231" value in "4" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                            |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants.xlsx"
    And I Update "166485411255" value in "4" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                     |
      | Row #3 - Duplicate entry found for Institution ID (166485411255). The Institution ID must be unique for each row |
      | Row #4 - Duplicate entry found for Institution ID (166485411255). The Institution ID must be unique for each row |
    And I click modal button "Close"
    And I Update "123456789223" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "123456789323" value in "3" row and "1" column in "Applicants.xlsx"
    And I Update "123456789423" value in "4" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.    |
      | Row #2 - Institution ID not found: 123456789223 |
      | Row #3 - Institution ID not found: 123456789323 |
      | Row #4 - Institution ID not found: 123456789423 |
    And I click modal button "Close"
    #508032
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "2" row and "2" column in "Applicants.xlsx"
    And I Update "$@!&" value in "3" row and "2" column in "Applicants.xlsx"
    And I Update "-12365" value in "4" row and "2" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    Then I softly see value "CACP12" for title "SED Code" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "NYH12" for title "SED Code" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "NYS12" for title "SED Code" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    #508013
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "CACP12" value in "2" row and "2" column in "Applicants.xlsx"
    And I Update "{SavedValue:SubrecipientOrg}" value in "2" row and "3" column in "Applicants.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants.xlsx"
    And I Update "CACP12" value in "3" row and "2" column in "Applicants.xlsx"
    And I Update "{SavedValue:SubrecipientOrg}" value in "3" row and "3" column in "Applicants.xlsx"
    And I Update "166485411255" value in "4" row and "1" column in "Applicants.xlsx"
    And I Update "CACP12" value in "4" row and "2" column in "Applicants.xlsx"
    And I Update "{SavedValue:SubrecipientOrg}" value in "4" row and "3" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                      |
      | Row #3 - Duplicate entry found for Institution ID (166485411255). The Institution ID must be unique for each row. |
    And I click modal button "Close"
    And I delete the excel file "Applicants.xlsx"
    #508010
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "Instiion ID" value in "1" row and "1" column in "Applicants.xlsx"
    And I Update "SEDCode" value in "1" row and "2" column in "Applicants.xlsx"
    And I Update "Applican" value in "1" row and "3" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |

    Examples:
      | UserType |
      | PM       |
#      | PO        |
#      | EXE       |
#      | FO        |

  @508037 @Sprint-06 @US-503582 @M04Announcement
  Scenario Outline: Verify that the announcement owner sees the system should not delete the corresponding rows in the Applicants section if user delete a row in the downloaded Excel, and then upload the Excel.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I softly see value "{SavedValue:SubrecipientOrg}" for title "Applicants" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "{SavedValue:SubrecipientHealthOrg}" for title "Applicants" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "{SavedValue:SubrecipientSchoolOrg}" for title "Applicants" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on top right button "Download in Excel " in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants.xlsx"
    And I wait for "5" seconds
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |


    Examples:
      | UserType |
      | PM       |
#      | PO        |
#      | EXE       |
#      | FO        |

  @506905-D @507037-D @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see specified columns at Announcement layout->Financials tab->Budget Categories table and details in the table are populated as per the given excel when the budget type is selected as 'FS-10'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    #@506905-D
    And I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "FS-10"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Actions     | Budget Category             | Budget Category Code | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Action menu | Professional Staff Salaries | 15                   | Yes                                  |                                |
      | Action menu | Support Staff Salaries      | 16                   | Yes                                  |                                |
      | Action menu | Purchased Services          | 40                   | Yes                                  | $50,000                        |
      | Action menu | Supplies and Materials      | 45                   | Yes                                  |                                |
      | Action menu | Travel Expenses             | 46                   | Yes                                  |                                |
      | Action menu | Employee Benefits           | 80                   | Yes                                  |                                |
      | Action menu | Indirect Cost               | 90                   |                                      |                                |
      | Action menu | BOCES Purchased Services    | 49                   |                                      |                                |
      | Action menu | Minor Remodeling            | 30                   |                                      |                                |
      | Action menu | Equipment                   | 20                   |                                      |                                |
      #@507037-D
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I click on "Remove" icon for "Professional Staff Salaries" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I do not see value "Professional Staff Salaries" for title "Budget Category" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I click "Associate" after selection of "Professional Staff Salaries" in the table "---announcement:-:selectBudgetCategory---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Professional Staff Salaries" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly see fields "NYSED_InIndCostCal__c" is in edit mode
    Then I softly see fields "NYSED_LineItemAvailable__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSED_InIndCostCal__c" :
      | --None-- | Yes | No |
    And I click on top right button "Save" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | cdf#@@!                        |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  |                                |
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | 235366                         |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | $235,366                       |
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  |                                |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  |                                |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @507068-D @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline: Verify that peer reviewer can edit the details in the Budget Categories table which are populated as per given excel when Allow Record Editing is Yes and Budget type is selected as 'FS-10'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name       | Responsibility  | Description              | Due Date | Allow Record Editing |
      | <Reviewer> | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "<Reviewer>" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "<ReviewerUser>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "FS-10"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Actions     | Budget Category             | Budget Category Code | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Action menu | Professional Staff Salaries | 15                   | Yes                                  |                                |
      | Action menu | Support Staff Salaries      | 16                   | Yes                                  |                                |
      | Action menu | Purchased Services          | 40                   | Yes                                  | $50,000                        |
      | Action menu | Supplies and Materials      | 45                   | Yes                                  |                                |
      | Action menu | Travel Expenses             | 46                   | Yes                                  |                                |
      | Action menu | Employee Benefits           | 80                   | Yes                                  |                                |
      | Action menu | Indirect Cost               | 90                   |                                      |                                |
      | Action menu | BOCES Purchased Services    | 49                   |                                      |                                |
      | Action menu | Minor Remodeling            | 30                   |                                      |                                |
      | Action menu | Equipment                   | 20                   |                                      |                                |
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I click on "Remove" icon for "Professional Staff Salaries" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I do not see value "Professional Staff Salaries" for title "Budget Category" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I click "Associate" after selection of "Professional Staff Salaries" in the table "---announcement:-:selectBudgetCategory---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Professional Staff Salaries" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly see fields "NYSED_InIndCostCal__c" is in edit mode
    Then I softly see fields "NYSED_LineItemAvailable__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSED_InIndCostCal__c" :
      | --None-- | Yes | No |
    And I click on top right button "Save" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | cdf#@@!                        |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  |                                |
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | 235366                         |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | $235,366                       |
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  |                                |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  |                                |

    Examples:
      | UserType | Reviewer                 | ReviewerUser |
      | PM       | {SavedValue:PO Username} | PO           |
#      | PO        | {SavedValue:PM Username}   |  PM         |
#      | EXE       | {SavedValue:PO Username}   |  PO         |
#      | FO        | {SavedValue:EXE Username}  |  EXE        |

  @507087-D @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see specified columns are hidden when the budget type is selected as 'Lump Sum'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    Then I see only the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Actions | Budget Category | Budget Category Code |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Actions     | Budget Category | Budget Category Code |
      | Action menu | Lump Sum        | 0                    |
    Then I softly cannot see row level action button "Edit" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |


  @Dir @511020-D @510971-D @Sprint-07 @US-508916 @US-506360 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see a new field 'OSC Approved?' is added at Announcement Layout->Overview tab->Announcement Specific Settings section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    #NYSED-2113
    Then I softly cannot see field "OSC Approved?" inside page block
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #511020-D
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #511020-D
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
      #511020-D
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I click on "Unpublish" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    #NYSED-2113
    Then I softly cannot see field "OSC Approved?" inside page block
    #510971-D
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @512177-D @Sprint-07 @US-487964 @M04Announcement
  Scenario Outline: Verify that the grantee user cannot see the section-level instructions in the Applicants and Allocations section on the Opportunity.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Formula Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:publishedOpputunityTableId---"
    When I navigate to "Overview" sub tab
    Then I softly do not see "Applicants and Allocations" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @510767-D @510790-D @Sprint-07 @US-506360 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see a new field 'OSC Approved?' is added at Announcement Layout->Overview tab->Announcement Specific Settings section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
     #510767-D
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    Then I softly see field "Office" added after "Project Role"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB3" into field "NYSEDOffice__c"
    When I click on "Save" in the page details
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "Automation Contact" inside table "---announcement:-:contactTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---announcement:-:contactTableId---"
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    Then I softly see field "Office" added after "Project Role"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click on "Save" in the page details
    Then I softly see value "" for title "Office" against the value "Automation Contact" inside table "---announcement:-:contactTableId---"
    When I click on "Edit" icon for "Automation Contact" inside flex table with id "---announcement:-:contactTableId---"
    Then I softly see field "Office" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:contactTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---announcement:-:contactTableId---"
    #510790-D
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I see only the following headers in table with id "---announcement:-:annoucementContactTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    Then I see the following rows under the following headers in table with id "---announcement:-:contactTableId---" :
      | Name           | Office          |
      | Automation EXE | Automation Test |
    When I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:contactTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | Checked        |
    And I pause execution for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I wait for "2" seconds
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Under Revision"
     #510767-D
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    Then I softly see field "Office" added after "Project Role"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB3" into field "NYSEDOffice__c"
    When I click on "Save" in the page details
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "Automation Contact" inside table "---announcement:-:contactTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---announcement:-:contactTableId---"
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    Then I softly see field "Office" added after "Project Role"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click on "Save" in the page details
    Then I softly see value "" for title "Office" against the value "Automation Contact" inside table "---announcement:-:contactTableId---"
    When I click on "Edit" icon for "Automation Contact" inside flex table with id "---announcement:-:contactTableId---"
    Then I softly see field "Office" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:contactTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---announcement:-:contactTableId---"
    #510790-D
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I see only the following headers in table with id "---announcement:-:annoucementContactTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @511011-D @511334 @Sprint-07 @US-506360 @M04Announcement
  Scenario Outline: Verify that the FD user sees the updated validation message as 'Available Balance cannot be negative. Please adjust the Cert Level accordingly.'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100000000000    |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    #511334
    Then I see only the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Last Updated By | Last Updated |
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    And I Update "166987654255" value in "3" row and "1" column in "Applicants.xlsx"
    And I Update "NYH12" value in "3" row and "2" column in "Applicants.xlsx"
    And I Update "{SavedValue:SubrecipientHealthOrg}" value in "3" row and "3" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I refresh the page
    Then I softly see value "Automation PM" for title "Last Updated By" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I save the value from row "2" for column name "Last Updated" as "LastUpdated" from flex table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "{SavedValue:LastUpdated}" for title "Last Updated" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100000000000    |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #511334
    Then I see only the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Last Updated By | Last Updated |
    Then I softly see value "Automation PM" for title "Last Updated By" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I save the value from row "2" for column name "Last Updated" as "LastUpdated" from flex table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "{SavedValue:LastUpdated}" for title "Last Updated" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100000000000    |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    When I navigate to "Overview" sub tab
    #511334
    Then I see only the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Last Updated By | Last Updated |
    Then I softly see value "Automation PM" for title "Last Updated By" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I save the value from row "2" for column name "Last Updated" as "LastUpdated" from flex table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "{SavedValue:LastUpdated}" for title "Last Updated" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on "Unpublish" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    #511334
    Then I see only the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Last Updated By | Last Updated |
    Then I softly see value "Automation PM" for title "Last Updated By" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I save the value from row "2" for column name "Last Updated" as "LastUpdated" from flex table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "{SavedValue:LastUpdated}" for title "Last Updated" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100000000000    |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @510464 @510466 @511120 @511131 @Sprint-07 @US-487814 @487960 @bug_id_524793 @US-487960 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see the Section Action buttons after unpublishing the announcement. Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #511120
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #511120
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #511131
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    #511131
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    #510464
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    #510466
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Applicants are associated successfully |
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientSchoolOrg} |
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    And I Update "166987654255" value in "4" row and "1" column in "Applicants.xlsx"
    And I Update "NYH12" value in "4" row and "2" column in "Applicants.xlsx"
    And I Update "{SavedValue:SubrecipientHealthOrg}" value in "4" row and "3" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientSchoolOrg} |
      | {SavedValue:SubrecipientHealthOrg} |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    #511131
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @511120-RJ @Sprint-07 @US-487960 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see the following section-level actions and row-level edit and delete icons in the Applicants section are hidden for the following statuses of the announcement: Submitted for Approval, Approved, Rejected:
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #511120
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Download in Excel" in flex table with id "----announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    #511120
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Download in Excel" in flex table with id "----announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @511594-D @517082-D @NYSED-2117 @NYSED-2114 @Sprint-07 @US-508916 @US-514567 @516276-D @516289-D @516279-D @NYSEDSprint-23 @US-NYSED-1849 @M04 @M04Announcement
  Scenario Outline: Verify that the Only FD profile users see the 'OSC Approved?' field is added on the 'Update Details' modal and is editable, and when the modal is closed, the updated value should populate on the Announcement Specific Settings section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
     #516289-D
    And I navigate to "Financials" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #NYSED-2114
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-D
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    #516279-D
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    #517082-D
    Then I softly cannot see top right button "Update Details" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #516279-D
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #NYSED-2114
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "12" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+12}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Given I navigate to "Overview" sub tab
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #NYSED-2117 #NYSED-2114
    Then I softly cannot see the following messages in the page details contains:
      | The announcement cannot be published because OSC approval is not received. Please contact the FD user to update the 'OSC Approved?' value using the Update Details button. |
    #516279-D
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #NYSED-2114
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "3" into field "Bud_Stop__c"
    When I enter in modal value "6" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+3}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+6}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Given I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Under Revision"
    #516279-D
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
     #516289-D
    And I navigate to "Financials" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #NYSED-2114
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-D
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "4" into field "Bud_Stop__c"
    When I enter in modal value "5" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-D
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+4}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+5}"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @519311 @Sprint-08 @US-518025 @M04Announcement
  Scenario Outline: Verify that 'hyphen' (-) is added in the Fund Year column in Formula Announcement list views (All, Draft, Published, Rejected, Closed and Archived, My Records)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:annoucementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:annoucementTableId---" :
      | Fund Year |
      | 1990-30   |
    And I click toggle button to select "Directed Announcements - Created"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:annoucementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:annoucementTableId---" :
      | Fund Year |
      | 1990-30   |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "AEGMSID" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I click toggle button to select "Directed Announcements - Published"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:annoucementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:annoucementTableId---" :
      | Fund Year |
      | 1990-00   |
    And I click toggle button to select "Directed Announcements - Closed and Archived"
    When I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:annoucementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:annoucementTableId---" :
      | Fund Year |
      | 1990-90   |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @508077 @508070 @Sprint-08 @US-513690 @M04Announcement
  Scenario Outline: Verify that the Internal user (Peer Reviewer) with Edit access NO does not sees the following section-level actions in the Applicants section a. Upload Excel b. Delete Selected and Add Organizations button.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"

    Examples:
      | UserType | Reviewer                 | ReviewerUser | NonOwner |
      | PM       | {SavedValue:PO Username} | PO           | EXE      |
#      | PO       | {SavedValue:PM Username} |  PM         | FO      |
#      | FD      | {SavedValue:PO Username} |  PO         | PM      |
#      | FO       | {SavedValue:EXE Username}|  EXE        | PO      |

  @521173 @Sprint-09 @518586 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see that the existing Year field, which was required for Submit, is now required for Save on the Directed Announcement layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I enter value "--None--" into field "NYSED_Year__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required in the Overview tab under the Information section. |
    And I enter value "1995" into field "NYSED_Year__c"
    And I click on "Save" in the page details
    Then I softly see field "Year" as "1995"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "---announcement:-:JustificationforDeficitAmount---"
    When I navigate to "Overview" sub tab
    And I enter value "Yes" into field "Soft_Application_Due_Date__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
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
    Then I softly see field "Status" as "Submitted for Approval"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD        |

  @514123 @Sprint-07 @US-509836 @M04Announcement
  Scenario Outline:Verify that user should see data type of all currency fields at announcement layout->Financials tab, is changes to accept whole numbers only - Directed Announcement FS-10 Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "FS-10"
    And I enter value "20.99" into field "AwardFloor__c"
    And I enter value "2000.99" into field "AwardCeiling__c"
    And I enter value "1000.78" into field "TotalCommittedAmount__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    Then I softly see field "Subaward Floor" as "$2,099"
    Then I softly see field "Subaward Ceiling" as "$200,099"
    Then I softly see field "Estimated Total Funding" as "$100,078"
    Then I softly see field "Deficit Amount" as "$100,078"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:InternalFundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:ExternalFundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                     | Pre-Encumbrance |
      | {SavedValue:InternalFundingAccount} | 100.99          |
    Then I softly see value "$10,099" for title "Pre-Encumbrance" against the value "---AUTOEnvData:-:InternalFundingAccount---" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                     | Pre-Encumbrance |
      | {SavedValue:ExternalFundingAccount} | 100.99          |
    Then I softly see value "$10,099" for title "Pre-Encumbrance" against the value "---AUTOEnvData:-:ExternalFundingAccount---" inside table "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | 100.99                         |
      | Support Staff Salaries      | Yes                                  | 100.99                         |
      | Purchased Services          | Yes                                  | 100.99                         |
      | Supplies and Materials      | Yes                                  | 100.99                         |
      | Travel Expenses             | Yes                                  | 100.99                         |
      | Employee Benefits           | Yes                                  | 100.99                         |
      | BOCES Purchased Services    | Yes                                  | 100.99                         |
      | Minor Remodeling            | Yes                                  | 100.99                         |
      | Equipment                   | Yes                                  | 100.99                         |
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Professional Staff Salaries" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Support Staff Salaries" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Purchased Services" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Supplies and Materials" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Travel Expenses" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Employee Benefits" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "BOCES Purchased Services" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Minor Remodeling" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "$10,099" for title "Line Item Level, If Applicable" against the value "Equipment" inside table "---announcement:-:announcementBudgetCategory---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @510581 @Sprint-07 @US-509836 @M04Announcement
  Scenario Outline:Verify that user should see data type of all currency fields at announcement layout->Financials tab, is changes to accept whole numbers only - Directed Announcement Lump Sum Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I enter value "Lump Sum" into field "Budget_Category_Package__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    And I enter value "20.99" into field "AwardFloor__c"
    And I enter value "2000.99" into field "AwardCeiling__c"
    And I enter value "1000.78" into field "TotalCommittedAmount__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    Then I softly see field "Subaward Floor" as "$2,099"
    Then I softly see field "Subaward Ceiling" as "$200,099"
    Then I softly see field "Estimated Total Funding" as "$100,078"
    Then I softly see field "Deficit Amount" as "$100,078"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:InternalFundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:ExternalFundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                     | Pre-Encumbrance |
      | {SavedValue:InternalFundingAccount} | 100.99          |
    Then I softly see value "$10,099" for title "Pre-Encumbrance" against the value "---AUTOEnvData:-:InternalFundingAccount---" inside table "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                     | Pre-Encumbrance |
      | {SavedValue:ExternalFundingAccount} | 100.99          |
    Then I softly see value "$10,099" for title "Pre-Encumbrance" against the value "---AUTOEnvData:-:ExternalFundingAccount---" inside table "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @517247-D @517249-D @Sprint-08 @US-514910 @M05
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Create Application' button at the qualified opportunity layout, and the user can create the Application.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    #517247-D #517249-D
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | UserType   |
      | GRANTEE_CE |
      | GRANTEE_SC |

  @517250-D @517251-D @517252-D @Sprint-08 @US-514910 @M05
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Create Application' button at the qualified opportunity layout, and the user can create the Application.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    Then I softly can see top right dropdown button "Create Application" in page detail
    When I re-login to "Grants Portal" app as "<OtherUser>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    Then I softly cannot see top right dropdown button "Create Application" in page detail
    Examples:
      | UserType   | OtherUser   |
      | GRANTEE_SC | GRANTEE_LEA |
      | GRANTEE_SC | GRANTEE_VO  |
      | GRANTEE_SC | GRANTEE_NU  |

  @517207-D @517214-D @Sprint-08 @US-514909 @M05
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Qualify' button at the publish opportunity page, and the user can qualify the opportunity.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly can see top right button "Qualify" in page detail
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Qualified"
    Examples:
      | UserType   |
      | GRANTEE_SC |
      | GRANTEE_CE |

  @517225-D @517229-D @517230-D @Sprint-08 @US-514909 @M05
  Scenario Outline:Verify that the LEA Admin Role user cannot see the 'Qualify' button at the publish opportunity page.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly cannot see top right button "Qualify" in page detail
    Examples:
      | UserType    |
      | GRANTEE_LEA |
      | GRANTEE_VO  |
      | GRANTEE_NU  |

  @518800 @Sprint-08 @US-506811 @M05
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' as a picklist field with Yes/No dropdown options is added at the create announcement modal->Information Section: Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    When I hovering mouse on help text icon inside modal "Is Announcement for Direct Grant?"
    Then I softly see "This field indicates whether or not this announcement will be used for direct grants." shown as help text
    #518800
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @518805 @518808 @518814 @522708 @518837 @518839 @518855 @518851 @518858 @518867 @518875 @518955 @518960 @518961 @NYSED-1205 @Sprint-08 @US-506811 @NYSEDSprint-24 @US-NYSED-1142 @M04 @M05
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' field is required field at the create announcement modal->Information Section: Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required. |
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required in the Information section. |
    #518808
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Is Announcement for Direct Grant?" added after "Link For Additional Information"
    Then I softly see field "Is Announcement for Direct Grant?" is not editable
    Then I softly see field "Is Announcement for Direct Grant?" as "Yes"
    #518814
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts section" page block displayed
    Then I softly do not see "Q & A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block
    #518867
    Then I softly see field "Grant Abbreviation" added after "First Payment %"
    #522708
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?" inside page block
    #NYSED-1205
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "Yes"
    And I click on "Edit" in the page details
    And I pause execution for "2" seconds
    Then I softly see asterisk mark on "Is Detailed Budget Required on the Subaward?"
    Then I see only the following ordered options in dropdown field "NYSED_DetailedBudOnAward__c" :
      | --None-- | Yes | No |
    And I enter value "--None--" into field "NYSED_DetailedBudOnAward__c"
    And I click on "Save" in the page details
    #NYSED-1142
    Then I softly see the following messages in the page details contains:
      | To Save, Is Detailed Budget Required on the Subaward? is required in the Financials tab under the Budget Specific Settings section. |
    And I enter value "No" into field "NYSED_DetailedBudOnAward__c"
    And I click on "Save" in the page details
    #NYSED-1205
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "No"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I wait for "3" seconds
    #518855
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    #518839
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    #518960
    Then I softly verify that the file "Applicants.xlsx" is downloaded
    #518961
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    #518851
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I click modal button "Close"
    #518955
    And I wait for "2" seconds
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I see only the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Grant EGMS ID | Last Updated By | Last Updated |
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Institution ID | SED Code | Applicants                   |
      | 166485411256   | CACP12   | {SavedValue:SubrecipientOrg} |
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I enter value "No" into field "NYSED_FARequiredForAmendment__c"
    And I enter value "10" into field "First_Payment__c"
    And I enter value "Justified" into field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    #518837
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section. |
    #518855
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role.         |
      | Overview Tab - At least one contact should have the 'Program Contact' Role.        |
     #518858
      | Overview Tab - Provide the Application Due Date.                                   |
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    And I "Approve" in the approval decision
    #518875
    Then I softly cannot see top right dropdown button "Publish" in page detail
    Then I softly cannot see top right dropdown button "Revise" in page detail
    Then I softly cannot see top right dropdown button "Extend Dates" in page detail

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @518964 @518970 @518973 @518974 @518976 @518977 @518980 @518982 @518984 @Sprint-08 @US-506811 @M05 @sanitysuite
  Scenario Outline: Verify that user can add rows or update existing rows in Excel, and upload the updated data in the Excel to the Applicants section. If the upload is successful, I see that the Applicants section refreshes and shows updated - Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
      #518964
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I softly verify that the file "Applicants.xlsx" is downloaded
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    And I Update "166987654255" value in "3" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I wait for "5" seconds
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Institution ID |
      | 166485411256   |
    #518970
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "InstitutionID" value in "1" row and "1" column in "Applicants.xlsx"
    And I Update "SEDCode" value in "1" row and "2" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    When I click modal button "Close"
    #518973
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                      |
      | Row #3 - Duplicate entry found for Institution ID (166485411255). The Institution ID must be unique for each row. |
    When I click modal button "Close"
    #518974
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "" value in "3" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
      | Row #3 - The Institution ID is missing.      |
    When I click modal button "Close"
     #518975
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "1234567891231" value in "3" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    #518976
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "1234567891231" value in "3" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    #518977
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "" value in "2" row and "2" column in "Applicants.xlsx"
    And I Update "" value in "3" row and "2" column in "Applicants.xlsx"
    And I Update "" value in "2" row and "3" column in "Applicants.xlsx"
    And I Update "" value in "3" row and "3" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #518980
    And I delete the excel file "Applicants.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants.xlsx"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientHealthOrg}" in file "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #518982
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
    #518984
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @518873 @Sprint-08 @US-506811 @M05
  Scenario Outline: Verify that the Announcement Owner cannot see 'Grant Abbreviation' field is added after 'First Payment %' on announcement layout in Overview->Announcement Specific Settings when option for 'Is Announcement for Direct Grant?' is selected as 'No'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Grant Abbreviation" inside page block
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @535951 @Sprint-13 @US-533103 @M04Announcement
  Scenario Outline:Verify that the internal user sees that on the Announcement layout -> Overview tab -> Announcement Specific Settings section, a new required field 'Fiscal Approval Required for Amendment?' is added.: Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Given I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see field "Fiscal Approval Required for Amendment?" inside page block
    Then I softly see fields "NYSED_FARequiredForAmendment__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSED_FARequiredForAmendment__c" :
      | --None-- | Yes | No |
    When I enter value "--None--" into field "NYSED_FARequiredForAmendment__c"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - 'Fiscal Approval Required for Amendment?' is required to submit for approval. |
    Given I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter value "Yes" into field "NYSED_FARequiredForAmendment__c"
    When I click on "Save" in the page details
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
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - 'Fiscal Approval Required for Amendment?' is required to submit for approval. |
    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @535886 @Sprint-13 @US-533069 @M04Announcement
  Scenario Outline:Verify that the Internal User see that Focus Area Required? and Allocation Level editable fields, on the extended create announcement modal, if the budget type is selected as 'Lump Sum': Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    Then I see only the following ordered options in dropdown field "Budget_Category_Package__c" :
      | --None-- | FS-10 | Lump Sum |
    Then I softly see asterisk mark on "Focus Areas Required?"
    Then I softly see asterisk mark on "Allocation Level"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "--None--" into field "FocusAreaRequired__c"
    When I enter in modal value "--None--" into field "Allocationlevel__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Focus Areas Required? is required in the Announcement Specific Settings section. |
      | To Save, Allocation Level is required in the Announcement Specific Settings section.      |
    When I enter in modal value "No" into field "FocusAreaRequired__c"
    When I enter in modal value "By Applicant and Focus Area" into field "Allocationlevel__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Competitive or Directed Announcement Types must have the Allocation Level "N/A". |
    When I enter in modal value "N/A" into field "Allocationlevel__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly do not see "Focus Areas Required?" page block displayed
    Then I softly do not see "Allocation Level" page block displayed
    Examples:
      | UserType |
      | PM       |
#    | PO      |
#    | FO      |
#    | FD      |

  @535893 @535906 @NYSED-1176 @Sprint-13 @US-533069 @M04Announcement @US-NYSED-928 @M05
  Scenario Outline: Verify that the internal user sees that the 'Budgeting is Required for:' field is editable and OOTB drop down values are available for selection on Announcement Layout->Financials Tab->Budget Specific settings, if the budget type is selected as 'Lump Sum'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I enter value "Lump Sum" into field "Budget_Category_Package__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    #NYSED-1176
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    When I hovering mouse on page block help text icon inside table "---announcement:-:fundingAccountsTableId---" for LWC
    Then I softly see the text containing :
      | This is the current balance of Pre - encumbrance after subtracting Outstanding Encumbrance Balance |
    Then I softly see field "Budget Type" as "Lump Sum"
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    Then I softly see field "Is a Detailed Budget Required on the Application?" as "No"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I see only the following ordered options in dropdown field "BudgetingPeriod__c" :
      | --None-- | All Budget Periods | Only First Budget Period |
    And I enter value "All Budget Periods" into field "BudgetingPeriod__c"
    When I click on "Save" in the page details
    Then I softly see field "Budgeting is Required for:" as "All Budget Periods"
    #535906
    And I navigate to "Financials" sub tab
    Then I softly can see top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see that "BP01" has been added in flextable with Id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I save the value from row "1" for column name "Start Date" as "StartDate" from flex table "---announcement:-:budgetPeriodTableId---"
    And I save the value from row "1" for column name "End Date" as "EndDate" from flex table "---announcement:-:budgetPeriodTableId---"
    Then I softly see value "{SavedValue:StartDate}" for title "Start Date" against the value "BP01" inside table "---announcement:-:budgetPeriodTableId---"
    Then I softly see value "{SavedValue:EndDate}" for title "End Date" against the value "BP01" inside table "---announcement:-:budgetPeriodTableId---"
    When I click on "Remove" icon for "BP01" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:budgetPeriodTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @541008 @NYSEDSprint-16 @US-540520 @M04
  Scenario Outline:Verify that an organization without an institution ID is not shown on the Add Organizations modal, and after the system admin adds an institution ID, it becomes visible.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    #541008
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:directedAddInviteApplicantTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I navigate to "Overview" sub tab
    And I pause execution for "2" seconds
    And I click on "Edit" in the page details
    And I pause execution for "2" seconds
    And I enter value "166485411254" into field "INST_ID__c"
    And I pause execution for "2" seconds
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Institution ID" as "166485411254"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I pause execution for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    #541008
    Then I softly see value "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" for title "Applicants" against the value "CACP139" inside table "---announcement:-:directedInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | PM       |

  @NYSED-2175 @NYSED-2183 @NYSEDSprint-23 @US-NYSED-2087 @US-NYSED-2088 @M04
  Scenario Outline:Verify with the Program owner that any status of application can be seen in the Related Applications section for directed announcements.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "ApplicationmEGMSID"
    When I re-login to "As a Grantor" app as "<AnnouncementOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:AutomationPermanentStaticRecord}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStaticRecord}" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---program:-:RelatedApplicationsTableId---" panel
    #NYSED-2175
    Then I softly see value "Created" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2183
    Then I softly see value "Created" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ApplicationmEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 12             | 12  | 100                    | 100                                                | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<AnnouncementOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:AutomationPermanentStaticRecord}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStaticRecord}" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---program:-:RelatedApplicationsTableId---" panel
    #NYSED-2175
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2183
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:AutomationPermanentStaticRecord}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStaticRecord}" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---program:-:RelatedApplicationsTableId---" panel
    #NYSED-2175
    Then I softly see value "Review Initiated" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2183
    Then I softly see value "Review Initiated" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"

    Examples:
      | UserType   | Announcement Name                                        | AnnouncementOwner |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PM                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FD                |

  @NYSED-1104-approved @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that when Send Back is selected then again record get in created state and able to updated data in the contact section For Competitive announcement.    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly cannot see row level action button "Edit" against "Fiscal Contact" in flex table with id "---announcement:-:contactTableId---"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |

  @NYSED-1104-rejected @519311 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that when Send Back is selected then again record get in created state and able to updated data in the contact section For Competitive announcement.    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Setup" sub tab
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly cannot see row level action button "Edit" against "Fiscal Contact" in flex table with id "---announcement:-:contactTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Rejected"
    When I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    #519311
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:annoucementTableId---" :
      | Fund Year |
      | 1990-30   |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |

  @NYSED-1103 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with Announcement Owner that if the 'Key Contact' check box is not selected or seelcted more than one contact for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for Directed announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    And I wait for "5" seconds
    #@NYSED-1103
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Project Role   | Is Key Contact |
      | Automation EXE | unchecked      |
      | Automation PM  | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    #@NYSED-1103
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "{SavedValue:PO Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PO Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PO | Program Contact |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
   #@NYSED-1103
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | Unchecked      |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | checked        |
      | Automation PM  | checked        |
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I navigate to "Setup" sub tab
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
    And I refresh the page
    Then I softly see field "Status" as "Submitted for Approval"

    Examples:
      | UserType |
      | PM       |

  @NYSED-11028 @NYSED-Sprint-37 @US-NYSED-10667 @M04
  Scenario Outline:Verify that the Internal User see that at Announcement layout Overview tab->Applicants section is moved to Financials tab after Funding Accounts section. - Directed type: Standard Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly do not see "Applicants" page block displayed
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    #NYSED-11028
    Then I see only the following ordered page blocks :
      | Financial Details        |
      | Funding Accounts         |
      | Applicants               |
      | Budget Specific Settings |
      | Budget Period Details    |
      | Budget Categories        |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financials Tab - You must invite at least one applicant before submitting this Announcement. |

    Examples:
      | UserType |
      | PO       |
#      | PM      |
#      | FO      |
#      | FD      |
