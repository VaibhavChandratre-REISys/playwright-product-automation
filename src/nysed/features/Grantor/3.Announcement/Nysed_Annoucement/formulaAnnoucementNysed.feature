@formulaAnnouncementsNysed @announcementExecution @announcementUAT
Feature: Validate all scenarios in the formula Announcement tab

  @489011 @Sprint-00 @US-487276 @M04Announcement
  Scenario Outline: Verify that the Internal User does not see the question "Leverage Allowed?" on the create announcement modal.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "4" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO      |

  @492303 @534228 @Sprint-01 @US-487309 @M04Announcement
  Scenario Outline: Verify that the Internal User can see 'Cert Level' and 'Available balance' columns(after the Funding Account column)  on the Funding Accounts section of the Financials Tab on the announcement - Formula
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #534228
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I click on "Update Details" in the page details
    When I enter in modal value "0" into field "Bud_Stop__c"
    When I enter in modal value "11" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
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
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    And I "Send to Owner" in the approval decision
    Then I see field "Status" as "Draft"
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    And I wait for "100" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    #534228
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
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
#      | FO      | {SavedValue:FO Username} |

  @492318 @Sprint-01 @US-487309 @M04Announcement
  Scenario Outline: Verify that the Internal User can see 'Cert Level' and 'Available balance' columns are available with totals, read-only and values should show up from the related funding accounts. - Formula
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount1}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount1}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I click modal button "Close"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "11" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    Then I softly see field "Status" as "Created"
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Cert Level" as "AppropriationAmount1"
    And I save the field labeled "Available Balance" as "AvailableBalance1"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    And I save the field labeled "Cert Level" as "AppropriationAmount2"
    And I save the field labeled "Available Balance" as "AvailableBalance2"
    And I click on back arrow
    And I refresh the page
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
    When I navigate to "Financials" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
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
    And I wait for "100" seconds
    And I click on "Submit For Approval" in the page details
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
#      | FO      | {SavedValue:FO Username} |

  @495633 @495639 @495677 @Sprint-03 @US-490908 @sanitysuit @M04Announcement
  Scenario Outline: Verify that Internal user can see new  required field  'Indirect Rate Type' is add on Announcement layout->Financials (tab)->Financial Details (section)	 with dropdown options - Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition2" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    Then I softly see field "Indirect Rate Type" inside page block
    Then I see only the following ordered options in dropdown field "Indirect_Rate_Type__c" :
      | --None-- | Restricted | Unrestricted | Not Allowed |
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
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Financials Tab - Indirect Rate Type is required to submit for approval. |
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
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
    #@495639
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
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
     #495677
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    Then I softly do not see "Maximum Indirect Rate %" page block displayed
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      |FO      |
#      | PO       |
#  |FD        |

  @495690 @495672 @Sprint-03 @US-490908 @M04Announcement
  Scenario Outline:Verify that Internal user should not see validation if user not enter value in field  'Maximum Indirect Rate %' for the optional type 'Restricted'  - Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    #@495690
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    #495672
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Unrestricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
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
    When I navigate to "Financials" sub tab
    #495690
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
      #495672
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Unrestricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    When I navigate to "Financials" sub tab
    #495690
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    #495672
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
#      | FO      | {SavedValue:FO Username} |
#      | PO       | {SavedValue:PO Username}  |

  @496018 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type" on Opportunity layout (Publish and Qualify)- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside table
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @496073 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (publish & qualify), when indirect rate is 'Unrestricted'- Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
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
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
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

  @496074 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Restricted'- Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
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
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
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

  @496075 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Fixed'- Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I click on "Update Details" in the page details
    When I enter in modal value "4" into field "Bud_Stop__c"
    When I enter in modal value "5" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
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
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
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

  @496076 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Fixed'- Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
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
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
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

  @496085 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type" and 'Maximum Indirect Rate%' on Opportunity layout which is converted to application- Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I click on "Update Details" in the page details
    When I enter in modal value "4" into field "Bud_Stop__c"
    When I enter in modal value "5" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
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
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
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
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement Application"
    And I wait for "5" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "<IndirectType>"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "50.00%"

    Examples:
      | UserType   | IndirectType |
      | GRANTEE_SC | Restricted   |
#      | GRANTEE_SC | Unrestricted |
#      | GRANTEE_SC | Unrestricted |
#

  @496096 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type- Not Allowed" on Opportunity layout which is converted to application- Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
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
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
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
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement Application"
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
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

  @504919-F @Sprint-05 @US-500360 @M04Announcement
  Scenario Outline: Verify that an announcement owner see validation message when clicked on 'Submit for Approval' and any funding account is not associated on Formula/Directed/Competitive announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
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
#      | FD      |

  @503361 @Sprint-05 @US-499231 @bugId_508787 @sanitysuite @M04Announcement
  Scenario Outline: Verify that user should see below fields are removed from announcement layout- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
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
#      | FO      |

  @506057 @Sprint-06 @US-494448 @M04Announcement
  Scenario Outline: Verify that Internal user see that fields are defaulted to 'No' and are hidden on the extended create announcement (competitive) modal and Announcement Layout->Overview Tab->Announcement Specific settings when the budget type is selected as 'Lump Sum'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
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

  @505707 @Sprint-06 @US-501279 @M04Announcement
    @NYSED-10276 @NYSED-Sprint-36 @US-NYSED-9919 @M06
  Scenario Outline: Verify that Fund Year field is added at the formula announcement list view, next to Announcement Name Column.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Formula Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Formula Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Formula Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I click toggle button to select "Formula Announcements - All"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @505668-F @505652-F @Sprint-06 @Sprint-06 @US-501279 @M04Announcement @sanitysuite
  Scenario Outline:Verify that Internal user should not see validation if user not enter value in field  'Maximum Indirect Rate %' for the optional type 'Restricted'  - Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
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
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "{SavedValue:SubrecipientOrg}" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
        #505652
    When I click on "Edit" in the page details
    Given I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter value "--None--" into field "NYSED_Year__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required in the Overview tab under the Information section. |
    And I enter value "2030" into field "NYSED_Year__c"
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
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
    And I wait for "2" seconds
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

  @506507 @Sprint-06 @US-504645 @M04Announcement
  Scenario Outline: Verify that the PM/PO/FD/FO profile users only can see the 'New' button on the Announcement phase->Formula announcement list view.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    Then I softly can see top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @506604 @506532-F @506879-F @506542-F @506644 @507009 @507010 @507029 @507040 @507052 @508807 @Sprint-06 @US-504645 @M04Announcement
  Scenario Outline:Verify that Internal user should not see validation if user not enter value in field  'Maximum Indirect Rate %' for the optional type 'Restricted'  - Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    #506532-F
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
    #507009
    Then I softly cannot see top right button "Update Details" in page detail
    When I navigate to "Overview" sub tab
    #506644
    Then I softly see field "Bud Stop" inside page block
    Then I softly see field "Pay Stop" inside page block
    Then I softly see field "Bud Stop" is not editable
    Then I softly see field "Pay Stop" is not editable
    When I hovering mouse on help text icon inside page block detail "Bud Stop"
    Then I softly see "Allows the suppression of grant award letters." shown as help text
    When I hovering mouse on help text icon inside page block detail "Pay Stop"
    Then I softly see "Allows complete project fund year payments to be stopped without impeding usage of main appropriation." shown as help text
    And I enter value "10" into field "GranteeMatch__c"
    Then I softly see fields "Soft_Application_Due_Date__c" is in edit mode
    When I enter value "Yes" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Is Application Deadline Soft?" as "Yes"
    Then I softly see field "Subrecipient Match (%)" as "10.00%"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #507010
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #507040
    Then I softly see field "Bud Stop" inside page block
    Then I softly see field "Pay Stop" inside page block
    Then I softly see fields "Bud_Stop__c" is in edit mode
    Then I softly see fields "Pay_Stop__c" is in edit mode
    When I hovering mouse on help text icon inside modal "Bud Stop"
    Then I softly see "Allows the suppression of grant award letters." shown as help text
    When I hovering mouse on help text icon inside modal "Pay Stop"
    Then I softly see "Allows complete project fund year payments to be stopped without impeding usage of main appropriation." shown as help text
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    When I click modal button "Edit"
    When I clear in modal the value from field "Bud_Stop__c"
    When I clear in modal the value from field "Pay_Stop__c"
    When I enter in modal value "2" into field "Bud_Stop__c"
    When I enter in modal value "25" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+2}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+25}"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #507052
    When I navigate to "Overview" sub tab
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+2}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+25}"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "{SavedValue:SubrecipientOrg}" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #bug-id-517062
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #507010
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #507040
    Then I softly see field "Bud Stop" inside page block
    Then I softly see field "Pay Stop" inside page block
    Then I softly see fields "Bud_Stop__c" is in edit mode
    Then I softly see fields "Pay_Stop__c" is in edit mode
    When I hovering mouse on help text icon inside modal "Bud Stop"
    Then I softly see "Allows the suppression of grant award letters." shown as help text
    When I hovering mouse on help text icon inside modal "Pay Stop"
    Then I softly see "Allows complete project fund year payments to be stopped without impeding usage of main appropriation." shown as help text
    And I wait for "2" seconds
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    When I click modal button "Edit"
    And I wait for "2" seconds
    When I enter in modal value "2" into field "Bud_Stop__c"
    When I enter in modal value "25" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+2}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+25}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #507010
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #507040
    Then I softly see field "Bud Stop" inside page block
    Then I softly see field "Pay Stop" inside page block
    Then I softly see fields "Bud_Stop__c" is in edit mode
    Then I softly see fields "Pay_Stop__c" is in edit mode
    When I hovering mouse on help text icon inside modal "Bud Stop"
    Then I softly see "Allows the suppression of grant award letters." shown as help text
    When I hovering mouse on help text icon inside modal "Pay Stop"
    Then I softly see "Allows complete project fund year payments to be stopped without impeding usage of main appropriation." shown as help text
    And I wait for "2" seconds
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    When I click modal button "Edit"
    And I wait for "2" seconds
    When I enter in modal value "2" into field "Bud_Stop__c"
    When I enter in modal value "25" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+2}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+25}"
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
    #507009
    Then I softly cannot see top right button "Update Details" in page detail
      #507052
    When I navigate to "Overview" sub tab
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+2}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+25}"
    #506644
    Then I softly see field "Bud Stop" inside page block
    Then I softly see field "Pay Stop" inside page block
    Then I softly see field "Bud Stop" is not editable
    Then I softly see field "Pay Stop" is not editable
    When I hovering mouse on help text icon inside page block detail "Bud Stop"
    Then I softly see "Allows the suppression of grant award letters." shown as help text
    When I hovering mouse on help text icon inside page block detail "Pay Stop"
    Then I softly see "Allows complete project fund year payments to be stopped without impeding usage of main appropriation." shown as help text
    And I enter value "13" into field "GranteeMatch__c"
    Then I softly see fields "Soft_Application_Due_Date__c" is in edit mode
    When I enter value "Yes" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I wait for "2" seconds
    Then I softly see field "Subrecipient Match (%)" as "13.00%"
    #506532
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #508807
    When I click on "Update Details" in the page details
    When I clear in modal the value from field "Bud_Stop__c"
    When I clear in modal the value from field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "No" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |
#      | PO       | {SavedValue:PO Username}  | PM       | FO            | {SavedValue:FO Username}  |
#      | FO       | {SavedValue:FO Username}  | FD       | FD            | {SavedValue:FD Username}  |
#      | FD       | {SavedValue:FD Username}  | ADMIN    | EXE           | {SavedValue:FD Username}  |
#      | EXE      | {SavedValue:EXE Username} | FO       | PM            | {SavedValue:PM Username}  |

  @506608-F @506613-F @Sprint-06 @US-503093 @M04Announcement @Bug-Ticket-539331
  Scenario Outline:Verify that Internal user should not see validation if user not enter value in field  'Maximum Indirect Rate %' for the optional type 'Restricted'  - Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    #@506613-F
    And I navigate to "Announcements" tab
    And I wait for "5" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    And I wait for "3" seconds
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | You don`t have sufficient access to edit this record |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
     #506608-F
    And I navigate to "Announcements" tab
    And I wait for "5" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "{SavedValue:SubrecipientOrg}" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
     #506608-F
    And I navigate to "Announcements" tab
    And I wait for "5" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    #@506613-F
    And I navigate to "Announcements" tab
    And I wait for "5" seconds
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

  @NYSED-2039-F @506541-F @507008 @NYSED-2042-F @NYSED-2040-F @Sprint-06 @US-503093 @US-504645 @NYSEDSprint-24 @US-NYSED-1804 @M04Announcement
  Scenario Outline:Verify that the peer reviewer can see the updated 'Eligible Applicant Types' list at Announcement layout->Overview tab->Eligibility Details section when Allow Record Editing is Yes
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
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
    And I wait for "2" seconds
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
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
#      | PM       | PO           | {SavedValue:PO Username} | FO           | {SavedValue:FO Username} |
#      | PO       | FO           | {SavedValue:FO Username} | PO           | {SavedValue:PO Username} |
      | FO       | FD           | {SavedValue:FD Username} | FO            | {SavedValue:FO Username} |
#      | FD       | EXE          | {SavedValue:FD Username} | FO           | {SavedValue:FO Username} |

  @507500 @507517 @509330 @507525 @507536 @507545 @507563 @Sprint-06 @US-503600 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see the 'Add Organization' button in the Applicants and Allocations section, as the button is unhidden.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #507517
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see only the following headers in table with id "---announcement:-:formulaAddInviteApplicantTableId---" :
      |  | Institution ID | SED Code | Organization | Organization Type |
    #509330
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I click modal button "Close"
    When I click on "Edit" in the page details
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Selected Applicants are associated successfully |
    When I click modal button "Close"
    #507525
    Then I see only the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      |  |  | Actions | Institution ID | SED Code | Applicants |
    #507536
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "5" seconds
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientHealthOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientSchoolOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see field "Institution ID" is not editable
    Then I softly see field "SED Code" is not editable
    Then I softly see field "Applicants" is not editable
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    #507545
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver |
      | N/A    |
    When I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see fields "NYSED_Waiver__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSED_Waiver__c" :
      | --None-- | Yes | No | N/A |
    And I wait for "2" seconds
    And I select dropdown value "No" in field "NYSED_Waiver__c"
    And I click on top right button "Save" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver |
      | No     |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver |
      | N/A    |
    When I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see fields "NYSED_Waiver__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSED_Waiver__c" :
      | --None-- | Yes | No | N/A |
    And I click on top right button "Save" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver |
      | N/A    |
    When I collapse nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
      #507563
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 10.99             |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $1,099            |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | -44               |
    Then I softly see the following messages in the page details contains:
      | Allocation Amount can not be less than zero. |
    When I click on "Undo" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | #$^&              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
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
    When I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @513755 @513765 @507769 @507772 @507775 @Sprint-06 @US-503600 @M04Announcement
  Scenario Outline:Verify that the announcement owner sees an error message if enter the data in Excel in the incorrect format. The error message should refer to row# in Excel which has errors.: Reallocation Amount
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations.xlsx" into library
    And I click modal button "Close"
    #507772
    And I wait for "2" seconds
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I softly verify that the file "Applicants and Allocations.xlsx" is downloaded
    #507775
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "3" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    #@513755
    And I Update "$@!&" value in "2" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "7" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                         |
      | Row #2 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
      | Row #3 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
      | Row #3 - Reallocation amount cannot be more than Allocation Amount.                                  |
      | Row #4 - Reallocation amount cannot be more than Allocation Amount.                                  |
    And I click modal button "Close"
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "$@!&" value in "4" row and "7" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                         |
      | Row #2 - Reallocation amount cannot be more than Allocation Amount.                                  |
      | Row #3 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
      | Row #3 - Reallocation amount cannot be more than Allocation Amount.                                  |
      | Row #4 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
    And I click modal button "Close"
    And I Update "1500" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1500" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1500" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "-1245" value in "3" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "-1245" value in "4" row and "7" column in "Applicants and Allocations.xlsx"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #513765
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                                                                                           |
      | Row #3 - Duplicate entry found for combination of Institution ID (166485411255) and Focus Area (Automation Permanent Focus Area). Focus Area cannot be repeated for an Institution ID  |
      | Row #4 - Duplicate entry found for combination of Institution ID (166485411255) and Focus Area (Automation Permanent Focus Area). Focus Area cannot be repeated for an Institution ID. |
    And I click modal button "Close"
    #507769
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
      | N/A    | $1,500            | $1,000       | $2,500          |
    When I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see field "Total Available" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount | Reallocation |
      | Automation Permanent Focus Area | 1000              | 1000         |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
      | N/A    | $1,000            | $1,000       | $2,000          |

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @507575 @508011 @Sprint-06 @US-503600 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see the Reallocation field is added at the announcement layout->Overview tab ->child Focus Area table of Applicants and Allocations section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $0           |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $0           |
    When I collapse nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $0           |
    When I collapse nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Reallocation | Allocation Amount |
      | Automation Permanent Focus Area | 10.99        | 1500              |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $1,099       |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Reallocation | Allocation Amount |
      | Automation Permanent Focus Area | -44          |                   |
    Then I softly see the following messages in the page details contains:
      | Reallocation amount cannot be more than Allocation Amount. |
    When I click on "Undo" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Reallocation | Allocation Amount |
      | Automation Permanent Focus Area | -44          | 1500              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | ($44)        |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Reallocation |
      | Automation Permanent Focus Area | #$^&         |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $0           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Reallocation |
      | Automation Permanent Focus Area | 1600         |
    Then I softly see the following messages in the page details contains:
      | Reallocation amount cannot be more than Allocation Amount. |
    When I click on "Undo" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Reallocation | Allocation Amount |
      | Automation Permanent Focus Area |              |                   |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
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
    When I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $0           |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $0           |
    When I collapse nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Reallocation |
      | $0           |
    When I collapse nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @507778 @507782 @507779 @507784 @507791 @507807 @507809 @507825 @507829 @507834 @507843 @507941 @Sprint-06 @US-503600 @M04Announcement
  Scenario Outline:Verify that the announcement owner sees an error message if enter the data in Excel in the incorrect format. The error message should refer to row# in Excel which has errors.: Reallocation Amount
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    ##507843
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      | Applicants                   |
      | {SavedValue:SubrecipientOrg} |
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |
    And I wait for "3" seconds
  #507778
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
      | N/A    | $0                | $0           | $0              |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1500" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "7" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
      | N/A    | $1,500            | $1,000       | $2,500          |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    #507779 #507941
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations2.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,500            | $1,000       | $2,500          |
      | Total                           |        | $1,500            | $1,000       | $2,500          |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,500            | $1,000       | $2,500          |
      | Total                           |        | $1,500            | $1,000       | $2,500          |
    When I collapse nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,500            | $1,000       | $2,500          |
      | Total                           |        | $1,500            | $1,000       | $2,500          |
    When I collapse nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    #507782
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "Instiion ID" value in "1" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "SEDCode" value in "1" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "Applican" value in "1" row and "3" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    And I click modal button "Close"
    #507784
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "CACP12" value in "2" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "{SavedValue:SubrecipientOrg}" value in "2" row and "3" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "CACP12" value in "3" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "{SavedValue:SubrecipientOrg}" value in "3" row and "3" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "CACP12" value in "4" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "{SavedValue:SubrecipientOrg}" value in "4" row and "3" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                                                                                           |
      | Row #3 - Duplicate entry found for combination of Institution ID (166485411255) and Focus Area (Automation Permanent Focus Area). Focus Area cannot be repeated for an Institution ID. |
      | Row #4 - Duplicate entry found for combination of Institution ID (166485411255) and Focus Area (Automation Permanent Focus Area). Focus Area cannot be repeated for an Institution ID. |
    And I click modal button "Close"
    #507791
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
      | Row #3 - The Institution ID is missing.      |
      | Row #4 - The Institution ID is missing.      |
    And I click modal button "Close"
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Focus Area is missing.          |
      | Row #2 - The Focus Area is missing.          |
      | Row #2 - The Focus Area is missing.          |
    And I click modal button "Close"
    #507807
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "-12564" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "123456789223" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789323" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789423" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.    |
      | Row #2 - Institution ID not found: 123456789223 |
      | Row #3 - Institution ID not found: 123456789323 |
      | Row #4 - Institution ID not found: 123456789423 |
    And I click modal button "Close"
    #507809
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                     |
      | Row #2 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #3 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #4 - The Allocation Amount must be positive.                                                 |
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                     |
      | Row #3 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #4 - The Allocation Amount must be positive.                                                 |
    And I click modal button "Close"
    #507825
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "Automation Permanent Focus Area3" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area2" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area2" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                        |
      | The following rows contain Focus Areas that are not associated to the Announcement. |
      | Row #2 - Automation Permanent Focus Area3                                           |
      | Row #3 - Automation Permanent Focus Area2                                           |
      | Row #4 - Automation Permanent Focus Area2                                           |
    And I click modal button "Close"
    And I Update "Automation Permanent Focus Area" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #507829
    And I Update "" value in "2" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "$@!&" value in "3" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "2" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    Then I softly see value "CACP12" for title "SED Code" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see value "NYH12" for title "SED Code" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see value "NYS12" for title "SED Code" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #507834
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants and Allocations.xlsx"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientHealthOrg}" in file "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    Then I see the following rows under the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #508015
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientHealthOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientSchoolOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I collapse nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I collapse nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"

    Examples:
      | UserType | NonOwner |
      | PM       | PO       |
#      | PO      | PM       |
#      | FO      | FD       |
#      | FD      | FO       |

  @508017 @509231 @Sprint-06 @US-503600 @M04Announcement
  Scenario Outline:VVerify that the Peer Reviewer with Edit access YES, should see the following section-level actions and button on Applicants and Allocations table-- a. Add Organizations  b.  Upload Excel and c. Delete Selected
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    #509231
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any Applicants. |

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
      | PM       | PO           | {SavedValue:PO Username} |
#      | PO      | FO           | {SavedValue:FO Username}  |
#      | FO      | FD           | {SavedValue:FD Username}  |
#      | FD      | EXE          | {SavedValue:FD Username}  |

  @509234 @499739 @Sprint-04 @US-487902 @Sprint-06 @US-503600 @M04Announcement @M04
  Scenario Outline:Verify that the announcement owner sees an error message if upload the excel for inviting Applicant without adding the Estimated Total Funding in the Announcement. OR allocation amount is greater than the Estimated Total Funding amount.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Public School Districts" into field "EligibleApplicantTypes__c"
    When I enter value "Other" into field "EligibleApplicantTypes__c"
    When I enter value "Non-public Schools" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations2.xlsx" into library
    #509234 #499739
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                          |
      | Allocated amount for Subrecipient cannot be greater than the Estimated Total Funding. |
    And I click modal button "Close"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "1000" into field "TotalCommittedAmount__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations2.xlsx" into library
    #509234 #499739
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                          |
      | Allocated amount for Subrecipient cannot be greater than the Estimated Total Funding. |

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @505671 @505679 @505700 @505804 @505835 @505882 @505804 @Sprint-06 @US-500174 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see the EGMS ID field is removed and Institution ID Field is added and SED Code field is added after Institution ID in the 'Add Organization' modal.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    #505671
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #505679
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I see only the following headers in table with id "---announcement:-:formulaAddInviteApplicantTableId---" :
      |  | Institution ID | SED Code | Organization | Organization Type |
    When I click modal button "Close"
        #505700
    Then I see only the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Waiver | Allocation Amount | Reallocation | Total Available | Last Updated By | Last Updated |
    #509298
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I click modal button "Close"
    When I click on "Edit" in the page details
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Selected Applicants are associated successfully |
    When I click modal button "Close"
     #505804
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "5" seconds
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientHealthOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientSchoolOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see field "Institution ID" is not editable
    Then I softly see field "SED Code" is not editable
    Then I softly see field "Applicants" is not editable
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    #505835
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Waiver |
      | N/A    |
    When I click on "Edit" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see fields "NYSED_Waiver__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSED_Waiver__c" :
      | --None-- | Yes | No | N/A |
    And I wait for "2" seconds
    And I select dropdown value "No" in field "NYSED_Waiver__c"
    And I click on top right button "Save" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Waiver |
      | No     |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Waiver |
      | N/A    |
    When I click on "Edit" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see fields "NYSED_Waiver__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSED_Waiver__c" :
      | --None-- | Yes | No | N/A |
    And I click on top right button "Save" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Waiver |
      | N/A    |
    #505882
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Allocation Amount |
      | $0                |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 10.99             |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Allocation Amount |
      | $1,099            |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | -44               |
    Then I softly see the following messages in the page details contains:
      | Allocation Amount can not be less than zero. |
    When I click on "Undo" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | #$^&              |
    Then I softly see value "$0" for title "Allocation Amount" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Allocation Amount" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Allocation Amount" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @506292 @506161 @506172 @506186 @506191 @506306 @506248 @506253 @506291 @506293 @506296 @Sprint-06 @US-500174 @M04Announcement
  Scenario Outline:Verify that the announcement owner sees the system should not delete the corresponding rows in the Invited Applicants and Allocations section if user delete a row in the downloaded Excel, and then upload the Excel.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
     #506306
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    And I click modal button "Close"
    #506293
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I refresh the page
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |
    And I wait for "3" seconds
  #506172
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      |  | Actions     | Institution ID | SED Code | Applicants                   | Waiver | Allocation Amount | Reallocation | Total Available |
      |  | Action menu | 166485411255   | CACP12   | {SavedValue:SubrecipientOrg} | N/A    | $0                | $0           | $0              |
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1500" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      |  | Actions     | Institution ID | SED Code | Applicants                   | Waiver | Allocation Amount | Reallocation | Total Available |
      |  | Action menu | 166485411255   | CACP12   | {SavedValue:SubrecipientOrg} | N/A    | $1,500            | $1,000       | $2,500          |
    #506296 #506186
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo2.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | SED Code | Applicants                         | Waiver | Allocation Amount | Reallocation | Total Available |
      | CACP12   | {SavedValue:SubrecipientOrg}       | N/A    | $1,500            | $1,000       | $2,500          |
      | NYH12    | {SavedValue:SubrecipientHealthOrg} | N/A    | $1,500            | $1,000       | $2,500          |
      | NYS12    | {SavedValue:SubrecipientSchoolOrg} | N/A    | $1,500            | $1,000       | $2,500          |
      | Total    |                                    |        | $4,500            | $3,000       | $7,500          |
    #506191
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "Instiion ID" value in "1" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "SEDCode" value in "1" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "Applican" value in "1" row and "3" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    #506248
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
      | Row #3 - The Institution ID is missing.      |
      | Row #4 - The Institution ID is missing.      |
    And I click modal button "Close"
   #506253
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "-12564" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "123456789223" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789323" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789423" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.    |
      | Row #2 - Institution ID not found: 123456789223 |
      | Row #3 - Institution ID not found: 123456789323 |
      | Row #4 - Institution ID not found: 123456789423 |
    And I click modal button "Close"
    #506264
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                     |
      | Row #2 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #3 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #4 - The Allocation Amount must be positive.                                                 |
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "0" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "0" value in "4" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "0" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "0" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "0" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #506291
    And I Update "" value in "2" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "$@!&" value in "3" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "2" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    Then I softly see value "CACP12" for title "SED Code" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "NYH12" for title "SED Code" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "NYS12" for title "SED Code" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    #506292
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants and Allocations.xlsx"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientHealthOrg}" in file "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @506148 @506298 @Sprint-06 @US-503600 @sanitysuite @M04Announcement
  Scenario Outline:Verify that the announcement owner can see the Reallocation field is added at the announcement layout->Overview tab ->child Focus Area table of Applicants and Allocations section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I navigate to "Overview" sub tab
    #506148
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Reallocation | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 10.99        | 1500              |
    And I wait for "2" seconds
    Then I softly see value "$1,099" for title "Reallocation" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Reallocation | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | -44          |                   |
    Then I softly see the following messages in the page details contains:
      | Reallocation amount cannot be more than Allocation Amount. |
    When I click on "Undo" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Reallocation | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | -44          | 1500              |
    Then I softly see value "($44)" for title "Reallocation" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Reallocation |
      | {SavedValue:SubrecipientOrg} | #$^&         |
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Reallocation |
      | {SavedValue:SubrecipientOrg} | 1600         |
    Then I softly see the following messages in the page details contains:
      | Reallocation amount cannot be more than Allocation Amount. |
    When I click on "Undo" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Reallocation | Allocation Amount |
      | {SavedValue:SubrecipientOrg} |              |                   |
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
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
    When I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #506298
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "$0" for title "Reallocation" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @506154 @506159 @506161 @506193 @512680 @512702 @Sprint-06 @US-500174b @sanitysuite @M04Announcement
  Scenario Outline:Verify that the announcement owner can see the Total Available field is added at the announcement layout->Overview tab ->Applicants and Allocations section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo.xlsx" into library
    And I click modal button "Close"
    #506159
    And I wait for "2" seconds
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I softly verify that the file "Applicants and Allocations.xlsx" is downloaded
    #506161
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "3" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    #512680
    And I Update "$@!&" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                         |
      | Row #2 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
      | Row #3 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
      | Row #3 - Reallocation amount cannot be more than Allocation Amount.                                  |
      | Row #4 - Reallocation amount cannot be more than Allocation Amount.                                  |
    And I click modal button "Close"
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "$@!&" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                         |
      | Row #2 - Reallocation amount cannot be more than Allocation Amount.                                  |
      | Row #3 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
      | Row #3 - Reallocation amount cannot be more than Allocation Amount.                                  |
      | Row #4 - The Reallocation amount entered is invalid. The Reallocation amount must be a whole number. |
    And I click modal button "Close"
    And I Update "1500" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "1500" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "1500" value in "4" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "-1245" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #512702
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1500" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "1500" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "1500" value in "4" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "10000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                        |
      | Row #2 - Reallocation amount cannot be more than Allocation Amount. |
      | Row #3 - Reallocation amount cannot be more than Allocation Amount. |
    And I click modal button "Close"
    #506193
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                      |
      | Row #3 - Duplicate entry found for Institution ID (166485411255). The Institution ID must be unique for each row. |
      | Row #4 - Duplicate entry found for Institution ID (166485411255). The Institution ID must be unique for each row. |
    And I click modal button "Close"
    #506154
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Total Available |
    When I click on "Edit" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see field "Total Available" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Waiver | Allocation Amount | Reallocation |
      | {SavedValue:SubrecipientOrg} | No     | 1000              | 1000         |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Institution ID | SED Code | Waiver | Allocation Amount | Reallocation | Total Available |
      | 166485411255   | CACP12   | No     | $1,000            | $1,000       | $2,000          |

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @509128 @506302 @Sprint-06 @US-500174 @M04Announcement
  Scenario Outline:Verify that the Internal user (Peer Reviewer) with Edit access Yes can sees the following section-level actions in the Applicants and Allocations section a.  Download Excel b.  Upload Excel c. Delete Selected and Add Organizations button.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    #509128
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any Applicants. |

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
      | PM       | PO           | {SavedValue:PO Username} |
#      | PO      | FO           | {SavedValue:FO Username}  |
#      | FO      | FD           | {SavedValue:FD Username}  |
#      | FD      | EXE          | {SavedValue:FD Username}  |

  @509130 @Sprint-06 @US-503600 @M04Announcement
  Scenario Outline:Verify that the announcement owner sees an error message if upload the excel for inviting Applicant without adding the Estimated Total Funding in the Announcement. OR allocation amount is greater than the Estimated Total Funding amount.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Public School Districts" into field "EligibleApplicantTypes__c"
    When I enter value "Non-public Schools" into field "EligibleApplicantTypes__c"
    When I enter value "Other" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo2.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                          |
      | Allocated amount for Subrecipient cannot be greater than the Estimated Total Funding. |
    And I click modal button "Close"
    When I click on "Edit" in the page details
    When I enter value "1000" into field "TotalCommittedAmount__c"
    And I click on "Save" in the page details
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload file "Applicants and Allocations FANo2.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                          |
      | Allocated amount for Subrecipient cannot be greater than the Estimated Total Funding. |

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @506905-F @507037-F @509578 @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see specified columns at Announcement layout->Financials tab->Budget Categories table and details in the table are populated as per the given excel when the budget type is selected as 'FS-10'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    #@506905-F
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
    #@507037-F
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
    #509578
    And I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    #509578
    And I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    #509578
    And I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @507087-F @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see specified columns are hidden when the budget type is selected as 'Lump Sum'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
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

  @511020-F @510971-F @NYSED-2114-F @Sprint-07 @US-508915 @NYSEDSprint-23 @US-NYSED-1849 @M04Announcement
    @NYSED-6267 @NYSED-Sprint-30 @US-NYSED-5970 @M04
  Scenario Outline: Verify that the Internal User can see 'Cert Level' and 'Available balance' columns(after the Funding Account column)  on the Funding Accounts section of the Financials Tab on the announcement - Formula
  |Verify that Internal User can see all status of announcements in Related Announcements section on the Program Layout|
  |Verify that the Announcement Owner can see the validation message for the field ‘Office Phone’ is updated on the Announcement layout → Overview tab → Contacts section → Create Contact modal.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Active Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Active Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    #NYSED-6267
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:Automation Runtime Active Program}" inside table "---program:-:FundingAllocationTableId---"
    When I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Program Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "MobilePhone"
    And I enter value "704777786" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Office Phone Number. |
    And I enter value "(704) 777-7866" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "(704) 777-7866" for title "Business Phone" against the value "{SavedValue:ProgramOrganization}" inside table "---announcement:-:contactTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    #511020-F
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Active Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Active Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    #NYSED-6267
    Then I softly see value "Approved" for title "Status" against the value "{SavedValue:Automation Runtime Active Program}" inside table "---program:-:FundingAllocationTableId---"
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    #511020-F
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #511020-F
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Active Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Active Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    #NYSED-6267
    Then I softly see value "Published" for title "Status" against the value "{SavedValue:Automation Runtime Active Program}" inside table "---program:-:FundingAllocationTableId---"
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    #NYSED-2114
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "OSC Approved?" inside page block
    When I click on "Edit" in the page details
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
       #510971-F
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @512177-F @Sprint-07 @US-487964 @M04Announcement
  Scenario Outline: Verify that the grantee user cannot see the section-level instructions in the Applicants and Allocations section on the Opportunity.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
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

  @510767-F @510790-F @511020-F @Sprint-07 @US-503307 @M04Announcement
  Scenario Outline: Verify that the announcement owner sees that the 'Office' field is added after the 'Project Role' field in the Contact Information section on the 'Create Contact' modal on the Announcement when the announcement owner clicks on the 'New' button.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
      #510767-F
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
    #510790-F
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I see only the following headers in table with id "---announcement:-:annoucementContactTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:contactTableId---" :
      | Name           | Office          |
      | Automation EXE | Automation Test |
    When I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:contactTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
     #510767-F
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
    #510790-F
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I see only the following headers in table with id "---announcement:-:annoucementContactTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username}

  @511011-F @511328 @Sprint-07 @US-506360 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see the updated allocation amount is reflected in the corresponding application (Only in 'Created' status) if the announcement owner update the allocation amount for a given organization when announcment is Unpublish
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 1000000000000   |
    #511011
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    #511328
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    When I navigate to "Overview" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Allocation Amount | Last Updated By |
      | Automation Permanent Focus Area | $0                | Automation PM   |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 1500              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Allocation Amount | Last Updated By |
      | Automation Permanent Focus Area | $1,500            | Automation PM   |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Allocation Amount | Last Updated By |
      | Automation Permanent Focus Area | $1,000            | Automation PM   |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
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
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #511328
    Given I navigate to "Overview" sub tab
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "2100" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Allocation Amount | Last Updated By |
      | Automation Permanent Focus Area | $2,100            | Automation PM   |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    #511328
    Given I navigate to "Overview" sub tab
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "2200" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I wait for "2" seconds
    When I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Allocation Amount | Last Updated By |
      | Automation Permanent Focus Area | $2,200            | Automation PM   |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 10000000000     |
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

  @510328 @510366 @514018 @511117 @511139 @511128 @511141 @Sprint-07 @US-487814 @US-487960 @M04Announcement
  Scenario Outline:Verify that the Announcement Owner can see the Section Action buttons. Edit the data in the Applicants and Allocations section after unpublishing the announcement. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
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
    #511117
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    #511117
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    #511128
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount | Reallocation |
      | {SavedValue:SubrecipientOrg} | 1500              | 1000         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                   | Waiver | Allocation Amount | Reallocation | Total Available |
      | {SavedValue:SubrecipientOrg} | N/A    | $1,500            | $1,000       | $2,500          |
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Application"
    And I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    #510328
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount | Reallocation |
      | {SavedValue:SubrecipientOrg} | 2000              | 1500         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                   | Waiver | Allocation Amount | Reallocation | Total Available |
      | {SavedValue:SubrecipientOrg} | N/A    | $2,000            | $1,500       | $3,500          |
    #510366
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I wait for "2" seconds
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "500" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "2" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "500" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "7" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "1" seconds
    When I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         | Waiver | Allocation Amount | Reallocation | Total Available |
      | {SavedValue:SubrecipientOrg}       | N/A    | $1,000            | $500         | $1,500          |
      | {SavedValue:SubrecipientHealthOrg} | N/A    | $1,000            | $500         | $1,500          |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Application}" in "---applicationIntake:-:recipientApplications---" panel
    #514018 #511139
    When I click on "View" icon for "{SavedValue:Automation Runtime Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$1,000"
    And I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Given I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 2500              |
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Application}" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Application}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,500"
    And I wait for "3" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    Given I navigate to "Overview" sub tab
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "7" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Application}" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Application}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    And I navigate to "Budget" sub tab
    #514024
    Then I softly see field "Allocation Amount" as "$1,000"
    And I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #511128
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount | Reallocation |
      | {SavedValue:SubrecipientOrg} | 1500              | 1000         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                   | Waiver | Allocation Amount | Reallocation | Total Available |
      | {SavedValue:SubrecipientOrg} | N/A    | $1,500            | $1,000       | $2,500          |
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Application}" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Application}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    And I navigate to "Budget" sub tab
    #511141
    Then I softly see field "Allocation Amount" as "$1,000"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @510455 @510458 @514020 @514022 @511118 @511130 @511198 @511183 @Sprint-07 @US-487814 @US-487960 @M04Announcement @Bug-Ticket-538092
  Scenario Outline:Verify that the Announcement Owner can see the Section Action buttons. Edit the data in the Applicants and Allocations section after unpublishing the announcement.: Formula: By Applicant and Focus
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
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
    #511118 @big_id_524793
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #511118 @big_id_524793
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #511130
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1500              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $1,500            |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ApplicatinID"
    And I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    #510455
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $1,000            |
    #510458
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Applicants are associated successfully |
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Applicants are associated successfully |
    When I close "Add Organizations" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "3" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "4" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "500" value in "2" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "500" value in "3" row and "7" column in "Applicants and Allocations.xlsx"
    And I Update "500" value in "4" row and "7" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,000            | $500         | $1,500          |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,000            | $500         | $1,500          |
    When I collapse nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,000            | $500         | $1,500          |
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ApplicatinID}" in "---applicationIntake:-:recipientApplications---" panel
    #514020
    When I click on "View" icon for "{SavedValue:ApplicatinID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$1,000"
    #511198
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see value "$1,000" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ApplicatinID}" in "---applicationIntake:-:recipientApplications---" panel
    #514020
    When I click on "View" icon for "{SavedValue:ApplicatinID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$1,000"
    #511198
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see value "$1,000" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2500              |
    And I wait for "3" seconds
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ApplicatinID}" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "{SavedValue:ApplicatinID}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,500"
    And I wait for "3" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    Given I navigate to "Overview" sub tab
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "3" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "7" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I wait for "1" seconds
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ApplicatinID}" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "{SavedValue:ApplicatinID}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    And I navigate to "Budget" sub tab
    #514022
    Then I softly see field "Allocation Amount" as "$1,000"
    #511183
    Then I softly see value "$1,000" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @511117-RJ @Sprint-07 @US-487960 @M04Announcement
  Scenario Outline:Verify that the Announcement Owner can see the section-level actions and row-level edit and delete icons in the Applicants and Allocations section are hidden for the following statuses of the announcement: Submitted for Approval, Approved, Rejected
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
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
    #511117
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    #511117
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @511118-RJ @519312 @Sprint-07 @US-487960 @bug_id_524793 @M04Announcement
  Scenario Outline:Verify that the Announcement Owner can see the section-level actions and row-level edit and delete icons in the Applicants and Allocations section are hidden for the following statuses of the announcement: Submitted for Approval, Approved, Rejected
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
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
    #511118
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    #511118
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Rejected"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    #519312
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    Then I see the following rows under the following columns in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @511271 @536002 @Sprint-07 @US-487960 @M04Announcement @NYSEDSprint-13 @US-504142 @M04 @DirectGrant-Yes @FS-10
  Scenario Outline:Verify that the Announcement Owner can see the "Last Updated' and 'Last Updated By' audit columns (as read-only) after the Total Available column in the Applicants and Allocations section. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I see only the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Application EGMS ID | Application Status | Waiver | Allocation Amount | Reallocation | Total Available | Last Updated By | Last Updated |
    And I click on "Edit" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see field "Last Updated By" is not editable
    Then I softly see field "Last Updated" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         | Allocation Amount | Last Updated By |
      | {SavedValue:SubrecipientOrg}       | $1,500            | Automation PM   |
      | {SavedValue:SubrecipientHealthOrg} | $0                | Automation PM   |
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "1000" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "1000" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "500" value in "2" row and "6" column in "Applicants and Allocations.xlsx"
    And I Update "500" value in "3" row and "6" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         | Allocation Amount | Last Updated By |
      | {SavedValue:SubrecipientOrg}       | $1,000            | Automation PM   |
      | {SavedValue:SubrecipientHealthOrg} | $1,000            | Automation PM   |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Overview" sub tab
    #536002
    Then I softly see "Revisions Allowed?" inside page block detail
    Then I softly see field "Is Application Deadline Soft?" as "No"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "All Budget Periods" into field "BudgetingPeriod__c"
    And I click on "Save" in the page details
    #536002
    Then I softly see field "Budgeting is Required for:" as "All Budget Periods"
    Then I softly do not see "Is Detailed Budget Required on the Subaward?" inside page block detail
    When I navigate to "Setup" sub tab
    #536002
    Then I softly do not see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Review Steps" page block displayed
    When I navigate to "Responsibilities" sub tab
    #536002
    Then I softly see "FDM" in flex table header "---announcement:-:approversTableId---"
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
    When I navigate to "Financials" sub tab
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Only First Budget Period" into field "BudgetingPeriod__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         | Allocation Amount | Last Updated By |
      | {SavedValue:SubrecipientOrg}       | $1,000            | Automation PM   |
      | {SavedValue:SubrecipientHealthOrg} | $1,000            | Automation PM   |
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         | Allocation Amount | Last Updated By |
      | {SavedValue:SubrecipientOrg}       | $1,000            | Automation PM   |
      | {SavedValue:SubrecipientHealthOrg} | $1,000            | Automation PM   |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @511594-F @Sprint-07 @US-508916 @US-514567 @516276-F @516289-F @516279-D @NYSED-2116 @bug-id_536160 @NYSEDSprint-23 @US-NYSED-1849 @sanitysuite @M04Announcement
  Scenario Outline: Verify that the Only FD profile users see the 'OSC Approved?' field is added on the 'Update Details' modal and is editable, and when the modal is closed, the updated value should populate on the Announcement Specific Settings section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    #516289-F
    And I navigate to "Financials" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I pause execution for "3" seconds
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    And I wait for "3" seconds
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    #516279-F
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    Then I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #517082-F
    Then I softly cannot see top right button "Update Details" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #516279-F
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    #516276
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #NYSED-2116
    Then I softly cannot see the following messages in the page details contains:
      | The announcement cannot be published because OSC approval is not received. Please contact the FD user to update the 'OSC Approved?' value using the Update Details button. |
    #516279-F
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    #516276
    When I enter in modal value "2" into field "Bud_Stop__c"
    When I enter in modal value "21" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+2}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+21}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    #516279-F
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
       #516289-F
    And I navigate to "Financials" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
   #516276
    When I enter in modal value "3" into field "Bud_Stop__c"
    When I enter in modal value "22" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+3}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+22}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    #516276
    When I enter in modal value "0" into field "Bud_Stop__c"
    When I enter in modal value "11" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-F
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+0}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+11}"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @519312 @Sprint-08 @US-518025 @M04Announcement
  Scenario Outline: Verify that 'hyphen' (-) is added in the Fund Year column in Directed Announcement list views (All, Draft, Published, Rejected, Closed and Archived, My Records).
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    Then I see the following rows under the following columns in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |
    And I click toggle button to select "Formula Announcements - Created"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    Then I see the following rows under the following columns in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "AEGMSID" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I click toggle button to select "Formula Announcements - Published"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "1" seconds
    Then I see the following rows under the following columns in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Fund Year |
      | 1900-00   |
    And I click toggle button to select "Formula Announcements - Closed and Archived"
    When I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    Then I see the following rows under the following columns in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @518784 @Sprint-08 @US-508409 @M04
  Scenario Outline:Verify that the Announcement Owner cannot see 'Grant Abbreviation' field is added after 'First Payment %' on announcement layout in Overview->Announcement Specific Settings when option for 'Is Announcement for Direct Grant?' is selected as 'No'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #518784
    Then I softly see field "Is Announcement for Direct Grant?" as "No"
    Then I softly cannot see field "Grant Abbreviation" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @506300 @Sprint-08 @US-513690 @M04
  Scenario Outline:Verify that the Internal user (Peer Reviewer) with Edit access NO does not sees the following section-level actions in the Applicants and Allocations section b.  Upload Excel c. Delete Selected and Add Organizations button.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaInvitedApplicatsTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #506300
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

    Examples:
      | UserType | ReviewerUser | Reviewer                 | NonOwner |
      | PM       | PO           | {SavedValue:PO Username} | PO       |
#      | PO       | FO           | {SavedValue:FO Username} |  FO      |
#      | FO       | FD           | {SavedValue:FD Username} |  FD      |
#      | FD       | EXE          | {SavedValue:FD Username} |  EXE     |

  @510498 @510497 @511526 @511483 @Sprint-08 @US-513690 @M04
  Scenario Outline:Verify that the Announcement Owner cannot Update the Allocation from the upload Excel and see the validation for the Applicant if Application is Submitted to Grantor. Formula: By Applicant and Focus Area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
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
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    And I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
     #511526
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "900" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the following errors:                                                                                          |
      | Row #2 - {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    And I click modal button "Close"
    #511483
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    And I wait for "3" seconds
    When I click on "Undo" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area |                   |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    And I click on "Unpublish" in the page details
    When I navigate to "Overview" sub tab
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "2000" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the following errors:                                                                                          |
      | Row #2 - {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    #510497
    And I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    When I click on "Undo" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area |                   |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | PO       | Automation PO user|
#      | FO       | Automation FO user|
#      | FD       | Automation FD user|

  @518453 @518696 @518700 @518711 @518781 @Sprint-09 @US-508914 @M04 @defectID-535056
  Scenario: Verify the task when announcement owner clicks 'Send for Review' icon on Peer Reviews table
  |Verify the task when previous announcement approver clicks on the approve button|
  |Verify the task when the approver clicks on the 'Forward' action and selecting another user. |
  |Verify the task when the Final approver clicks on 'Approve' action and submit. |
  |Verify the task when the Last approver clicks on Undo button and clicks ‘Yes’ on the confirmation window.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I refresh the page
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "---announcement:-:JustificationforDeficitAmount---"
    Then I softly see field "Budget Type" as "FS-10"
    And I enter value "100078" into field "TotalCommittedAmount__c"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Overview" sub tab
    And I save the field labeled "Fund Year" as "FundYear"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations.xlsx" into library
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    #507778
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PO | Step 1       |
      | Automation PM | Step 2       |
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{Savedvalue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---announcement:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                    | Subject                                    | Due Date Only        | Status      |
      | Action menu | {Savedvalue:AnnEGMSID} | Approve Funding Announcement | Approve Announcement {SavedValue:FundYear} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{Savedvalue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{Savedvalue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---announcement:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                    | Subject                                    | Due Date Only        | Status      |
      | Action menu | {Savedvalue:AnnEGMSID} | Approve Funding Announcement | Approve Announcement {SavedValue:FundYear} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{Savedvalue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{Savedvalue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---announcement:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                    | Subject                                    | Due Date Only        | Status      |
      | Action menu | {Savedvalue:AnnEGMSID} | Approve Funding Announcement | Approve Announcement {SavedValue:FundYear} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{Savedvalue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{Savedvalue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---announcement:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type            | Subject                                    | Due Date Only        | Status      |
      | Action menu | {Savedvalue:AnnEGMSID} | Publish Announcement | Publish Announcement {SavedValue:FundYear} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{Savedvalue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{Savedvalue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{Savedvalue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details
    And I wait for "3" seconds
    And I navigate to "Announcements" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{Savedvalue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---announcement:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                    | Subject                                    | Due Date Only        | Status      |
      | Action menu | {Savedvalue:AnnEGMSID} | Approve Funding Announcement | Approve Announcement {SavedValue:FundYear} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{Savedvalue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"

  @521172 @Sprint-09 @US-518586 @M04Announcement @defectID-538088
  Scenario Outline: Verify that the announcement owner can see that the existing Year field, which was required for Submit, is now required for Save on the Formula Announcement layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter value "--None--" into field "NYSED_Year__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required. |
    And I enter value "1991" into field "NYSED_Year__c"
    And I click modal button "Continue"
    And I enter value "--None--" into field "NYSED_Year__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required in the Information section. |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FD        |
#  |FO        |

  @510580 @Sprint-07 @US-509836 @M04Announcement
  Scenario Outline: Verify that user should see data type of all currency fields at announcement layout->Financials tab, is changes to accept whole numbers only - Formula Announcement ( By Applicant and Focus Area)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
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
    Then I softly see field "Budget Type" as "FS-10"
    And I enter value "1000.78" into field "TotalCommittedAmount__c"
    And I click on "Save" in the page details
    Then I softly see field "Estimated Total Funding" as "$100,078"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:InternalFundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:ExternalFundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
#      | FD        |

  @506559 @NYSED-2151-F @NYSED-2206-F @NYSED-1884-F @NYSED-2506-F @NYSED-1883-F @Sprint-06 @US-500360 @NYSEDSprint-24 @US-NYSED-1887 @NYSEDSprint-24 @US-NYSED-1848 @NYSEDSprint-24 @US-NYSED-1826 @M04Announcement @sanitysuite
  Scenario Outline: Verify that apart from FD users, other users cannot edit, remove, associate 'Funding Account' when Directed/Formula announcement is in status- Created, Under Revision, Submitted for Review, Review Completed, Publish and Closed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    And I wait for "5" seconds
    #NYSED-2506
    Then I softly see field "Revisions Allowed?" as "Yes"
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "Public Schools" into field "EligibleApplicantTypes__c"
    And I enter value "BOCES" into field "EligibleApplicantTypes__c"
    And I enter value "Library Systems/Libraries" into field "EligibleApplicantTypes__c"
    And I enter value "Local Governments" into field "EligibleApplicantTypes__c"
    And I enter value "Institutions of Higher Education" into field "EligibleApplicantTypes__c"
    And I enter value "Community Based Organizations" into field "EligibleApplicantTypes__c"
    And I enter value "Museums & Historical Societies" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    #NYSED-1884
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    #NYSED-2506
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "Deputy Area" as "OHE"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    And I enter value "No" into field "Carry_Over__c"
    And I enter value "No" into field "Carryover_Limit__c"
    And I enter value "11.5" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    #NYSED-1883
    Then I softly see field "Deputy Area" as "P-12"
    Then I softly see field "Carry Over" as "No"
    Then I softly see field "Carry Over Limit" as "No"
    Then I softly see field "Carry Over Limit %" as "11.50%"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount2}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    #Owner- Created state
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    #owner - Submit for Approval
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #owner - Send back / Under revision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "4" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I "Send to Owner" in the approval decision
    And I wait for "1" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    #Owner- Approved state
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I "Approve" in the approval decision
    And I wait for "1" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on "Publish" in the page details
    #owner- Publish State
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                                | Allocation Amount |
      | {SavedValue:AutomationPermanentFocusArea} | 1000              |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I wait for "5" seconds
    #NYSED-2151
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
    When I hovering mouse on help text icon inside page block detail "Year"
    #NYSED-2206
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-2206
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Restricted"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "50.00%"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    #NYSED-2151
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
    When I hovering mouse on help text icon inside page block detail "Year"
    #NYSED-2206
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-2206
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Restricted"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "50.00%"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-2151
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
    When I hovering mouse on help text icon inside page block detail "Year"
    #NYSED-2206
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-2206
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Restricted"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "50.00%"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |

  @518460 @518474 @518468 @519657 @Sprint-08 @US-514221 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see a field 'Soft Application Due Date?' is renamed to 'Is Application Deadline Soft?' under Announcement layout->Overview tab->Key dates section, and that it is a dropdown field.
  |Verify that the announcement owner can see that the Carryover Limit field name is changed to Carry Over Limit and the Carryover Limit % field name is changed to Carry Over Limit % under the Overview tab -> Announcement specific settings section|
  |Verify that the announcement owner does not see the Grantor Pre-application form under the Announcement Layout->Setup tab->Business Forms section.|
  |Verify that the announcement owner can see the updated validation message related to Carry Over, Carry Over Limit and Carry Over Limit % fields.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see field "Is Application Deadline Soft?" inside page block
    Then I see only the following ordered options in dropdown field "Soft_Application_Due_Date__c" :
      | --None-- | Yes | No |
    And I enter value "--None--" into field "Soft_Application_Due_Date__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "No" into field "Soft_Application_Due_Date__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details :
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see field "Carry Over Limit" inside page block
    Then I softly see field "Carry Over Limit %" inside page block
    And I enter value "Yes" into field "Carry_Over__c"
    And I enter value "Yes" into field "Carryover_Limit__c"
    When I clear the value from field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details :
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-99" into field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Carry Over Limit % cannot be negative. |
    And I enter value "150.88" into field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Carry Over Limit % cannot be greater than 100%. |
    And I enter value "10" into field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    Then I softly see field "Carry Over Limit %" as "10.00%"
    When I navigate to "Setup" sub tab
    Then I softly do not see value "Grantor Pre-application Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |

  @518420 @518416 @Sprint-08 @US-514221 @M04Announcement
  Scenario Outline: Verify that the announcement owner does not see the validation message on the Create Announcement modal and announcement page layout when the Focus Area Required and the Advance Payment Allowed are selected as Yes.
  |Verify that the announcement owner sees at least one "Fiscal Contact" is required to submit the announcement for approval.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "Yes" into field "IsAdvancePermitted__c"
    And I click modal button "Save and Continue"
    And I wait for "1" seconds
    Then I softly cannot see the following messages in the page details :
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
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
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Project Role |
      | Automation EXE | --None--     |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details :
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |
    Then I softly see the following messages in the page details :
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
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
    Then I softly cannot see the following messages in the page details :
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role. |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |

  @510490 @510471 @511463 @511462 @Sprint-08 @US-513690 @M04Announcement @Bug-Ticket-535283
  Scenario Outline: Verify that the Announcement Owner cannot Update the Allocation from the upload Excel and see the validation for the Applicant if Application is Submitted to Grantor. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_AREA_NO-<User>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I see field "Status" as "Submitted to Grantor"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    And I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    #511462
    When I navigate to "Financials" sub tab
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "900" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the following errors:                                                                                          |
      | Row #2 - {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    And I click modal button "Close"
    #511462
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    When I click on "Undo" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} |                   |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    And I click on "Unpublish" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "900" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    #510490
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the following errors:                                                                                          |
      | Row #2 - {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    And I click modal button "Close"
    #510471
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |
    When I click on "Undo" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} |                   |
    Then I softly see the following messages in the page details contains:
      | {SavedValue:SubrecipientOrg} - Allocation Amount cannot be updated as the application has already been submitted to the grantor. |

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | PO       | Automation PO user|
#      | FO       | Automation FO user|
#      | FD       | Automation FD user|

  @517247 @517249 @Sprint-08 @US-514910 @M04
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Create Application' button at the qualified opportunity layout, and the user can create the Application.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "6" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    #517247 #517249
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | UserType   |
      | GRANTEE_CE |
      | GRANTEE_SC |

  @517250-F @517251-F @517252-F @Sprint-08 @US-514910 @M04
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Create Application' button at the qualified opportunity layout, and the user can create the Application.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
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

  @517207-F @517214-F @Sprint-08 @US-514909 @M04
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Qualify' button at the publish opportunity page, and the user can qualify the opportunity.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
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

  @517225-F @517229-F @517230-F @Sprint-08 @US-514909 @M04
  Scenario Outline:Verify that the LEA Admin Role user cannot see the 'Qualify' button at the publish opportunity page.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
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

  @516311 @516315 @Sprint-08 @US-513674 @M04
  Scenario: Verify that the Grantee user with the submit and certify role, not able to Submit the Application where the allocation amount is zero, validation appears. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "6" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 0                 |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I click on "Submit Application" in the page details
    #516311
    Then I softly see the following messages in the page details contains:
      | The application cannot be submitted to the grantor because the allocation amount is zero. |
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    #516315
    Then I softly see field "Status" as "Submitted to Grantor"

  @516316 @516318 @Sprint-08 @US-513674 @M04
  Scenario: Verify that the Grantee user with the submit and certify role, not able to Submit the Application where the allocation amount is zero, validation appears. Formula: By Applicant and Focus Area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 0                 |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I click on "Submit Application" in the page details
    #516316
    Then I softly see the following messages in the page details contains:
      | The application cannot be submitted to the grantor because the allocation amount is zero. |
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    #516318
    Then I softly see field "Status" as "Submitted to Grantor"

  @516287 @516288 @Sprint-08 @US-514026 @M04
  Scenario: Verify that the Grantee user with the create and edit role, not able to create the Application from opportunity if allocation is zero, validation appears. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_ZERO_ALLOCATION"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_CE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    #516287
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The application cannot be created because the allocation amount is zero. |
    And I click modal button "Close"
    And I refresh the page
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                                | Allocation Amount |
      | {SavedValue:AutomationPermanentFocusArea} | 500               |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    #516288
    Then I softly see field "Status" as "Created"

  @516302 @516303 @Sprint-08 @US-514026 @M04
  Scenario: Verify that the Grantee user with the create and edit role, not able to create the Application from opportunity if allocation is zero, validation appears. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_ZERO_ALLOCATION"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_CE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    #516302
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The application cannot be created because the allocation amount is zero. |
    And I click modal button "Close"
    And I refresh the page
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    #516303
    Then I softly see field "Status" as "Created"

  @520213 @Sprint-08 @US-508409 @M04
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' field is required field at the create announcement modal->Information Section: Formula - By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly do not see field "Grant Abbreviation" added after "First Payment %"

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @535953 @Sprint-13 @US-533103 @M04Announcement
  Scenario Outline:Verify that the internal user sees that on the Announcement layout -> Overview tab -> Announcement Specific Settings section, a new required field 'Fiscal Approval Required for Amendment?' is added.: Formula
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
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
    And I wait for "3" seconds
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
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - 'Fiscal Approval Required for Amendment?' is required to submit for approval. |
    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @535887 @Sprint-13 @US-533069 @M04Announcement
  Scenario Outline:Verify that the Internal User see that Focus Area Required? and Allocation Level editable fields, on the extended create announcement modal, if the budget type is selected as 'Lump Sum': Formula
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    Then I see only the following ordered options in dropdown field "Budget_Category_Package__c" :
      | --None-- | FS-10 | Lump Sum |
    Then I softly see asterisk mark on "Focus Areas Required?"
    Then I softly see asterisk mark on "Allocation Level"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "--None--" into field "FocusAreaRequired__c"
    When I enter in modal value "--None--" into field "Allocationlevel__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Focus Areas Required? is required in the Announcement Specific Settings section. |
      | To Save, Allocation Level is required in the Announcement Specific Settings section.      |
    When I enter in modal value "Yes" into field "FocusAreaRequired__c"
    When I enter in modal value "N/A" into field "Allocationlevel__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | For a formula announcement, the Allocation Level must be one of the following - By Applicant or By Applicant and Focus Area. |
    When I enter in modal value "By Applicant and Focus Area" into field "Allocationlevel__c"
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

  @535895 @535912 @Sprint-13 @US-533069 @M04Announcement
  Scenario Outline: Verify that the internal user sees that the 'Budgeting is Required for:' field is editable and OOTB drop down values are available for selection on Announcement Layout->Financials Tab->Budget Specific settings, if the budget type is selected as 'Lump Sum'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    Then I softly see field "Is a Detailed Budget Required on the Application?" as "No"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see fields "BudgetingPeriod__c" is in edit mode
    Then I see only the following ordered options in dropdown field "BudgetingPeriod__c" :
      | --None-- | All Budget Periods | Only First Budget Period |
    And I enter value "All Budget Periods" into field "BudgetingPeriod__c"
    When I click on "Save" in the page details
    Then I softly see field "Budgeting is Required for:" as "All Budget Periods"
    #535912
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

  @535962 @Sprint-08 @US-506812 @M04Announcement
  Scenario Outline: Verify that the internal user sees that on the Announcement layout -> Financials tab -> Budget Period Details section, a new date column 'Amendment Deadline' added after 'End Date'.: Formula
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    #535962
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:budgetPeriodTableId---" :
      | Actions | Budget Period Name | Start Date | End Date | Amendment Deadline |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 25                 |
    Then I softly see the following messages in the page details contains:
      | The 'Amendment Deadline' date should be within the Budget Period Start Date and Budget Period End Date. |
    When I click on "Undo" icon for "BP01" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 160                |
    Then I softly see the following messages in the page details contains:
      | The 'Amendment Deadline' date should be within the Budget Period Start Date and Budget Period End Date. |
    When I click on "Undo" icon for "BP01" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
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
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
      | PM       | PO           | {SavedValue:PO Username} |
#      | PO      | FO           | {SavedValue:FO Username}  |
#      | FO      | FD           | {SavedValue:FD Username}  |
#      | FD      | EXE          | {SavedValue:FD Username}  |
#      | EXE     | PM           | {SavedValue:PM Username}  |

  @520169 @522802 @520212 @520171 @520175 @Sprint-08 @US-506812 @M04
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' as a picklist field with Yes/No dropdown options is added at the create announcement modal->Information Section: Formula - By Applicant
  |Verify that the Announcement Owner can see 'Is a Detailed Budget Required on the Application?' field is hidden only when option for 'Is Announcement for Direct Grant?' is selected as 'Yes' in the Budget Specific Settings --> Financials tab: Formula|
  |Verify that the Announcement Owner can see 'Grant Abbreviation' field is added after 'First Payment %' on announcement layout in Overview->Announcement Specific Settings only when option for 'Is Announcement for Direct Grant?' is selected as 'Yes' |
  |Verify that the Announcement Owner can see below fields and sections on announcement View and Edit layouts are hidden only when option for 'Is Announcement for Direct Grant?' is selected as 'Yes' |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    #520169
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    Then I softly see default value "Yes" for the field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    #520169
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    Then I softly see default value "Yes" for the field "NYSED_IsDirecGrant__c"
    When I enter "CreationFor_ByAp_focusNo_DG_Yes" values from "Announcement_Field_Values.xlsx"
    When I hovering mouse on help text icon inside page block detail "Is Announcement for Direct Grant?"
    Then I softly see "This field indicates whether or not this announcement will be used for direct grants." shown as help text
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    #520171
    Then I softly see field "Is Announcement for Direct Grant?" added after "Link For Additional Information"
    Then I softly see that "Is Announcement for Direct Grant?" rendered in view mode only
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    When I click on "Save" in the page details
    #520212
    Then I softly see field "Grant Abbreviation" added after "First Payment %"
    #520171
    Then I softly see field "Is Announcement for Direct Grant?" added after "Link For Additional Information"
    Then I softly see that "Is Announcement for Direct Grant?" rendered in view mode only
    When I navigate to "Financials" sub tab
    #522802
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?" inside page block
    #520175
    Then I softly cannot see field "Application Due Date" inside page block
    When I navigate to "Overview" sub tab
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts" page block displayed
    Then I softly do not see "Q&A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block
    When I click on "Edit" in the page details
    Then I softly cannot see field "Application Due Date" inside page block
    When I navigate to "Overview" sub tab
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts" page block displayed
    Then I softly do not see "Q&A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @533134 @NYSEDSprint-12 @US-528590 @M04
  Scenario Outline: Verify that a non-owner cannot see the section-level Associate button or the line-level Edit and Remove action for the budget category of the announcement when it is in 'Created', 'Submitted for Review', 'Reviewed' status and the budget type FS-10
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    #Created State
    When I re-login to "As a Grantor" app as "<Non Owner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Support Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Support Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Supplies and Materials" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Supplies and Materials" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Travel Expenses" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Travel Expenses" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Travel Expenses" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Employee Benefits" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Employee Benefits" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Employee Benefits" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Indirect Cost" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Indirect Cost" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Indirect Cost" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "BOCES Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "BOCES Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Minor Remodeling" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Minor Remodeling" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Minor Remodeling" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Equipment" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Equipment" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Equipment" in flex table with id "---announcement:-:announcementBudgetCategory---"

    Examples:
      | UserType | Non Owner |
      | PM       | PO        |
#      | PO       | PM        |
#      | FO       | FD        |
#      | FD       | FO        |

  @533156 @NYSEDSprint-12 @US-528590 @M04
  Scenario Outline: Verify that announcement owner can see section-level Associate button, line-level Edit and Remove actions for budget category in a formula announcement when it is in 'Created', 'Submitted for Review', or 'Reviewed' status and the Budget type is 'FS-10'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    #Created State
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Support Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Support Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Supplies and Materials" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Supplies and Materials" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Supplies and Materials" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Travel Expenses" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Travel Expenses" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Travel Expenses" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Employee Benefits" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Employee Benefits" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Employee Benefits" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Indirect Cost" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Indirect Cost" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Indirect Cost" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "BOCES Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "BOCES Purchased Services" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Edit" against "Minor Remodeling" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "Remove" against "Minor Remodeling" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "No Actions Available" against "Minor Remodeling" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I click on "Edit" icon for "Minor Remodeling" inside flex table with id "---announcement:-:announcementBudgetCategory---" without waiting for record
    Then I softly see fields "NYSED_InIndCostCal__c" is in edit mode
    Then I softly see fields "NYSED_LineItemAvailable__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Given I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category             | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Professional Staff Salaries | Yes                                  | 100                            |
    Then I softly see value "$100" for title "Line Item Level, If Applicable" against the value "Professional Staff Salaries" inside table "---announcement:-:announcementBudgetCategory---"
    Then I softly see value "Yes" for title "Include In Indirect Cost Calculation" against the value "Professional Staff Salaries" inside table "---announcement:-:announcementBudgetCategory---"
    When I click on "Remove" icon for "Professional Staff Salaries" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    Then I softly do not see value "Professional Staff Salaries" for title "Budget Category" inside table "---announcement:-:announcementBudgetCategory---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I click "Associate" after selection of "Professional Staff Salaries" by showing entries "All" in flex table with id "---announcement:-:selectBudgetCategory---"
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---announcement:-:announcementBudgetCategory---"

    Examples:
      | UserType | Non Owner |
#      | PM       | PO        |
      | PO       | PM        |
#      | FO       | FD        |
#      | FD       | FO        |

  @533116--lumpsum @533170--lumpsum @533115--lumpsum @536002-lumpsum @NYSEDSprint-12 @US-528590 @NYSEDSprint-13 @US-504142 @M04 @LUMPSUM @DirectGrant-No
  Scenario Outline: Verify that the peer reviewer with allow record editing access cannot see the line-level Edit action for the budget category in the announcement when the Budget type is 'Lump Sum'.
  |Verify that the announcement owner cannot see line level Edit action of budget category in any state of a formula announcement when the Budget type is 'Lump Sum'.|
  |Verify that non-announcement owner cannot see line level Edit action for budget category in any state of the announcement when the Budget type is 'Lump Sum'.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    #536002
    Then I softly see "Revisions Allowed?" inside page block detail
    Then I softly see field "Is Application Deadline Soft?" as "No"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "All Budget Periods" into field "BudgetingPeriod__c"
    And I click on "Save" in the page details
    #536002
    Then I softly see field "Budgeting is Required for:" as "All Budget Periods"
    Then I softly do not see "Is Detailed Budget Required on the Subaward?" inside page block detail
    When I navigate to "Setup" sub tab
    #536002
    Then I softly do not see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Review Steps" page block displayed
    When I navigate to "Responsibilities" sub tab
    #536002
    Then I softly see "FDM" in flex table header "---announcement:-:approversTableId---"
    When I navigate to "Financials" sub tab
    #Owner- Created State
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    #Non Owner - Created state
    When I re-login to "As a Grantor" app as "<Non Owner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see that "BP01" has been added in flextable with Id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name        | Announcement |
      | <Approvers> | Step 1       |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "{SavedValue:SubrecipientOrg}" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
      #Owner- Submit for Approve state
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Lump Sum" in flex table with id "---announcement:-:announcementBudgetCategory---"

    Examples:
      | UserType | PeerReviewer  | Reviewer | Non Owner | Approvers     |
#      | PM       | Automation PO | PO       | FO        | Automation PM |
#      | PO       | Automation PM | PM       | FD        | Automation PO |
      | FO       | Automation FD | FD       | EXE       | Automation FO |
#      | FD       | Automation FO | FO       | PM        | Automation FD |

  @533132 @533146 @533138 @533173 @533175 @535988 @NYSEDSprint-12 @NYSEDSprint-13 @US-504142 @US-528590 @M04 @bug-ID-541822 @DirectGrant-No
  Scenario Outline: Verify that the peer reviewer with allow record editing access can see section-level Associate button, line-level Edit and Remove actions for budget category in the announcement when the Budget type is 'FS-10'.
  |Verify that the peer reviewer sees a validation message on section-level Save button when 'Line Item Level, If Applicable' is greater than zero and 'Include in Indirect Cost Calculation' is set to 'No' or 'None' in an FS-10 Announcement.|
  |Verify that the internal users see that 'Line Item available If applicable' field is changed to 'Line Item Level, If Applicable' when the budget type is 'FS-10'.|
  |Verify that the Announcement Owner sees a validation message on section-level Save button when 'Line Item Level, If Applicable' is greater than zero and 'Include in Indirect Cost Calculation' is set to 'No' or 'None' in an FS-10 Formula Announcement.|
  |Verify that the Announcement Owner sees a validation message on clicking the section-level 'Save' button when the 'Include in Indirect Cost Calculation' field is set to 'Yes' for the Indirect Cost category in an FS-10 Formula Announcement.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    #535988
    Then I softly see "Revisions Allowed?" inside page block detail
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    #535988
    Then I softly see "Revisions Allowed?" inside page block detail
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Travel Expenses | --None--                             | 2.09                           |
    Then I softly see the following messages in the page details contains:
      | 'Line Item Level, If Applicable' value can be set more than zero only if 'Include In Indirect Cost Calculation' is selected as 'Yes'. |
    When I click on "Undo" icon for "Travel Expenses" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Given I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Travel Expenses | No                                   | 2.09                           |
    Then I softly see the following messages in the page details contains:
      | 'Line Item Level, If Applicable' value can be set more than zero only if 'Include In Indirect Cost Calculation' is selected as 'Yes'. |
    When I click on "Undo" icon for "Travel Expenses" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    Given I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Indirect Cost   | Yes                                  | 2.09                           |
    Then I softly see the following messages in the page details contains:
      | 'Include In Indirect Cost Calculation' value cannot be 'Yes' for Indirect Cost Category. |
    When I click on "Undo" icon for "Indirect Cost" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category | Include In Indirect Cost Calculation |
      | Indirect Cost   | --None--                             |
    Then I softly cannot see the following messages in the page details contains:
      | 'Include In Indirect Cost Calculation' value cannot be 'Yes' for Indirect Cost Category. |
    Then I softly see value "" for title "Include In Indirect Cost Calculation" against the value "Indirect Cost" inside table "---announcement:-:announcementBudgetCategory---"
    Given I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category | Include In Indirect Cost Calculation |
      | Indirect Cost   | No                                   |
    Then I softly cannot see the following messages in the page details contains:
      | 'Include In Indirect Cost Calculation' value cannot be 'Yes' for Indirect Cost Category. |
    Then I softly see value "No" for title "Include In Indirect Cost Calculation" against the value "Indirect Cost" inside table "---announcement:-:announcementBudgetCategory---"

    Examples:
      | UserType | PeerReviewer  | Reviewer |
      | PM       | Automation PO | PO       |
#      | PO       | Automation PM | PM       |
#      | FO       | Automation FD | FD       |
#      | FD       | Automation FO | FO       |

  @498250 @498269 @535964 @US-504142 @US-487902 @NYSEDSprint-04 @NYSEDSprint-13 @M04 @M04 @DirectGrant-Yes @FS-10
  Scenario Outline:Verify that the Internal user sees the following section-level actions in the Invited Applicants section a.  Download in Excel b.  Upload Excel  c.  Delete Selected  and d. Add Organizations button.
  |Verify that the Internal user sees that the downloaded Excel shows only the columns which are shown in the Applicants and Allocations section. (Note: The list of columns may vary in the section depending on the allocation-level set for the announcement.)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    #535964
    Then I softly do not see "Revisions Allowed?" inside page block detail
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #535964
    Then I softly do not see "Revisions Allowed?" inside page block detail
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    #498250
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I wait for "5" seconds
    #498269
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "1" contains value "{SavedValue:AutomationPermanentFocusArea}" against the column name "Focus Area" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "1" contains value "0" against the column name "Allocation Amount" in the Excel file "Applicants and Allocations.xlsx"

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @498269 @498725 @US-487902 @NYSEDSprint-04 @M04
  Scenario Outline:Verify that the Internal user sees that the downloaded Excel shows only the columns which are shown in the Applicants and Allocations section. (Note: The list of columns may vary in the section depending on the allocation-level set for the announcement.)
  |Verify that the Internal user sees the 'Allocation Amount' is not required for the announcement when I submit the announcement for approval and when I publish the announcement.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I navigate to "Overview" sub tab
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    #498269
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "1" contains value "1000" against the column name "Allocation Amount" in the Excel file "Applicants and Allocations.xlsx"
    And I click modal button "Close"
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "1" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I click modal button "Close"
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
    #498725
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    #498725
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    #498725
    Then I softly see status in Progress-bar is "Published" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |

  @535996-Lumpsum @535998-Lumpsum @536000-Lumpsum @536001-Lumpsum @NYSEDSprint-13 @US-504142 @M04 @LUMPSUM @DirectGrant-Yes
  Scenario Outline:Verify that the ‘Is Detailed Budget Required on the Subaward?’ field is visible on the Formula Announcement layout, is set to ‘No’ by default, and is not editable when ‘Is Announcement for Direct Grant?’ is set to ‘Yes’ and the Budget Type is Lump Sum
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creat_Second_Module_LS_DG" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "N/A" into field "Allocationlevel__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Formula_Edition_LS_DG_Yes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    #535996
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "No"
    #535998
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    #535996
    Then I softly see that "Is Detailed Budget Required on the Subaward?" rendered in view mode only
    #535998
    Then I softly see that "Budgeting is Required for:" rendered in view mode only
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    #536000
    Then I softly do not see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly do not see "Review Steps" page block displayed
    When I navigate to "Responsibilities" sub tab
    #536001
    Then I softly do not see "FDM" in flex table header "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Testing" into field "AnnouncementDescription__c"
    And I enter value "Yes" into field "NYSED_FARequiredForAmendment__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #536000
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Responsibilities" sub tab
    #536001
    Then I softly do not see "FDM" in flex table header "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside table
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    #536001
    Then I softly do not see "FDM" in flex table header "---announcement:-:approversTableId---"

    Examples:
      | UserType | PeerReviewer  | Reviewer |
      | PM       | Automation PO | PO       |
#      | PO       | Automation PM | PM       |
#      | FO       | Automation FD | FD       |
#      | FD       | Automation FO | FO       |

  @540945-Created @NYSEDSprint-16 @US-540397 @M04
  Scenario Outline:Verify that on the Associate Funding Accounts modal, the FD user sees all funding accounts where the Cert level is 0 and the GSPS flag at the related funding source is set to Yes. - Formula (BAFA) Announcement
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "0" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:FundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    #540945
    Then I softly see value "$0" for title "Total Obligation" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    Then I softly see value "$0" for title "Available Balance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "{SavedValue:FundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    #540945
    Then I softly see value "{SavedValue:FundingAccountID}" for title "Funding Account" against the value "{SavedValue:FundingAccountTitle}" inside table "---announcement:-:fundingAccountsTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "0" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "StateFundingAccountID"
    And I save the field labeled "Funding Source" as "StateFUNDINGSOURCE"
    And I save the field labeled "Title" as "StateFundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:StateFundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    #540945
    Then I softly see value "$0" for title "Total Obligation" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    Then I softly see value "$0" for title "Available Balance" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "{SavedValue:StateFundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    #540945
    Then I softly see value "{SavedValue:StateFundingAccountID}" for title "Funding Account" against the value "{SavedValue:StateFundingAccountTitle}" inside table "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
      | PM       | PO           | {SavedValue:PO Username} |

  @540943 @NYSEDSprint-16 @US-540397 @M04
  Scenario Outline:Verify that on the Associate Funding Accounts modal, the FD user cannot see the funding accounts where the Cert level is 0 and the GSPS flag at the related funding source is set to No.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "0" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Overview" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:FundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    #540943
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "No" into field "NYSED_GSPS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "0" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "StateFundingAccountID"
    And I save the field labeled "Funding Source" as "StateFUNDINGSOURCE"
    And I save the field labeled "Title" as "StateFundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:StateFundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    #540943
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:fundingAccTableId---"

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
      | PM       | PO           | {SavedValue:PO Username} |

  @541337-Created @NYSEDSprint-16 @US-540397 @M04
  Scenario Outline:Verify that on the Associate Funding Accounts modal, the FD user can see the funding accounts where the Cert level is available and the GSPS flag at the related funding source is set to No.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "10000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:FundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    #541337
    Then I softly see value "$0" for title "Total Obligation" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    Then I softly see value "$10,000" for title "Available Balance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "{SavedValue:FundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    #541337
    Then I softly see value "{SavedValue:FundingAccountID}" for title "Funding Account" against the value "{SavedValue:FundingAccountTitle}" inside table "---announcement:-:fundingAccountsTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "No" into field "NYSED_GSPS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "StateFundingAccountID"
    And I save the field labeled "Funding Source" as "StateFUNDINGSOURCE"
    And I save the field labeled "Title" as "StateFundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:StateFundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    #541337
    Then I softly see value "$0" for title "Total Obligation" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    Then I softly see value "$10,000" for title "Available Balance" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "{SavedValue:StateFundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    #541337
    Then I softly see value "{SavedValue:StateFundingAccountID}" for title "Funding Account" against the value "{SavedValue:StateFundingAccountTitle}" inside table "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
      | PM       | PO           | {SavedValue:PO Username} |

  @540992 @NYSEDSprint-16 @US-540520 @M04
  Scenario Outline:Verify that for a formula (by applicant and focus area) announcement where 'Is Announcement for Direct Grant?' is set to No, the announcement owner sees only organizations with institution IDs on the Add Organizations modal.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "No" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantNo" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "Public School Districts" into field "EligibleApplicantTypes__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "---announcement:-:addOrganizationByAppFocusAreaTableId---" panel
    #540992
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
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
    Then I softly see field "Institution ID" as "166,485,411,254"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I pause execution for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    #540992
    Then I softly see value "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" for title "Applicants" against the value "CACP139" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"

    Examples:
      | UserType |
      | PM       |

  @537640 @537643 @537589 @537590 @537626 @537585 @NYSEDSprint-14 @US-534834 @M04
  Scenario Outline:Verify that the Announcement Owner should see validation Reviewers are not required for optional panels
  |Verify that the Announcement Owner should see validation For required panel the Minimum Number of Reviews should be greater than zero. and 'Minimum Number of Reviews per Application' field is required|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Setup" sub tab
    #537585
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementReviewPanel---" :
      |        | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | extend | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | extend | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
    And I expand nested table containing column value "Program Office Review"
    #537626
    Then I softly do not see "Reviewers" page block displayed
    Then I softly see "Review Forms" page block displayed
    Then I softly see "Review Steps" page block displayed
    #537589
    Then I see the following rows under the following headers in table with id "---announcement:-:annReviewFormsTableId---" :
      | Actions     | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Group 2   | 0.00%           | 0                                         | False     | Yes                    |
      | Action menu | Group 1   | 0.00%           | 0                                         | False     | Yes                    |
    And I collapse nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "New" :
      | Step Order | Step Name    | Description | Step Weight (%) |
      | 3          | Dummy review | description | 20              |
    And I expand nested table containing column value "Dummy review"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "New" :
      | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review | 100.00%         | 1                                         | Checked   | Yes                    |
    Given I edit the following rows inline in flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "Edit" :
      | Form Name            | Required? |
      | Dummy Program Review | Unchecked |
    #537640
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    And I collapse nested table containing column value "Dummy review"
    And I expand nested table containing column value "Dummy review"
    Given I edit the following rows inline in flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "Edit" :
      | Form Name            | Minimum Number of Reviews per Application |
      | Dummy Program Review | 0                                         |
    #537643
    Then I softly see the following messages in the page details contains:
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    And I collapse nested table containing column value "Dummy review"
    And I expand nested table containing column value "Dummy review"
    Given I edit the following rows inline in flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "Edit" :
      | Form Name            | Minimum Number of Reviews per Application |
      | Dummy Program Review |                                           |
    #537643
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I collapse nested table containing column value "Dummy review"
    And I expand nested table containing column value "Grants Finance Review"
    #537626
    Then I softly do not see "Reviewers" page block displayed
    Then I softly see "Review Forms" page block displayed
    Then I softly see "Review Steps" page block displayed
    #537590
    Then I see the following rows under the following headers in table with id "---announcement:-:annReviewFormsTableId---" :
      | Actions     | Form Name                 | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Grant Finance Review Form | 100.00%         | 1                                         | True      | Yes                    |

    Examples:
      | UserType | PeerReviewer  | Reviewer |
      | PM       | Automation PO | PO       |
#      | PO       | Automation PM | PM       |
#      | FO       | Automation FD | FD       |
#      | FD       | Automation FO | FO       |

  @537630 @537631 @537634 @537639 @537633 @537637 @NYSEDSprint-14 @US-534834 @M04
  Scenario Outline:Verify that the Announcement Owner should be able to create, edit and delete, details in review step table for Program Office Review step, in the states- Created, Submitted for Review, Reviewed, Under Revision state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Setup" sub tab
    #537630
    Then I softly can see row level action button "Edit" against "Program Office Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly can see row level action button "Delete" against "Program Office Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly can see row level action button "Edit" against "Grants Finance Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly can see row level action button "Delete" against "Grants Finance Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "New" :
      | Step Order | Step Name            | Description | Step Weight (%) |
      | 3          | Dummy Program review | description | 20              |
    And I click on "Review Form" icon for "Dummy Program review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewPanelTableId---" by clicking "New" :
      | Section Order | Section Header | Section Weight (%) |
      | 2             | Automation     | 100                |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header | Section Weight (%) |
      | Action menu | 2             | Automation     | 100%               |
    #537630
    Then I softly can see row level action button "Edit" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    Then I softly can see row level action button "Delete" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Order | Section Header |
      | 2             | Manual         |
    #537630
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header | Section Weight (%) |
      | Action menu | 2             | Manual         | 100%               |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "New" :
      | Step Order | Step Name          | Description | Step Weight (%) |
      | 3          | Dummy Grant review | description | 20              |
    And I click on "Review Form" icon for "Dummy Grant review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewPanelTableId---" by clicking "New" :
      | Section Order | Section Header | Section Weight (%) |
      | 2             | Automation     | 100                |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header | Section Weight (%) |
      | Action menu | 2             | Automation     | 100%               |
    #537631
    Then I softly can see row level action button "Edit" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    Then I softly can see row level action button "Delete" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Order | Section Header |
      | 2             | Manual         |
    #537631
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header | Section Weight (%) |
      | Action menu | 2             | Manual         | 100%               |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    #537639
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Program Office Review - Program Review: A score must be associated to at least one question in the Manual section because it is weighted |
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Grants Finance Review - Fiscal Review: A score must be associated to at least one question in the Manual section because it is weighted. |
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    And I click on "Review Form" icon for "Dummy Program review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    And I expand nested table containing column value "Manual"
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 1              | Program  | Written | 100       |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question | Type    | Max Score |
      | Action menu | 1              | Program  | Written | 100       |
    #537630
    Then I softly can see row level action button "Edit" against "Program" in flex table with id "---announcement:-:reviewPanelQuestionsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Question |
      | 1              | Section  |
    #537630
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question | Type    | Max Score |
      | Action menu | 1              | Section  | Written | 100       |
    And I collapse nested table containing column value "Manual"
    And I click on "Delete" icon for "Section" inside flex table with id "---announcement:-:reviewPanelQuestionsTableId---" without waiting for record
    And I click on "Delete" icon for "Manual" inside flex table with id "---announcement:-:reviewPanelTableId---" without waiting for record
    #537630
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:reviewPanelTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    And I click on "Review Form" icon for "Dummy Grant review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    And I expand nested table containing column value "Manual"
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 1              | Program  | Written | 100       |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question | Type    | Max Score |
      | Action menu | 1              | Program  | Written | 100       |
    #537631
    Then I softly can see row level action button "Edit" against "Program" in flex table with id "---announcement:-:reviewPanelQuestionsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Question |
      | 1              | Section  |
    #537631
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question | Type    | Max Score |
      | Action menu | 1              | Section  | Written | 100       |
    And I collapse nested table containing column value "Manual"
    And I click on "Delete" icon for "Section" inside flex table with id "---announcement:-:reviewPanelQuestionsTableId---" without waiting for record
    And I click on "Delete" icon for "Manual" inside flex table with id "---announcement:-:reviewPanelTableId---" without waiting for record
    #537631
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:reviewPanelTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    #537637
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Program Office Review - Program Review: At least one section must be added to this form. |
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Grants Finance Review - Fiscal Review: At least one section must be added to this form. |
    #537634
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Program Office Review: The total Review Form weight must equal 100% for a weighted step. It is currently 200.00%. |
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Grants Finance Review: The total Review Form weight must equal 100% for a weighted step. It is currently 140.00%. |
    And I refresh the page
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name             | Step Weight (%) |
      | Program Office Review | 60              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    #537633
    Then I softly see the following messages in the page details contains:
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 110.00%. |
    Given I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name             | Step Weight (%) |
      | Grants Finance Review | 70              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    #537633
    Then I softly see the following messages in the page details contains:
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 130.00%. |

    Examples:
      | UserType | PeerReviewer  | Reviewer |
      | PM       | Automation PO | PO       |
#      | PO       | Automation PM | PM       |
#      | FO       | Automation FD | FD       |
#      | FD       | Automation FO | FO       |

  @538467 @537638 @537641 @537635 @NYSEDSprint-14 @US-534834 @M04 @UpdateRequire
  Scenario Outline:Verify that the Announcement Owner can add the new review step on the Announcement layout -> Setup tab -> Under the Review Steps section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    #538467
    Then I softly can see top right button "New" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "New" :
      | Step Order | Step Name    | Description | Step Weight (%) |
      | 3          | Dummy review | description | 50              |
    #538467
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementReviewPanel---" :
      |        | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | extend | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | extend | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
      | extend | Action menu | 3          | Dummy review          | description                                      | 50.00%          | 0           |
    Then I softly can see row level action button "Edit" against "Dummy review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly can see row level action button "Delete" against "Dummy review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    #537635
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Dummy review: At least one form is required for this review step. |
    Given I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name    | Description       |
      | Dummy review | Dummy Description |
    #538467
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementReviewPanel---" :
      |        | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | extend | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | extend | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
      | extend | Action menu | 3          | Dummy review          | Dummy Description                                | 50.00%          | 0           |
    And I click on "Delete" icon for "Dummy review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    #538467
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Dummy review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "New" :
      | Step Order | Step Name            | Description | Step Weight (%) |
      | 3          | Dummy Program review | description | 20              |
    And I click on "Review Form" icon for "Dummy Program review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewPanelTableId---" by clicking "New" :
      | Section Order | Section Header | Section Weight (%) |
      | 2             | Automation     | 90                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:annReviewFormsTableId---" by clicking "New" :
      | Step Order | Step Name          | Description | Step Weight (%) |
      | 3          | Dummy Grant review | description | 20              |
    And I click on "Review Form" icon for "Dummy Grant review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewPanelTableId---" by clicking "New" :
      | Section Order | Section Header | Section Weight (%) |
      | 2             | Automation     | 80                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    #537638
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Program Office Review - Program Review: The total section weight must equal 100% or 0%. It is currently 190%. |
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Grants Finance Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 180%. |
    And I expand nested table containing column value "Program Office Review"
    And I click on "Review Form" icon for "Dummy Program review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Automation     | 100                |
    And I expand nested table containing column value "Automation"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 1              | Program  | Written | 100       |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    And I click on "Review Form" icon for "Dummy Grant review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Automation     | 100                |
    And I expand nested table containing column value "Automation"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question      | Type    | Max Score |
      | 1              | Grant Finance | Written | 100       |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<NonAnnouncementOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    #537641
    Then I softly cannot see row level action button "Edit" against "Program Office Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly cannot see row level action button "Delete" against "Program Office Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly cannot see row level action button "Edit" against "Grants Finance Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly cannot see row level action button "Delete" against "Grants Finance Review" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    And I expand nested table containing column value "Program Office Review"
    #537641
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Dummy Program review" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I softly cannot see row level action button "Delete" against "Dummy Program review" in flex table with id "---announcement:-:annReviewFormsTableId---"
    And I click on "Review Form" icon for "Dummy Program review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:reviewPanelTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    And I expand nested table containing column value "Automation"
    Then I softly cannot see row level action button "Edit" against "Program" in flex table with id "---announcement:-:reviewPanelQuestionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Program" in flex table with id "---announcement:-:reviewPanelQuestionsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    #537641
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Dummy Grant review" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I softly cannot see row level action button "Delete" against "Dummy Grant review" in flex table with id "---announcement:-:annReviewFormsTableId---"
    And I click on "Review Form" icon for "Dummy Grant review" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:reviewPanelTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation" in flex table with id "---announcement:-:reviewPanelTableId---"
    And I expand nested table containing column value "Automation"
    Then I softly cannot see row level action button "Edit" against "Grant Finance" in flex table with id "---announcement:-:reviewPanelQuestionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Grant Finance" in flex table with id "---announcement:-:reviewPanelQuestionsTableId---"

    Examples:
      | UserType | NonAnnouncementOwner |
      | PM       | EXE                  |
#      | PO       | PM                   |
#      | FO       | PO                   |
#      | FD       | FO                   |
#      | EXE      | FD                   |

  @538026 @537659 @537686 @537677 @537665 @537667 @538035 @NYSEDSprint-14 @US-524040 @M04
  Scenario Outline:Verify that the Peer Reviewer with Edit access Yes can add, edit and removed the Coordinators in the 'Coordinators' table. Grant Finance Review
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    And I click on "Submit For Approval" in the page details
    #537686
    Then I softly see the following messages in the page details contains:
      | Setup Tab - At least one Coordinator should be added for each review step. |
    And I expand nested table containing column value "Program Office Review"
    #537659
    Then I softly do not see "Reviewers" page block displayed
    Then I softly see "Coordinators" page block displayed
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name           |
      | Program Coordinator | Automation EXE |
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name           | Role                |
      | Action menu | Automation EXE | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                |
      | {SavedValue:EXE Username} | Program Coordinator |
    #537677
    Then I softly see the following messages in the page details contains:
      | The same user cannot be added twice as a coordinator. |
    And I collapse nested table containing column value "Program Office Review"
    And I click on "Submit For Approval" in the page details
    #537686
    Then I softly see the following messages in the page details contains:
      | Setup Tab - At least one Coordinator should be added for each review step. |
    And I refresh the page
    And I wait for "3" seconds
    And I expand nested table containing column value "Grants Finance Review"
    #537659
    Then I softly do not see "Reviewers" page block displayed
    Then I softly see "Coordinators" page block displayed
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
    #537665
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:CoordinatorsTableId---"
    Then I softly can see row level action button "Edit" against "Automation PO" in flex table with id "---announcement:-:CoordinatorsTableId---"
    Then I softly can see row level action button "Remove" against "Automation PO" in flex table with id "---announcement:-:CoordinatorsTableId---"
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                       | Name          |
      | Grants Finance Coordinator | Automation PM |
    #537665
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name          | Role                       |
      | Action menu | Automation PM | Grants Finance Coordinator |
    When I click on "Remove" icon for "Automation PM" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    #537665
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    Then I softly do not see value "Automation PM" for title "Name" inside table "---announcement:-:CoordinatorsTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I click on "Submit For Approval" in the page details
    #537686
    Then I softly cannot see the following messages in the page details contains:
      | Setup Tab - At least one Coordinator should be added for each review step. |

    Examples:
      | UserType | PeerReviewer  | Reviewer |
      | PM       | Automation PO | PO       |
#      | PO       | Automation PM | PM       |
#      | FO       | Automation FD | FD       |
#      | FD       | Automation FO | FO       |

  @537680 @537691 @537674 @537667 @537666 @537684 @US-524040 @M04
  Scenario Outline:Verify that the Announcement Owner can see the required 'Role' picklist field, in the 'Coordinators' table.: Program Office Review
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    #537680
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:CoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role     |
      | {SavedValue:PM Username} | --None-- |
    #537680
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    #537680 #537666 #537684
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name          | Role                |
      | Action menu | Automation PM | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    #537674 #537667
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:CoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role     |
      | {SavedValue:PM Username} | --None-- |
    #537674
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    #537674 #537667 #537684
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name          | Role                       |
      | Action menu | Automation PM | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PO Username} | Program Coordinator |
    #537666 #537684
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name          | Role                |
      | Action menu | Automation PO | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
    #537667 #537684
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name          | Role                       |
      | Action menu | Automation PO | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I click on "Remove" icon for "Automation PO" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    When I click on "Remove" icon for "Automation PM" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    #537691
    Then I softly see the following messages in the page details contains:
      | All coordinators for the review step cannot be removed, add another user as a coordinator before removing the existing one. |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I click on "Remove" icon for "Automation PO" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    When I click on "Remove" icon for "Automation PM" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    #537691
    Then I softly see the following messages in the page details contains:
      | All coordinators for the review step cannot be removed, add another user as a coordinator before removing the existing one. |
    And I collapse nested table containing column value "Grants Finance Review"
    And I click on "Publish" in the page details
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    #537680
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:CoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role     |
      | {SavedValue:PO Username} | --None-- |
    #537680
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PO Username} | Program Coordinator |
    #537680 #537666 #537684
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name          | Role                |
      | Action menu | Automation PO | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    #537674
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:CoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role     |
      | {SavedValue:PO Username} | --None-- |
    #537674
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
    #537674 #537667 #537684
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name          | Role                       |
      | Action menu | Automation PO | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Program Office Review"
    When I click on "Remove" icon for "Automation PO" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    When I click on "Remove" icon for "Automation PM" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    #537691
    Then I softly see the following messages in the page details contains:
      | All coordinators for the review step cannot be removed, add another user as a coordinator before removing the existing one. |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I click on "Remove" icon for "Automation PO" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    When I click on "Remove" icon for "Automation PM" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    #537691
    Then I softly see the following messages in the page details contains:
      | All coordinators for the review step cannot be removed, add another user as a coordinator before removing the existing one. |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @537691-closed @US-524040 @M04
  Scenario Outline:Verify that the Announcement Owner see the below validation on remove action if only one coordinator is added at the review step in the 'Coordinators' table.: Grants Finance Review
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "2" seconds
    When I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PO Username} | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I click on "Remove" icon for "Automation PO" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    When I click on "Remove" icon for "Automation PM" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    #537691
    Then I softly see the following messages in the page details contains:
      | All coordinators for the review step cannot be removed, add another user as a coordinator before removing the existing one. |
    And I expand nested table containing column value "Grants Finance Review"
    When I click on "Remove" icon for "Automation PO" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    When I click on "Remove" icon for "Automation PM" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    #537691
    Then I softly see the following messages in the page details contains:
      | All coordinators for the review step cannot be removed, add another user as a coordinator before removing the existing one. |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @538027 @536457 @NYSEDSprint-13 @US-535230 @NYSEDSprint-14 @US-524040 @M04 @UpdateRequire
  Scenario Outline:Verify that the Peer Reviewer with Edit access No cannot add, edit and removed the Coordinators in the 'Coordinators' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementReviewPanel---" :
      |        | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | extend | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | extend | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
    And I expand nested table containing column value "Program Office Review"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:annReviewFormsTableId---" :
      | Actions     | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Group 2   | 0.00%           | 0                                         | False     | Yes                    |
      | Action menu | Group 1   | 0.00%           | 0                                         | False     | Yes                    |
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                |
      | {SavedValue:EXE Username} | Program Coordinator |
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name           |
      | Program Coordinator | Automation EXE |
    And I click on "Review Form" icon for "Group 2" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header                                   | Section Weight (%) |
      | Action menu | 1             | General Preparation                              | 0%                 |
      | Action menu | 2             | Assurances & Consultation                        | 0%                 |
      | Action menu | 3             | Intent to Apply                                  | 0%                 |
      | Action menu | 4             | Title I, Part A – Fiscal Information             | 0%                 |
      | Action menu | 5             | Title I, Part A – LEA Reserves                   | 0%                 |
      | Action menu | 6             | Title I, Part A – Distribution of Funds          | 0%                 |
      | Action menu | 7             | Title I, Part A – Neglected Facilities           | 0%                 |
      | Action menu | 8             | Title I, Part D – Program/Fiscal Information     | 0%                 |
      | Action menu | 9             | Title II, IV, and V – Program/Fiscal Information | 0%                 |
      | Action menu | 10            | Equitable Services                               | 0%                 |
    And I click on page navigation arrow "---announcement:-:reviewPanelTableId---" for table id "Next"
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header         | Section Weight (%) |
      | Action menu | 11            | Budgets and Narratives | 0%                 |
      | Action menu | 12            | Overall Score          | 100%               |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Review Form" icon for "Group 1" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header                                | Section Weight (%) |
      | Action menu | 1             | General Preparation                           | 0%                 |
      | Action menu | 2             | Assurances & Consultation                     | 0%                 |
      | Action menu | 3             | Intent to Apply                               | 0%                 |
      | Action menu | 4             | Title I, Part A – Program Information         | 0%                 |
      | Action menu | 5             | Title I, Part A – Fiscal Information          | 0%                 |
      | Action menu | 6             | Title I, Part A – LEA Reserves                | 0%                 |
      | Action menu | 7             | Title I, Part A – Distribution of Funds       | 0%                 |
      | Action menu | 8             | Title I, Part A – Neglected Facilities        | 0%                 |
      | Action menu | 9             | Title I, Part D – Program/Fiscal Information  | 0%                 |
      | Action menu | 10            | Title II, Part A – Program/Fiscal Information | 0%                 |
    And I click on page navigation arrow "---announcement:-:reviewPanelTableId---" for table id "Next"
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header                                | Section Weight (%) |
      | Action menu | 11            | Title IV, Part A – Program/Fiscal Information | 0%                 |
      | Action menu | 12            | Title V RLIS – Program/Fiscal Information     | 0%                 |
      | Action menu | 13            | Equitable Services                            | 0%                 |
      | Action menu | 14            | Budgets and Narratives                        | 0%                 |
      | Action menu | 15            | Overall Score                                 | 100%               |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:annReviewFormsTableId---" :
      | Actions     | Form Name                 | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Grant Finance Review Form | 100.00%         | 1                                         | True      | Yes                    |
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                       | Name          |
      | Grants Finance Coordinator | Automation PM |
    And I click on "Review Form" icon for "Grant Finance Review Form" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header     | Section Weight (%) |
      | Action menu | 1             | Application Review | 0%                 |
      | Action menu | 2             | Overall Score      | 100%               |
    And I expand nested table containing column value "Application Review"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question                                                    | Type   | Max Score |
      | Action menu | 1              | Is the grants finance review complete for this application? | Yes/No | 10        |
    And I collapse nested table containing column value "Application Review"
    And I expand nested table containing column value "Overall Score"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question                   | Type    | Max Score |
      | Action menu | 1              | Additional inputs (if any) | Written | 100       |

    Examples:
      | UserType | PeerReviewer  | Reviewer |
      | PM       | Automation PO | PO       |
#      | PO       | Automation PM | PM       |
#      | FO       | Automation FD | FD       |
#      | FD       | Automation FO | FO       |

  @538051 @538738 @538024 @538033 @538035 @538031 @538023 @538028 @539257 @NYSEDSprint-14 @US-536067 @NYSEDSprint-15 @US-537967 @M04 @Bug-Ticket-545058
  Scenario Outline:Verify that the Peer Reviewer with Edit access Yes can add, edit and remove the Coordinators in the 'Coordinators' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    #539257
    Then I softly do not see "Business Forms" page block displayed
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role |
      | Automation PO |      |
    #538035 #538031
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "3" seconds
    #538023
    Then I see only the following ordered page blocks :
      | Peer Reviewers |
      | Coordinators   |
      | Approvers      |
      | Owner          |
    #538024
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PO | Program Coordinator |
    #538024 #538023 #538028 #538031
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementCoordinatorsTableId---" :
      | Actions     | # | Name          | Role                |
      | Action menu | 1 | Automation PO | Program Coordinator |
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PO | Program Coordinator |
    #538033
    Then I softly see the following messages in the page details contains:
      | The same user cannot be added twice as a coordinator. |
    And I refresh the page
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Edit" :
      | # | Name           |
      | 1 | Automation EXE |
    #538028
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementCoordinatorsTableId---" :
      | Actions     | # | Name           | Role                |
      | Action menu | 1 | Automation EXE | Program Coordinator |
    And I click on "Remove" icon for "Program Coordinator" inside flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PO | Program Coordinator |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<NonAnnouncementOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    #538738
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Coordinator" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    Then I softly cannot see row level action button "Remove" against "Program Coordinator" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    Then I softly can see row level action button "No Actions Available" against "Program Coordinator" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #539257
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<ReviewerUser>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "3" seconds
    #538023
    Then I see only the following ordered page blocks :
      | Peer Reviewers |
      | Coordinators   |
      | Approvers      |
      | Owner          |
    #538024
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name            | Role                       |
      | Automation EXE1 | Grants Finance Coordinator |
    #538023 #538028 #538031
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementCoordinatorsTableId---" :
      | Actions     | # | Name            | Role                       |
      | Action menu | 1 | Automation EXE1 | Grants Finance Coordinator |
    Then I softly can see row level action button "Edit" against "Automation EXE1" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    Then I softly can see row level action button "Remove" against "Automation EXE1" in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name            | Role                       |
      | Automation EXE1 | Grants Finance Coordinator |
    #538033
    Then I softly see the following messages in the page details contains:
      | The same user cannot be added twice as a coordinator. |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role |
      | Automation PO |      |
    #538035 #538031
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name           | Role                |
      | Automation EXE | Program Coordinator |
    And I click on "Remove" icon for "Program Coordinator" inside flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" without waiting for record
    #538028
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | UserType | ReviewerUser | Reviewer                 | NonAnnouncementOwner |
      | PM       | PO           | {SavedValue:PO Username} | EXE                  |
#      | PO       | EXE          | {SavedValue:EXE Username} | PM                   |
#      | FO       | PO           | {SavedValue:PO Username}  | PO                   |
#      | FD       | PO           | {SavedValue:PO Username}  | FO                   |

  @538055 @538039 @NYSEDSprint-14 @US-536067 @M04
  Scenario Outline:Verify that the Peer Reviewer with Edit access No cannot add, edit and remove the Coordinators in the 'Coordinators' table.
  |Verify that the Announcement Owner see the below validation on Submit for Approval, if the coordinator is not added in the 'Coordinators' table.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #538039
    Then I softly see the following messages in the page details contains:
      | Responsibilities tab - At least one Program Coordinator and one Grant Finance Coordinator should be added to submit announcement for approval. |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #538039
    Then I softly see the following messages in the page details contains:
      | Responsibilities tab - At least one Program Coordinator and one Grant Finance Coordinator should be added to submit announcement for approval. |
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Edit" :
      | # | Role                |
      | 1 | Program Coordinator |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #538039
    Then I softly see the following messages in the page details contains:
      | Responsibilities tab - At least one Program Coordinator and one Grant Finance Coordinator should be added to submit announcement for approval. |

    Examples:
      | UserType | ReviewerUser | Reviewer                 | NonAnnouncementOwner |
      | PM       | PO           | {SavedValue:PO Username} | EXE                  |
#      | PO       | EXE          | {SavedValue:EXE Username} | PM                   |
#      | FO       | PO           | {SavedValue:PO Username}  | PO                   |
#      | FD       | PO           | {SavedValue:PO Username}  | FO                   |

  @538079 @NYSEDSprint-14 @US-535399 @M04
  Scenario Outline:Verify that the Announcement Owner see a Grant Abbreviation field is required to save on the Announcement layout->Overview tab->Announcement Specific Settings section.: Formula: By Applicant and Focus Area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    #538079
    Then I softly see the following messages in the page details contains:
      | To Save, Grant Abbreviation is required in the Overview tab under the Announcement Specific Settings section. |
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #538079
    Then I softly see field "Grant Abbreviation" as "GA"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @541218 @541219 @541770 @541222 @541765 @541806 @541784 @541785 @541223 @541794 @541801 @541778 @541799 @NYSEDSprint-16 @US-538011 @M04
  Scenario Outline:Verify that the Announcement Owner see on the Announcement layout -> Setup tab, a new section FDM Review Step is added after Review Step.
  |Verify that the Announcement Owner see on the Announcement layout -> Setup tab -> FDM Review Step section, Review Forms child table is not added unlike other application review steps.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #541799
    Then I softly see the following messages in the page details contains:
      | Setup Tab - At least one Coordinator should be added for each review step. |
    When I navigate to "Setup" sub tab
    And I wait for "3" seconds
    #541218
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist    |
      | Review Steps                      |
      | FDM Review Step                   |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
    #541765
    Then I see the following rows under the following headers in table with id "---announcement:-:FDMReviewStepTableId---" :
      | Step Order | Step Name             | Description           | Step Weight (%) | # of Panels |
      | 3          | Funding Decision Memo | Funding Decision Memo | 0.00%           | 0           |
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role     |
      | {SavedValue:FO Username} | --None-- |
    #541785 #541778
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "3" seconds
    #541219 #541770
    Then I softly see "Coordinators" page block displayed
    Then I softly do not see "Review Forms" page block displayed
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:FO Username} | Program Coordinator |
    #541222 #541785 #541778
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:FDMReviewStepTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name                     | Role                |
      | Action menu | {SavedValue:FO Username} | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:FO Username} | Program Coordinator |
    #541784
    Then I softly see the following messages in the page details contains:
      | The same user cannot be added twice as a coordinator. |
    And I refresh the page
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Edit" :
      | Role                | Name                     |
      | Program Coordinator | {SavedValue:PO Username} |
    #541223 #541778
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name                     | Role                |
      | Action menu | {SavedValue:PO Username} | Program Coordinator |
    And I click on "Remove" icon for "{SavedValue:PO Username}" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    And I wait for "2" seconds
    #541223
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:FD Username} | Program Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #541799
    Then I softly see the following messages in the page details contains:
      | Setup Tab - At least one Coordinator should be added for each review step. |
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "2" seconds
    #541799
    Then I softly cannot see the following messages in the page details contains:
      | Setup Tab - At least one Coordinator should be added for each review step. |
    And I refresh the page
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                       | Role                |
      | {SavedValue:EXE1 Username} | Program Coordinator |
    #541806 #541778
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name                       | Role                |
      | Action menu | {SavedValue:EXE1 Username} | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    #541801 #541778
    Then I see the following rows under the following headers in table with id "---announcement:-:CoordinatorsTableId---" :
      | Actions     | Name                     | Role                |
      | Action menu | {SavedValue:PM Username} | Program Coordinator |
    And I click on "Remove" icon for "{SavedValue:PM Username}" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    And I wait for "2" seconds
    #541801
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Remove" icon for "{SavedValue:FD Username}" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    And I wait for "2" seconds
    #541801
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Remove" icon for "{SavedValue:EXE1 Username}" inside flex table with id "---announcement:-:CoordinatorsTableId---" without waiting for record
    And I wait for "2" seconds
    #541801
    Then I softly see the following messages in the page details contains:
      | All coordinators for the review step cannot be removed, add another user as a coordinator before removing the existing one. |
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"

    Examples:
      | UserType | PeerReviewer  | Reviewer |
      | PM       | Automation PO | PO       |
#      | PO       | Automation PM | PM       |
#      | FO       | Automation FD | FD       |
#      | FD       | Automation FO | FO       |

  @NYSED-1092 @US-NYSED-929 @M04
  Scenario Outline:Verify with the Program Owner that if the 'Key Contact' check box is not selected for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for Formula announcement - By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Unchecked      |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Unchecked      |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1092##
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Unchecked      |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I perform quick search for "{SavedValue:FD1 Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD1 Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:FD Username} | Program Contact |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:FD1 Username} | Fiscal Contact |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:FD1 Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Unchecked      |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:FD1 Username} | Unchecked      |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |

    Examples:
      | UserType |
      | PO       |
#      | PM       |
#      | FO       |
#      | FD       |

  @NYSED-1097 @NYSED-1182 @NYSED-2474 @NYSED-2483 @US-NYSED-929 @US-NYSED-928 @NYSED-2248 @NYSEDSprint-24 @M04 @M04
  Scenario Outline:Verify with the announcement Owner if only one key contact check box is selected for 'Program Contact' &'Fiscal Contact' roles, then OnClick Submit for approval allows to move forward successfully-Formula Announcement - By Applicant by Focus Area.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I click on "Update Details" in the page details
    When I enter in modal value "-1" into field "Bud_Stop__c"
    When I click modal button "Save"
    #NYSED-2474
    Then I softly see the following messages in the page details contains:
      | Bud Stop date cannot be set to a past date. |
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "-1" into field "Pay_Stop__c"
    When I click modal button "Save"
    #NYSED-2483
    Then I softly see the following messages in the page details contains:
      | Pay Stop date cannot be set to a past date. |
    When I enter in modal value "11" into field "Pay_Stop__c"
    When I click modal button "Save"
    #NYSED-2474
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    #NYSED-2483
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+11}"
    And I click modal button "Close"
    And I navigate to "Overview" sub tab
    #NYSED-2474
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    #NYSED-2483
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+11}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
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
    #NYSED-1097
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I navigate to "Financials" sub tab
    #NYSED-1182
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    When I hovering mouse on page block help text icon inside table "---announcement:-:fundingAccountsTableId---" for LWC
    Then I softly see the text containing :
      | This is the current balance of Pre - encumbrance after subtracting Outstanding Encumbrance Balance |

    Examples:
      | UserType |
      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @545615 @NYSED-1179 @NYSED-1172 @NYSEDSprint-19 @US-541722 @US-NYSED-928 @NYSEDSprint-21 @M04 @state @skipOnJenkins
  Scenario: Verify that the Federal Funding account is in closed state, and the FD user can see the 'Activate' button when the Liq Date has not passed.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "{Date:M/d/yyyy::d+50}" into field "NYSED_ExpDate__c"
    And I enter value "Yes" into field "NYSED_GAPE__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Exp Date" as "{Date:M/d/yyyy::d+50}"
    And I save the field labeled "EGMS ID" as "StateFundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCESTATE"
    And I save the field labeled "Title" as "StateFundingAccountTitle"
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "--None--" into field "NYSED_RD__c"
    When I enter value "No" into field "NYSED_GSPS__c"
    When I enter value "test" into field "ProgramCode__c"
    When I enter value "Automation" into field "PCA__c"
    When I enter value "manual" into field "OrgCode__c"
    When I enter value "Yes" into field "NYSED_RD__c"
    When I enter value "Funding" into field "OrgCode__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "StartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "EndDate__c"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "{Date:M/d/yyyy::d+50}" into field "NYSED_LiqDate__c"
    When I enter value "Yes" into field "NYSED_GAPE__c"
    When I click on "Save" in the page details
    Then I softly see field "Liq Date" as "{Date:M/d/yyyy::d+50}"
    And I save the field labeled "EGMS ID" as "FederalFundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCEFEDERAL"
    And I save the field labeled "Title" as "FederalFundingAccountTitle"
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:StateFundingAccountID}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Fund Year" as "FundYear" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1179 #NYSED-1172
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Cannot submit for approval as associated funding account(s) for Fund Year {SavedValue:FundYear} are deactivated. |
    And I click on "Remove" icon for "{SavedValue:FundYear}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:FederalFundingAccountID}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Fund Year" as "FundYear1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1179 #NYSED-1172
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Cannot submit for approval as associated funding account(s) for Fund Year {SavedValue:FundYear1} are deactivated. |
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCESTATE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCESTATE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "View" icon for "{SavedValue:StateFundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    #545615
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    #545615
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

  @NYSED-1174 @NYSED-1173 @NYSEDSprint-21 @US-NYSED-928 @M04
  Scenario:Verify that the FD user sees the Pre-Encumbrance and Available Balance amounts correctly populated with proper calculations on the funding account related to the GSPS funding source when the announcement is approved. - Negative Value
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "0" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "{Date:M/d/yyyy::d+50}" into field "NYSED_ExpDate__c"
    And I enter value "0" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Exp Date" as "{Date:M/d/yyyy::d+50}"
    And I save the field labeled "EGMS ID" as "StateFundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCESTATE"
    And I save the field labeled "Title" as "StateFundingAccountTitle"
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:FundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account               | Pre-Encumbrance |
      | {SavedValue:FundingAccountID} | 1000            |
    And I wait for "2" seconds
    #NYSED-1173
    Then I softly cannot see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    #NYSED-1174 #NYSED-1173
    Then I softly see value "$0" for title "Cert Level" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$1,000" for title "Pre-Encumbrance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "($1,000)" for title "Available Balance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:StateFundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:StateFundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | {SavedValue:StateFundingAccountID} | 1000            |
    And I wait for "2" seconds
    #NYSED-1173
    Then I softly cannot see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    #NYSED-1174 #NYSED-1173
    Then I softly see value "$0" for title "Cert Level" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$1,000" for title "Pre-Encumbrance" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "($1,000)" for title "Available Balance" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1174
    Then I softly see field "Cert Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$1,000"
    Then I softly see field "Available Balance" as "($1,000)"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:StateFundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:StateFundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1174
    Then I softly see field "Cert Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$1,000"
    Then I softly see field "Available Balance" as "($1,000)"

  @NYSED-1175 @NYSEDSprint-21 @US-NYSED-928 @M04
  Scenario:Verify that the FD user sees the Pre-Encumbrance and Available Balance amounts correctly populated with proper calculations on the funding account related to the GSPS funding source when the announcement is approved. - Positive value
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "2000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "{Date:M/d/yyyy::d+50}" into field "NYSED_ExpDate__c"
    And I enter value "3000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Exp Date" as "{Date:M/d/yyyy::d+50}"
    And I save the field labeled "EGMS ID" as "StateFundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCESTATE"
    And I save the field labeled "Title" as "StateFundingAccountTitle"
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:FundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account               | Pre-Encumbrance |
      | {SavedValue:FundingAccountID} | 1000            |
    And I wait for "2" seconds
    ##NYSED-1175
    Then I softly see value "$2,000" for title "Cert Level" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$1,000" for title "Pre-Encumbrance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$1,000" for title "Available Balance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:StateFundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:StateFundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | {SavedValue:StateFundingAccountID} | 2000            |
    And I wait for "2" seconds
    ##NYSED-1175
    Then I softly see value "$3,000" for title "Cert Level" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$2,000" for title "Pre-Encumbrance" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$1,000" for title "Available Balance" against the value "{SavedValue:StateFundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1175
    Then I softly see field "Cert Level" as "$2,000"
    Then I softly see field "Pre-Encumbrance" as "$1,000"
    Then I softly see field "Available Balance" as "$1,000"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:StateFundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:StateFundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1175
    Then I softly see field "Cert Level" as "$3,000"
    Then I softly see field "Pre-Encumbrance" as "$2,000"
    Then I softly see field "Available Balance" as "$1,000"

  @NYSED-1177 @NYSED-1178 @NYSEDSprint-21 @US-NYSED-928 @M04 @skipOnJenkins
  Scenario:Verify that the Announcement Owner sees the validation message after clicking the Submit for Approval button when the associated state funding account has expired (i.e., the funding account is deactivated).: Direct Grant Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:AutomationPermanentStateFAExpired}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:AutomationPermanentStateFAExpired}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                                | Pre-Encumbrance |
      | {SavedValue:AutomationPermanentStateFAExpired} | 1000            |
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Fund Year" as "FundYear" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1177
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Cannot submit for approval as associated funding account(s) for Fund Year {SavedValue:FundYear} are deactivated. |
    And I wait for "2" seconds
    And I click on "Remove" icon for "{SavedValue:FundYear}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:AutomationPermanentFederalFALiquidated}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:AutomationPermanentFederalFALiquidated}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                                     | Pre-Encumbrance |
      | {SavedValue:AutomationPermanentFederalFALiquidated} | 1000            |
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Fund Year" as "FundYear1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1178
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Cannot submit for approval as associated funding account(s) for Fund Year {SavedValue:FundYear1} are deactivated. |

  @NYSED-1170 @NYSED-1171 @NYSEDSprint-21 @US-NYSED-928 @M04 @skipOnJenkins
  Scenario:Verify that the Announcement Owner sees the validation message after clicking the Submit for Approval button when the associated state funding account has expired (i.e., the funding account is deactivated).: Direct Grant Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:AutomationPermanentStateFAExpired}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:AutomationPermanentStateFAExpired}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                                | Pre-Encumbrance |
      | {SavedValue:AutomationPermanentStateFAExpired} | 1000            |
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Fund Year" as "FundYear" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1170
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Cannot submit for approval as associated funding account(s) for Fund Year {SavedValue:FundYear} are deactivated. |
    And I wait for "2" seconds
    And I click on "Remove" icon for "{SavedValue:FundYear}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:AutomationPermanentFederalFALiquidated}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                                     | Pre-Encumbrance |
      | {SavedValue:AutomationPermanentFederalFALiquidated} | 1000            |
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Fund Year" as "FundYear1" from flex table "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1171
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Cannot submit for approval as associated funding account(s) for Fund Year {SavedValue:FundYear1} are deactivated. |

  @NYSED-1646 @NYSED-1649 @NYSED-1850 @Sprint-05 @US-NYSED1233 @M04
  Scenario Outline: Verify with Announcement owner,Supporting Documents Checklist section -AppliesTo column unable to see options
  |Verify with announcement owner carry over supporting document data then in  announcement unable to see the mentioned options.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Setup" sub tab
    And I click on top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    And I click on "Edit" icon for "Application" inside flex table with id "---announcement:-:annChecklist---" without waiting for record
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Delete" icon for "Application" inside flex table with id "---announcement:-:annChecklist---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see the following headers in table with id "---announcement:-:approversTableId---" :
      | Actions | Name | Announcement | FDM | Award | Amendment Request | Payment Request | Monitoring |

    Examples:
      | UserType |
#      | FO       |
      | PM       |
#      | PO       |
#      | FD       |

  @NYSED-2018 @NYSED-2019 @NYSED-2035 @NYSED-2036 @Sprint-23 @US-NYSED1798 @M04
  Scenario Outline: Verify with the internal user, the Phase level "My Records" list filter is not visible in the Announcement  List filter for Announcement, Competitive, Directed, and Formula
    When I login to "As a Grantor" app as "<UserType>" user
    #NYSED-2018
    And I navigate to "Announcements" tab
    Then I softly see toggle option "Announcements - All" inside flex table id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I navigate to "Announcements" tab
    Then I softly cannot see toggle option "Announcements - My Records" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
     #NYSED-2036
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    Then I softly see toggle option "Formula Announcements - All" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    Then I softly cannot see toggle option "Formula Announcements - My Records" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    #NYSED-2035
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    Then I softly see toggle option "Directed Announcements - All" inside flex table id "---announcement:-:annoucementTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    Then I softly cannot see toggle option "Directed Announcements - My Records" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    #NYSED-2019
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I softly see toggle option "Competitive Announcements - All" inside flex table id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I softly cannot see toggle option "Competitive Announcements - My Records" inside flex table id "---announcement:-:formulaAnnouncementTableId---"

    Examples:
      | UserType |
      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @NYSED-2154 @NYSED-2155 @NYSED-2152 @NYSED-2153 @NYSEDSprint-22 @US-NYSED-1802 @defectID-2856
  Scenario Outline:Verify that the Announcement Owner can see that on the Announcement layout->Overview Tab->Announcement Specific settings->Advance payment allowed? field is non-editable.
  |Verify that the Announcement Owner can see that the 'Is a Detailed Budget Required on the Application?' field defaults to 'Yes' when the Budget Type is 'FS-10' and remains editable.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category    | Line Item Level, If Applicable |
      | Purchased Services | $50,000                        |
    #NYSED-2153
    Then I see field "Is a Detailed Budget Required on the Application?" as "Yes"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "No" into field "DetailedBudgetingRequired__c"
    And I click on "Save" in the page details
    Then I see field "Is a Detailed Budget Required on the Application?" as "No"
    When I navigate to "Overview" sub tab
    #NYSED-2154
    Then I see field "Advance Payment Allowed?" as "Yes"
    And I click on "Edit" in the page details
    Then I softly see field "Advance Payment Allowed?" is not editable
    #NYSED-2155
    And I clear the value from field "First_Payment__c"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{Savedvalue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 1000            |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |

    Examples:
      | UserType |
#      | FO       |
#      | PM       |
#      | PO       |
      | FD       |

  @NYSED-2156 @NYSED-2131 @NYSED-2222 @NYSED-2195 @NYSEDSprint-22 @US-NYSED-1816 @US-NYSED-1802 @US-NYSED-1836 @US-NYSED-1845 @defectID-2856
  Scenario Outline:Verify that the Announcement Owner can see that on the Announcement layout->Overview Tab->Announcement Specific settings->Advance payment allowed? field is non-editable.
  |Verify that the Announcement Owner can see that the 'Is a Detailed Budget Required on the Application?' field defaults to 'Yes' when the Budget Type is 'FS-10' and remains editable.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsAdvancePermitted__c"
    #NYSED-2195
    When I hovering mouse on help text icon inside page block detail "Year"
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition_FP_NO" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category    | Line Item Level, If Applicable |
      | Purchased Services | $50,000                        |
    Then I see field "Is a Detailed Budget Required on the Application?" as "Yes"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "No" into field "DetailedBudgetingRequired__c"
    And I click on "Save" in the page details
    Then I see field "Is a Detailed Budget Required on the Application?" as "No"
    When I navigate to "Overview" sub tab
    #NYSED-2154
    Then I see field "Advance Payment Allowed?" as "No"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see field "Advance Payment Allowed?" is not editable
    Then I softly do not see field "First Payment %" added after "Advance Payment Allowed?"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    #NYSED-2131
    When I navigate to "Responsibilities" sub tab
    Then I see only the following headers in table with id "---announcement:-:approversTableId---" :
      | Actions | Name | Announcement | FDM | Award | Amendment Request | Payment Request | Monitoring |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 1000            |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaInvitedApplicatsTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    #NYSED-2222
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    Then I softly see field "Maximum # Applications Allowed" is not editable
    When I click on "Save" in the page details
    Then I softly see field "Maximum # Applications Allowed" as "1"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. Leave blank if there is no limit." shown as help text
    #NYSED-2156
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |

    Examples:
      | UserType |
#      | FO       |
      | PM       |
#      | PO       |
#      | FD       |

  @NYSED-1095 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with Non profiles able to see the updated data in the contact section in read-only mode across all states For Formula - By Applicant.    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "5" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "View" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | FO       | PO           | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username}  | PM       | PM           | {SavedValue:PO Username} |
#      | FD       | {SavedValue:FD Username}  | PM       | PM           | {SavedValue:PO Username} |
#      | PO       | {SavedValue:PO Username}  | FO       | PO           | {SavedValue:PO Username} |
#      | EXE      | {SavedValue:EXE Username} | FO       | PO           | {SavedValue:PO Username} |

  @NYSED-1096 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with the Ann Owner if the 'Key Contact' check box is not selected/More than 1Contact for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for Formula announcement By Applicant By Focus Area    When I navigate to "Announcements" tab
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Project Role   | Is Key Contact |
      | Automation EXE | unchecked      |
      | Automation PM  | unchecked      |
    When I click on "Save" in the page details
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Fiscal" into field "LastName"
    And I generate the random EmailID and save as "FiscaluniqueEmailID"
    And I enter value "{SavedValue:FiscaluniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "Automation FO" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "Automation FO" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Project Role      | Is Key Contact |
      | Automation Fiscal | checked        |
    And I refresh the page
    And I wait for "3" seconds
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Project Role      | Is Key Contact |
      | Automation Fiscal | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |

  @NYSED-2157 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with the Ann Owner, For multiple Contacts of 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for Formula announcement By Applicant    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    Then I click on "Save" in the page details
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I navigate to "Overview" sub tab
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
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Fiscal" into field "LastName"
    And I generate the random EmailID and save as "FiscaluniqueEmailID"
    And I enter value "{SavedValue:FiscaluniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "Automation FO" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "Automation FO" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Fiscal Contact | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | checked        |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | unchecked      |
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |

  @NYSED-1069-closed @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that when Send Back is selected then again record get in created state and able to updated data in the contact section For Competitive announcement.    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Setup" sub tab
    When I navigate to "Overview" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation EXE" in flex table with id "---announcement:-:contactTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "View" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "View" against "Fiscal Contact" in flex table with id "---announcement:-:contactTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-1098 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with the Ann Owner if the 'Key Contact' check box is not selected/More than 1Contact for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for Formula announcement By Applicant By Focus Area    When I navigate to "Announcements" tab
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | unchecked      |
      | Automation PM  | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "Automation FO" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "Automation FO" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I perform quick search for "Automation PO" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "Automation PO" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation FO | Program Contact |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Project Role   |
      | Automation PO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I refresh the page
    And I wait for "2" seconds
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | unchecked      |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | unchecked      |
    Then I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |

  @NYSED-1104-closed @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that when Send Back is selected then again record get in created state and able to updated data in the contact section For Competitive announcement.    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    When I navigate to "Overview" sub tab
    Then I softly can see row level action button "View" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "View" against "Fiscal Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation EXE" in flex table with id "---announcement:-:contactTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---announcement:-:contactTableId---"

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |

  @NYSED-1091 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with the Announcement owner, able to see the 'Is Key Contact' column in the contact section For Formula announcement - By Applicant.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I save the field labeled "Program ID" as "ProgramID"
    And I save the value from row "1" for column name "Project Role" as "ProgramContact" from flex table "---announcement:-:contactTableId---"
    And I save the value from row "2" for column name "Project Role" as "FiscalContact" from flex table "---announcement:-:contactTableId---"
    And I wait for "2" seconds
    And I click "{SavedValue:ProgramID}" lookup link
      #@NYSED-1091
    And I wait for "3" seconds
    Then I softly see value "{SavedValue:FiscalContact}" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    Then I softly see value "{SavedValue:ProgramContact}" for title "Project Role" against the value "Automation PM" inside table "---program:-:contactsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "Edit" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
     #@NYSED-1091
    And I wait for "3" seconds
    Then I softly can see row level action button "Edit" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Contact" in flex table with id "---announcement:-:contactTableId---"
      #@NYSED-1091
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---announcement:-:contactTableId---" :
      | Actions | Project Role | Title | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | unchecked      |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | unchecked      |
    #@NYSED-1091
    And I wait for "3" seconds
    Then I softly see value "False" for title "Is Key Contact" inside table "---announcement:-:contactTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | checked        |
    #@NYSED-1091
    And I wait for "3" seconds
    Then I softly see value "True" for title "Is Key Contact" inside table "---announcement:-:contactTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "Automation FO" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "Automation FO" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    #@NYSED-1091
    And I wait for "3" seconds
    Then I softly see value "False" for title "Is Key Contact" against the value "Automation FO" inside table "---announcement:-:contactTableId---"

    Examples:
      | UserType | Approver                 | Reviewer                 |
      | PM       | {SavedValue:PM Username} | {SavedValue:PO Username} |

  @NYSED-2202 @NYSEDSprint-22 @US-NYSED-1836 @M04
    @NYSED-10267 @NYSED-Sprint-36 @US-NYSED-9919 @M06
  Scenario Outline:Verify that the Announcement Owner can see that on the Announcement layout->Overview Tab->Announcement Specific settings->Advance payment allowed? field is non-editable.
  |Verify that the Announcement Owner can see that the 'Is a Detailed Budget Required on the Application?' field defaults to 'Yes' when the Budget Type is 'FS-10' and remains editable.|
  |Verify that the Announcement Owner can see that on the Announcement layout → Overview tab → Information section, a new required and picklist field ‘Funding Type’ is added after the ‘Type’ field.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsAdvancePermitted__c"
    When I hovering mouse on help text icon inside page block detail "Year"
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition_FP_NO" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "--None--" into field "NYSED_FundingType__c"
    And I click on "Save" in the page details
    #NYSED-10267
    Then I softly see the following messages in the page details contains:
      | To save, Funding Type is required in the Overview tab under the Information section. |
    Then I see only the following ordered options in dropdown field "NYSED_FundingType__c" :
      | --None-- | State | Federal |
    And I enter value "State" into field "NYSED_FundingType__c"
    And I click on "Save" in the page details
    Then I softly see field "Funding Type" as "State"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Edit" in the page details
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "--None--" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
    When I hovering mouse on help text icon inside page block detail "Year"
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Indirect Rate Type"
    Then I softly see "Indicates the rate type that is allowed for the announcement. For Unrestricted, and Restricted rate types, please enter the "Maximum Indirect Rate %" only if you wish to limit the indirect rate % to a maximum rate for all applicants irrespective of the LEA-specific indirect rate uploaded in the GFMS for the fiscal year." shown as help text
    When I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "Indirect_Rate_Type__c" :
      | --None-- | Restricted | Unrestricted | Not Allowed |

    Examples:
      | UserType |
      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @NYSED-2176 @NYSED-2184 @NYSEDSprint-23 @US-NYSED-2087 @US-NYSED-2088 @M04
  Scenario Outline:Verify with the Program owner that any status of application can be seen in the Related Applications section for Formula - By applicant announcements.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
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
    #NYSED-2176
    Then I softly see value "Created" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2184
    Then I softly see value "Created" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ApplicationmEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<AnnouncementOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:AutomationPermanentStaticRecord}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStaticRecord}" inside table
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---program:-:RelatedApplicationsTableId---" panel
    #NYSED-2176
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2184
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
    #NYSED-2176
    Then I softly see value "Review Initiated" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2184
    Then I softly see value "Review Initiated" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"

    Examples:
      | UserType   | Announcement Name                                        | AnnouncementOwner |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PM                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FD                |

  @NYSED-2177 @NYSED-2185 @NYSEDSprint-23 @US-NYSED-2087 @US-NYSED-2088 @M04
  Scenario Outline:Verify with the Program owner that any status of application can be seen in the Related Applications section for Formula - BAFA announcements.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
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
    #NYSED-2177
    Then I softly see value "Created" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2185
    Then I softly see value "Created" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ApplicationmEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
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
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2185
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
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2185
    Then I softly see value "Review Initiated" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"

    Examples:
      | UserType   | Announcement Name                                        | AnnouncementOwner |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PM                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FD                |

  @NYSED-1497 @NYSEDSprint-22 @US-NYSED-1229 @M04
  Scenario Outline: Verify with Internal User (announcement owner), if they click on the 'Unpublish' button and the application has been created on the announcement, unable to  change some information - Formula -BAFA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "20" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    Then I softly see field "Estimated Total Funding" is not editable
    Then I softly see field "Deficit Amount" is not editable
    Then I softly see field "Justification for Deficit Amount" is not editable
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Maximum Indirect Rate %" is not editable
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see field "Budget Type" is not editable
    Then I softly see field "Budgeting is Required for:" is not editable
    Then I softly see field "Is a Detailed Budget Required on the Application?" is not editable
    Then I softly see field "Estimated Project Period Start Date" is not editable
    Then I softly see field "Estimated Project Period End Date" is not editable
    Then I softly can see row level action button "No Actions Available" against "BP01" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see "Focus Areas" page block displayed
    Then I softly can see row level action button "No Actions Available" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I navigate to "Setup" sub tab
    Then I softly can see top right button "New" in flex table with id "AnnouncementReviewTemplates"
    Then I softly can see top right button "Validate" in flex table with id "AnnouncementReviewTemplates"
    And I expand nested table containing column value "Program Office Review"
    Then I softly can see top right button "New" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Edit" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Review Forms" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Delete" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    And I wait for "3" seconds
    And I click on "Review Form" icon for "Group 2" inside flex table with id "ReviewStepPanelTemplates" without waiting for record
    Then I softly see "Review Categories" page block displayed
    Then I softly can see top right button "New" in flex table with id "ReviewPanelCategories"
    And I click modal button "Close"
    Then I softly see "Coordinators" page block displayed
    Then I softly can see top right button "Add" in flex table with id "ReviewStepCoordinators"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly see "FDM Review Step" page block displayed
    And I expand nested table containing column value "Funding Decision Memo"
    Then I softly can see top right button "Add" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-1496 @NYSEDSprint-22 @US-NYSED-1229 @M04
  Scenario Outline: Verify with Internal User (announcement owner), if they click on the 'Unpublish' button and the application has been created on the announcement, unable to  change some information - Formula -BA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "20" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I softly see field "Estimated Total Funding" is not editable
    Then I softly see field "Deficit Amount" is not editable
    Then I softly see field "Justification for Deficit Amount" is not editable
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Maximum Indirect Rate %" is not editable
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see field "Budget Type" is not editable
    Then I softly see field "Budgeting is Required for:" is not editable
    Then I softly see field "Is a Detailed Budget Required on the Application?" is not editable
    Then I softly see field "Estimated Project Period Start Date" is not editable
    Then I softly see field "Estimated Project Period End Date" is not editable
    Then I softly can see row level action button "No Actions Available" against "BP01" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see "Focus Areas" page block displayed
    Then I softly can see row level action button "No Actions Available" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I navigate to "Setup" sub tab
    Then I softly can see top right button "New" in flex table with id "AnnouncementReviewTemplates"
    Then I softly can see top right button "Validate" in flex table with id "AnnouncementReviewTemplates"
    And I expand nested table containing column value "Program Office Review"
    Then I softly can see top right button "New" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Edit" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Review Forms" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Delete" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    And I click on "Review Form" icon for "Group 2" inside flex table with id "ReviewStepPanelTemplates" without waiting for record
    Then I softly see "Review Categories" page block displayed
    Then I softly can see top right button "New" in flex table with id "ReviewPanelCategories"
    And I click modal button "Close"
    Then I softly see "Coordinators" page block displayed
    Then I softly can see top right button "Add" in flex table with id "ReviewStepCoordinators"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly see "FDM Review Step" page block displayed
    And I expand nested table containing column value "Funding Decision Memo"
    Then I softly can see top right button "Add" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"

    Examples:
      | UserType   |
#      | GRANTEE_SC |
      | GRANTEE_CE |

  @NYSED-1498 @NYSEDSprint-22 @US-NYSED-1229 @M04
  Scenario: Verify with Internal Profile(Announcement Owner), when announcement is in 'Under Revision' status and application review is initiated, then some fields from review step are read-only - Formula -BAFA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    Then I softly see field "Estimated Total Funding" is not editable
    Then I softly see field "Deficit Amount" is not editable
    Then I softly see field "Justification for Deficit Amount" is not editable
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Maximum Indirect Rate %" is not editable
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see field "Budget Type" is not editable
    Then I softly see field "Budgeting is Required for:" is not editable
    Then I softly see field "Is a Detailed Budget Required on the Application?" is not editable
    Then I softly see field "Estimated Project Period Start Date" is not editable
    Then I softly see field "Estimated Project Period End Date" is not editable
    Then I softly can see row level action button "No Actions Available" against "BP01" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see "Focus Areas" page block displayed
    And I wait for "2" seconds
    Then I softly can see row level action button "No Actions Available" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I navigate to "Setup" sub tab
    Then I softly cannot see top right button "New" in flex table with id "AnnouncementReviewTemplates"
    Then I softly cannot see top right button "Validate" in flex table with id "AnnouncementReviewTemplates"
    And I expand nested table containing column value "Program Office Review"
    Then I softly cannot see top right button "New" in flex table with id "ReviewStepPanelTemplates"
    Then I softly cannot see row level action button "Edit" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly cannot see row level action button "Review Form" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly cannot see row level action button "Delete" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "No Actions Available" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly see "Coordinators" page block displayed
    Then I softly can see top right button "Add" in flex table with id "ReviewStepCoordinators"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly see "FDM Review Step" page block displayed
    And I expand nested table containing column value "Funding Decision Memo"
    Then I softly can see top right button "Add" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"

  @NYSED-1880 @NYSEDSprint-22 @US-NYSED-1229 @M04 @defectID-NYSED-3819
  Scenario: Verify with announcement owner , if not created any application and click on unpublished button then able to see section action and inline action.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    And I wait for "10" seconds
    When I navigate to "Financials" sub tab
    Then I softly see fields "AwardFloor__c" is in edit mode
    Then I softly see fields "AwardCeiling__c" is in edit mode
    Then I softly see fields "EstimatedNumberOfAwards__c" is in edit mode
    Then I softly see fields "TotalCommittedAmount__c" is in edit mode
    Then I softly see fields "Justification__c" is in edit mode
    Then I softly see fields "Indirect_Rate_Type__c" is in edit mode
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    Then I softly cannot see row level action button "No Actions Available" against "BP01" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I navigate to "Overview" sub tab
    Then I softly see "Focus Areas" page block displayed
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I navigate to "Setup" sub tab
    Then I softly can see top right button "New" in flex table with id "AnnouncementReviewTemplates"
    Then I softly can see top right button "Validate" in flex table with id "AnnouncementReviewTemplates"
    And I expand nested table containing column value "Program Office Review"
    Then I softly can see top right button "New" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Edit" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Review Forms" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly can see row level action button "Delete" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly cannot see row level action button "No Actions Available" against "Group 2" in flex table with id "ReviewStepPanelTemplates"
    Then I softly see "Coordinators" page block displayed
    Then I softly can see top right button "Add" in flex table with id "ReviewStepCoordinators"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementReviewTemplates"
    Then I softly see "FDM Review Step" page block displayed
    And I expand nested table containing column value "Funding Decision Memo"
    Then I softly can see top right button "Add" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Edit" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"
    Then I softly can see row level action button "Remove" against "Program Coordinator" in flex table with id "AnnouncementFDMTemplate"

  @NYSED-5135 @NYSEDSprint-28 @US-NYSED-4908 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can view the updated list filter names displayed for the Announcements table
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I wait for "3" seconds
    #NYSED-5135
    Then I softly see toggle option "Announcements - All" inside flex table id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see toggle option "Announcements - Rejected" inside flex table id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see toggle option "Announcements - Published" inside flex table id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see toggle option "Announcements - Closed and Archived" inside flex table id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see toggle option "Announcements - Created" inside flex table id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    #NYSED-5135
    Then I softly see toggle option "Competitive Announcements - All" inside flex table id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly see toggle option "Competitive Announcements - Rejected" inside flex table id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly see toggle option "Competitive Announcements - Published" inside flex table id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly see toggle option "Competitive Announcements - Closed and Archived" inside flex table id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly see toggle option "Competitive Announcements - Created" inside flex table id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    #NYSED-5135
    Then I softly see toggle option "Formula Announcements - All" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    Then I softly see toggle option "Formula Announcements - Rejected" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    Then I softly see toggle option "Formula Announcements - Published" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    Then I softly see toggle option "Formula Announcements - Closed and Archived" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    Then I softly see toggle option "Formula Announcements - Created" inside flex table id "---announcement:-:formulaAnnouncementTableId---"
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    #NYSED-5135
    Then I softly see toggle option "Formula Announcements - All" inside flex table id "---announcement:-:annoucementTableId---"
    Then I softly see toggle option "Directed Announcements - Rejected" inside flex table id "---announcement:-:annoucementTableId---"
    Then I softly see toggle option "Directed Announcements - Published" inside flex table id "---announcement:-:annoucementTableId---"
    Then I softly see toggle option "Directed Announcements - Closed and Archived" inside flex table id "---announcement:-:annoucementTableId---"
    Then I softly see toggle option "Directed Announcements - Created" inside flex table id "---announcement:-:annoucementTableId---"

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |
      | EXE      |

  @NYSED-8388 @NYSED-Sprint-32 @US-NYSED-5962 @M04Planning
  Scenario Outline: Verify that the FD user can see the following fields added and renamed under Announcement Layout → Financials Tab → Funding Account Section- Standard Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FUNDING_ACCOUNT"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #NYSED-8388
    Then I softly see "Pre-Encumbrance" in flex table header "---announcement:-:fundingAccountsTableId---"
    Then I softly see "Enc Life" in flex table header "---announcement:-:fundingAccountsTableId---"
    Then I softly do not see "Encumbrance" in flex table header "---announcement:-:fundingAccountsTableId---"
    Then I softly see "Outstanding Encumbrance" in flex table header "---announcement:-:fundingAccountsTableId---"
    Then I softly do not see "Outstanding Encumbrance Balance" in flex table header "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    Then I softly see field "NetPreEncumbrance__c" is not editable
    When I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    Then I softly see field "NetPreEncumbrance__c" is not editable

    Examples:
      | UserType |
      | FD       |

  @NYSED-10267-UnderRevision @NYSED-Sprint-36 @US-NYSED-9919 @M06
  Scenario: Verify that the Announcement Owner can see that on the Announcement layout → Overview tab → Information section, a new required and picklist field ‘Funding Type’ is added after the ‘Type’ field.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    And I enter value "--None--" into field "NYSED_FundingType__c"
    And I click on "Save" in the page details
    #NYSED-10267
    Then I softly see the following messages in the page details contains:
      | To save, Funding Type is required in the Overview tab under the Information section. |
    Then I see only the following ordered options in dropdown field "NYSED_FundingType__c" :
      | --None-- | State | Federal |
    And I enter value "State" into field "NYSED_FundingType__c"
    And I click on "Save" in the page details
    Then I softly see field "Funding Type" as "State"

  @NYSED-11029 @NYSED-Sprint-37 @US-NYSED-10667 @M04
  Scenario Outline:Verify that the Internal User see that at Announcement layout Overview tab->Applicants and Allocations section is moved to Financials tab after Funding Accounts section. - Formula (BA) type: Standard Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly do not see "Applicants and Allocations" page block displayed
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    #NYSED-11029
    Then I see only the following ordered page blocks :
      | Financial Details          |
      | Funding Accounts           |
      | Applicants and Allocations |
      | Budget Specific Settings   |
      | Budget Period Details      |
      | Budget Categories          |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financials Tab - You must invite at least one applicant before submitting this Announcement. |

    Examples:
      | UserType |
      | PO       |
#      | PM      |
#      | FO      |
#      | FD      |