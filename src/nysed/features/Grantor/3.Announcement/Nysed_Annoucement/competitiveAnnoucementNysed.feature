@competitiveAnnouncementsNysed @announcementExecution @announcementUAT
Feature: Validate all scenarios in the Competitive Announcement tab

  @489012 @Sprint-00 @US-487276 @M04Announcement
  Scenario Outline: Verify that the Internal User does not see the question "Leverage Allowed?" on the create announcement modal.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "4" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block

    Examples:
      | UserType |
      | PM       |
#      | EXE      |

  @489504 @Sprint-00 @US-487276 @bugID_589514 @bugID_530646 @Bug-Ticket-535596 @M04Announcement
  Scenario Outline: Verify that the Internal User does not see the question "Leverage Allowed?" on the Published opportunity page from Subrecipient login portal page.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:publishAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:publishAnnouncementTableId---" without waiting for record
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @492300 @Sprint-01 @US-487309 @M04Announcement
  Scenario Outline: Verify that on FDM record Internal user can see columns 'Cert Level' and 'Available balance' are added on funding accounts - read-only , available with totals and correct values should show up from the related funding accounts
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
    And I refresh the page
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
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
    And I pause execution for "3" seconds
    Then I see field "Status" as "Draft"
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    Then I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | EXE      | {SavedValue:EXE Username} |

  @492322  @Sprint-01 @US-487309 @M04Announcement
  Scenario Outline: Verify that the Internal User can see 'Cert Level' and 'Available balance' columns are available with totals, read-only and values should show up from the related funding accounts. - Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount1}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    Then I softly see field "Status" as "Created"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    And I "Send to Owner" in the approval decision
    And I pause execution for "100" seconds
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
    And I click on "Submit For Approval" in the page details
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
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
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
#      | FD      | {SavedValue:FD Username} |

  @490456 @490458 @490460 @490601 @Sprint-01 @US-487341 @M04Announcement
  Scenario Outline: Verify that the Internal user see only Edit button at the Announcement page layout and other record flow action buttons at page level action dropdown.: Announcement Created status
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I wait for "10" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    Then I softly see field "Status" as "Created"
    #@490456
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I wait for "3" seconds
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
    Then I softly see field "Status" as "Approved"
    #@490458
    Then I can see top right button "Undo" in page detail
    Then I can see top right button "Revise" in page detail
    Then I can see top right button "Publish" in page detail
    Then I can see top right button "Download as PDF" in page detail
    Then I can see top right button "Take Snapshot" in page detail
    #@490460
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see top right button "Extend Dates" in page detail
    Then I softly can see top right button "Unpublish" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    #@490601
    Then I softly can see top right button "Qualify" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    Then I softly can see top right button "Create Application" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Examples:
      | UserType | Approver      | User       |
      | PM       | Automation PM | GRANTEE_SC |
#      | FD      | Automation FD | GRANTEE_SC  |

  @495630 @495638 @495675 @Sprint-03 @US-490908 @M04Announcement
  Scenario Outline: Verify that Internal user can see new required field  'Indirect Rate Type' is add on Announcement layout->Financials (tab)->Financial Details (section)	 with dropdown options - Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    Then I softly see field "Indirect Rate Type" inside page block
    Then I see only the following ordered options in dropdown field "Indirect_Rate_Type__c" :
      | --None-- | Restricted | Unrestricted | Not Allowed |
    And I wait for "2" seconds
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
    And I wait for "2" seconds
    #@495638
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
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
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100.56" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Financials Tab - The Maximum Indirect Rate cannot be greater than 100%. |
    #495675
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    Then I softly do not see "Maximum Indirect Rate %" page block displayed

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | FD      | {SavedValue:FD Username} |
#      | PO       | {SavedValue:PO Username}  |

  @495680 @495670 @Sprint-03 @US-490908 @M04Announcement
  Scenario Outline: Verify that Internal user should not see validation if can not enter value in field  'Maximum Indirect Rate %' for the optional type 'Restricted'   - Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
      #495670
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Unrestricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
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
    And I refresh the page
    And I pause execution for "60" seconds
    When I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
      #495670
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
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Maximum Indirect Rate % value is required if Indirect Rate Type is 'Restricted. |
    Then I softly see field "Maximum Indirect Rate %" as ""
    #495670
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
#      | FD      | {SavedValue:FD Username} |
#      | PO       | {SavedValue:PO Username}  |

  @495679 @Sprint-03 @US-490908 @M04Announcement
  Scenario Outline: Verify that Internal user can see new required field  'Indirect Rate Type' is add on Announcement layout->Financials (tab)->Financial Details (section)	 with dropdown options - Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I hovering mouse on help text icon inside page block detail "Indirect Rate Type"
#    Then I softly see "<helpText>" shown as help text

    Examples:
      | UserType | helpText                                                                                                                                                                                                                                                                                                                                                                                                 |
      | PM       | Indicates the rate type that is allowed for the announcement. For the Fixed rate type, you must enter the "Maximum Indirect Rate %". For Unrestricted, and Restricted rate types, please enter the "Maximum Indirect Rate %" only if you wish to limit the indirect rate % to a maximum rate for all applicants irrespective of the LEA-specific indirect rate uploaded in the EGMS for the fiscal year. |
#      | FO      |Indicates the rate type that is allowed for the announcement. For the Fixed rate type, you must enter the "Maximum Indirect Rate %". For Unrestricted, and Restricted rate types, please enter the "Maximum Indirect Rate %" only if you wish to limit the indirect rate % to a maximum rate for all applicants irrespective of the LEA-specific indirect rate uploaded in the EGMS for the fiscal year.|
#      | PO       |Indicates the rate type that is allowed for the announcement. For the Fixed rate type, you must enter the "Maximum Indirect Rate %". For Unrestricted, and Restricted rate types, please enter the "Maximum Indirect Rate %" only if you wish to limit the indirect rate % to a maximum rate for all applicants irrespective of the LEA-specific indirect rate uploaded in the EGMS for the fiscal year.|

  @495174 @494992 @494996 @494998 @495173 @495080 @495168 @495067-Closed  @Sprint-02 @US-491406 @M04Announcement @Bug-Ticket-NYSED-3052
  Scenario Outline: Verify that announcement owner can edit 'Pre-Encumbrance' field when announcement is in status- Created, Under Revision, Submitted for Review, Review Completed, Publish  (Internal and External Funding Account)
  |Verify that announcement Non-Owner cannot edit 'Pre-Encumbrance' field when announcement is in status- Created, Under Revision, Submitted for Review, Review Completed, Publish|
  |Verify that announcement owner cannot edit 'Pre-Encumbrance' field when announcement is in status- Submitted for Approval, Approved Status|
  |Verify that when announcement owner sends record to the reviewer with Edit access as yes, he can updates amounts on Funding information section and amounts should be recalculated on funding account - External Funding Account|
  |Verify that when announcement owner sends record to the reviewer with Edit access as yes, he can updates amounts on Funding information section and amounts should be recalculated on funding account - Internal Funding Account |
  |Verify that when announcement owner updates amounts on Funding information section, amounts should be recalculated on funding account- Publish State - Internal and External Funding Account|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    #494992
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #Non Owner- Created state
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #owner - send back record
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I "Send to Owner" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #Approver- Approve state
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    #-- not run below steps
    When I "Approve" in the approval decision
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #Non Owner- Approve State
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #owner- Approved state
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see top right button "Publish" in page detail
    #publish state
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    #@495174
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_Internal"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_Internal}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    And I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount2}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_External"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_External}" for title "Available Balance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    #Non Owner- Publish State
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Examples:
      | UserType |
      | PM       |
#      | FO      |
#      | PO       |

  @495174-closed @494992 @494996 @495067 @Sprint-02 @US-491406 @bug_id_500419 @M04Announcement @announcementRerun495174 @M04Announcement
  Scenario: Verify that announcement owner can edit 'Pre-Encumbrance' field when announcement is in status- Closed (Internal and External Funding Account)
  |Verify that announcement Non-Owner cannot edit 'Pre-Encumbrance' field when announcement is in status- Closed|
    #Closed Competitive Announcement - Owner
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:ClosedCompetitiveAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "2" seconds
    When I click on "View" icon for "{SavedValue:ClosedCompetitiveAnnouncement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_Internal"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:AvailableBalance_Internal}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_External"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_External}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:ClosedCompetitiveAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:ClosedCompetitiveAnnouncement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
      #Non Owner- Closed State
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:ClosedCompetitiveAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "2" seconds
    When I click on "View" icon for "{SavedValue:ClosedCompetitiveAnnouncement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #Closed Formula Announcement- Owner
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "2" seconds
    When I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_Internal"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_Internal}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_External"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_External}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
      #Non Owner- Closed State
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "2" seconds
    When I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
     #Closed Directed Announcement - Owner
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "2" seconds
    When I click on "View" icon for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_Internal"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_Internal}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount1}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_External"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_External}" for title "Available Balance" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount1} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
      #Non Owner- Closed State
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "2" seconds
    When I click on "View" icon for "{SavedValue:CloseDirectedAnnouncementWithTwoFundingAccount}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"


  @494998-Sprint2 @Sprint-02 @US-491406 @M04Announcement
    @NYSED-6540 @Sprint-30 @US-NYSED-6262 @M04
  Scenario Outline: Verify that announcement owner cannot edit 'Pre-Encumbrance' field when announcement is in status-  Rejected Status
  |Verify the updated confirmation message when the Approver selects ‘Reject’ and clicks ‘Submit’ on the Standard Announcement layout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "---announcement:-:JustificationforDeficitAmount---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I "Reject" in the approval decision without confirmation
    And I wait for "2" seconds
    #NYSED-6540
    Then I softly see confirmation box with body "Are you sure you want to reject this request? Once rejected, it cannot be reactivated or edited." is displayed
    And I wait for "2" seconds
    And I click "Continue" on modal confirmation box
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | FO      |
#      | PO       |

  @495168 @495067 @Sprint-02 @US-491406 @M04Announcement
  Scenario Outline: Verify that when announcement owner updates amounts on Funding information section, amounts should be recalculated on funding account- Created (Internal and External Funding Account)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_Internal"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_Internal}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    When I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | #$34            |
    Then I softly see value "" for title "Pre-Encumbrance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount2}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_External"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_External}" for title "Available Balance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record

    Examples:
      | UserType |
      | PM       |
#      | FD      |
#      | PO       |

  @496014 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that the user can see forms sequencing is updated ,if we change sequencing after Announcement Publish - Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<UserType>" user
    And I wait for "3" seconds
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

  @496065 @Sprint-03 @US-487967 @bug-id_532231 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Unrestricted'- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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

  @496066 @Sprint-03 @US-487967 @M04Announcement @sanitysuite
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Restricted'- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    And I wait for "3" seconds
    And I navigate to "Financials" sub tab
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

  @496068 @Sprint-03 @US-487967 @M04Announcement
  Scenario Outline:Verify that grantee user cannot see field "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Not Allowed'- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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

  @496083 @496091 @Sprint-03 @US-487967 @Bug-Ticket-535596 @M04Announcement
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type" and 'Maximum Indirect Rate%' on Opportunity layout which is converted to application- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccountsTableId---" panel
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "<IndirectType>" into field "Indirect_Rate_Type__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "50" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    #@496091
    Given I am on "SUBPORTAL" portal
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:publishAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:publishAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "<IndirectType>"
    Then I softly see field "Maximum Indirect Rate%" is not editable
#    Then I softly see field "Maximum Indirect Rate%" as "50.00%"
    And I click on back arrow
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
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

  @497802 @497808 @Sprint-03 @US-487967 @M04Announcement @Bug-Ticket-535596
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type- Not Allowed" on Opportunity layout which is converted to application- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    #@497808
    Given I am on "SUBPORTAL" portal
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:publishAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:publishAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Not Allowed"
    Then I softly do not see "Maximum Indirect Rate%" page block displayed
    And I click on back arrow
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    Then I softly see field "Status" as "Created"
    And I wait for "6" seconds
    #497802
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
    Then I softly see field "Indirect Rate Type" as "Not Allowed"
    Then I softly do not see "Maximum Indirect Rate%" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @504919-C @Sprint-05 @US-500360 @M04Announcement
  Scenario Outline: Verify that an announcement owner see validation message when clicked on 'Submit for Approval' and any funding account is not associated on Formula/Directed/Competitive announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
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

  @503359 @Sprint-05 @US-499231 @@bug_id_508787 @M04Announcement
  Scenario Outline: Verify that user should see below fields are removed from announcement layout- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly do not see "Federal/NGO Program" page block displayed
    Then I softly cannot see field "Program Type" inside page block
    Then I softly cannot see field "Internal Organization" inside page block
    Then I softly cannot see field "Internal Division/Office" inside page block
    Then I softly cannot see field "Program Income" inside page block
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FD      |

  @503362 @503363 @Sprint-05 @US-499231 @M04Announcement
  Scenario Outline: Verify that user should see 'Program Income Allowed?' field is removed from announcement modal - Directed/Competitive/Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    Then I softly cannot see field "Program Income Allowed?" inside page block
    #503363
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    Then I softly cannot see field "Program Income Allowed?" inside page block
    #503363
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    Then I softly cannot see field "Program Income Allowed?" inside page block
    #503363
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FD      |

  @503401 @Sprint-05 @US-499231 @M04Announcement
  Scenario Outline: Verify that user should see validations related to 'Carry Over as N' - Competitive Announcement in created state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I clear the value from field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "10" into field "First_Payment__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |

  @503405 @Sprint-05 @US-499231 @M04Announcement
  Scenario Outline: Verify that user should not see validations related to 'Carry Over as N' - Competitive Announcement in send back and under revision state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    And I wait for "2" seconds
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I navigate to "Overview" sub tab
    And I enter value "Yes" into field "Carry_Over__c"
    When I click on "Save" in the page details
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
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I wait for "10" seconds
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "No" into field "Carry_Over__c"
    Then I see only the following ordered options in dropdown field "Carryover_Limit__c" :
      | --None-- | No |
    When I clear the value from field "Carryover_Limit_Percent__c"
    And I enter value "50" into field "First_Payment__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.         |
      | Overview Tab - First Payment% is required before submitting announcement for approval. |
    Then I cannot see top right button "Edit" in page detail
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "No" into field "Carry_Over__c"
    Then I see only the following ordered options in dropdown field "Carryover_Limit__c" :
      | --None-- | No |
    When I clear the value from field "Carryover_Limit_Percent__c"
    And I enter value "50" into field "First_Payment__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.         |
      | Overview Tab - First Payment% is required before submitting announcement for approval. |
    Then I cannot see top right button "Edit" in page detail

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | FD      | {SavedValue:FD Username} |

  @503367 @Sprint-05 @US-499231 @bug_id_511587 @M04Announcement
  Scenario Outline: Verify that user should not see validations related to 'Carry Over as N' - Competitive Announcement in send back and under revision state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I clear the value from field "First_Payment__c"
    And I click on "Save" in the page details
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
    Then I softly see field "Carry Over Limit" inside page block
    When I hovering mouse on help text icon inside page block detail "Carry Over Limit"
#    Then I softly see "Indicates whether a waiver is needed to carry appropriation forward. If "N" no waiver is required and any leftover money can be carried over" shown as help text
    And I enter value "Yes" into field "Carryover_Limit__c"
    When I hovering mouse on help text icon inside page block detail "Carry Over Limit %"
    Then I softly see "A percent of total available appropriation that can be carried over if a waiver is required and not received." shown as help text
    When I clear the value from field "Carryover_Limit_Percent__c"
    When I clear the value from field "First_Payment__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    Then I softly see "The percentage of the approved budget that will be forwarded to the agency as a first payment. Input 0, for no advance." shown as help text
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.              |
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    Then I softly can see top right button "Edit" in page detail
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
    Then I softly can see top right button "Edit" in page detail
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
#      | FO       |
#      | FD       |

  @503370 @Sprint-05 @US-499231 @M04Announcement
  Scenario Outline: Verify that user should see below validations on send back and under revision state records- Competitive Announcement and  Carry Over as Yes
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I navigate to "Overview" sub tab
    And I enter value "Yes" into field "Carry_Over__c"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
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
    And I wait for "4" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Send to Owner" in the approval decision
    And I wait for "10" seconds
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Yes" into field "Carryover_Limit__c"
    When I clear the value from field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.         |
      | Overview Tab - First Payment% is required before submitting announcement for approval. |
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
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
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "100" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'.         |
      | Overview Tab - First Payment% is required before submitting announcement for approval. |
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | FO       | {SavedValue:PO Username}  |
#      | FD       | {SavedValue:EXE Username} |

  @502418 @502425 @502432 @502429 @502436 @502431 @Sprint-05 @US-487277 @M04Announcement
  Scenario Outline: Verify that the Internal user sees the 'Project Role' Column is added just after 'Action' column in the announcement layout->Overview tab->Contacts section. And 'Project Role' Column is a dropdown field: Program Contact Fiscal Contact. And Editable
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    Given I navigate to "Overview" sub tab
    And I save the value from row "1" for column name "Project Role" as "ProjectRole" from flex table "---program:-:contactsTableId---"
    And I save the value from row "2" for column name "Project Role" as "ProjectRole1" from flex table "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    #502418
    Given I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---announcement:-:contactTableId---" :
      | Actions | Project Role | Title | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I softly can see row level action button "Edit" against "Automation EXE" in flex table with id "---announcement:-:contactTableId---"
    #502432
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---announcement:-:contactTableId---"
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:contactTableId---"
    Then I softly see fields "ProjectRole__c" is in edit mode
    #502431
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I click on top right button "Save" in flex table with id "---announcement:-:contactTableId---"
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---announcement:-:contactTableId---"
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
    And I wait for "3" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role. |
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #502425
    Given I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---announcement:-:contactTableId---" :
      | Actions | Project Role | Title | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I softly cannot see row level action button "Edit" against "Automation EXE" in flex table with id "---announcement:-:contactTableId---"
    And I wait for "2" seconds
    And I refresh the page
    And I "Send to Owner" in the approval decision
    And I pause execution for "60" seconds
    Then I see field "Status" as "Draft"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #502425
    Given I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---announcement:-:contactTableId---" :
      | Actions | Project Role | Title | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I softly cannot see row level action button "Edit" against "Automation EXE" in flex table with id "---announcement:-:contactTableId---"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #502425
    Then I see only the following headers in table with id "---announcement:-:contactTableId---" :
      | Actions | Project Role | Title | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I softly cannot see row level action button "Edit" against "Automation EXE" in flex table with id "---announcement:-:contactTableId---"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    #502418
    Then I see only the following headers in table with id "---announcement:-:contactTableId---" :
      | Actions | Project Role | Title | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I softly can see row level action button "Edit" against "Automation EXE" in flex table with id "---announcement:-:contactTableId---"
    #502432
    Then I softly see value "{SavedValue:ProjectRole}" for title "Project Role" against the value "Automation PM" inside table "---announcement:-:contactTableId---"
    Then I softly see value "{SavedValue:ProjectRole1}" for title "Project Role" against the value "Automation EXE" inside table "---announcement:-:contactTableId---"
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:contactTableId---"
    Then I softly see fields "ProjectRole__c" is in edit mode
    #502431
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I click on top right button "Save" in flex table with id "---announcement:-:contactTableId---"
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---announcement:-:contactTableId---"
    #502429
    And I click on top right button "New" in flex table with id "---announcement:-:contactTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Runtime" inside table "---announcement:-:contactTableId---"
    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | FD      | {SavedValue:FD Username} |

  @497213 @499298 @Sprint-05 @US-500362 @M04Announcement @Bug-Ticket-NYSED-3052
  Scenario Outline: Verify that the Fund Year column, as Read-only, is added next to the Funding Account column on the Announcement layout->Financials tab->Funding Account Information section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
        #497213
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    Then I softly see value "1990-25" for title "Fund Year" inside table "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see field "Fund Year" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #499298
    Then I see only the following headers in table with id "---announcement:-:fundingAccTableId---" :
      |  | EGMS ID | Fund Year | Title | Funding Source | Total Obligation | Available Balance |
    When I perform quick search for "{SavedValue:fundingAccount1}" in "---announcement:-:fundingAccTableId---" panel
    Then I softly see value "1990-25" for title "Fund Year" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
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
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Send to Owner" in the approval decision
    And I pause execution for "10" seconds
    Then I see field "Status" as "Draft"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Financials" sub tab
    #497213
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |
    Then I softly see value "1990-25" for title "Fund Year" inside table "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see field "Fund Year" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Given I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Financials" sub tab
    #497213
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Cert Level | Available Balance | Pre-Encumbrance | Encumbrance Balance | Spent | Pre-Encumbrance Balance |
    Then I softly see value "1990-25" for title "Fund Year" inside table "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see field "Fund Year" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
      #499298
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I see only the following headers in table with id "---announcement:-:fundingAccTableId---" :
      |  | EGMS ID | Fund Year | Title | Funding Source | Total Obligation | Available Balance |
    When I perform quick search for "{SavedValue:fundingAccount1}" in "---announcement:-:fundingAccTableId---" panel
    Then I softly see value "1990-25" for title "Fund Year" against the value "{SavedValue:fundingAccount1}" inside table "---announcement:-:fundingAccTableId---"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | FD      | {SavedValue:FD Username} |

  @506007 @Sprint-06 @US-494448 @M04Announcement
  Scenario Outline: Verify that the Fund Year column, as Read-only, is added next to the Funding Account column on the Announcement layout->Financials tab->Funding Account Information section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    Then I see only the following ordered options in dropdown field "Budget_Category_Package__c" :
      | --None-- | FS-10 | Lump Sum |
    And I wait for "3" seconds
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
    And I wait for "3" seconds
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

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @506044 @Sprint-06 @US-494448 @M04Announcement
  Scenario Outline: Verify that Internal user see that fields are defaulted to 'No' and are hidden on the extended create announcement (competitive) modal and Announcement Layout->Overview Tab->Announcement Specific settings when the budget type is selected as 'Lump Sum'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
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
#      | PO       |
#      | FO       |
#      | FD       |

  @506076 @506142 @506145 @Sprint-06 @US-494448 @bug_id_529850 @M04Announcement
  Scenario Outline: Verify that internal user see that fields are defaulted as mentioned, disabled, and the 'Budget Type' is displayed as 'Lump Sum' in the Announcement Layout -> Financials Tab -> Budget Specific Settings when the budget type is selected as 'Lump Sum'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    #506145
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I softly cannot see field "Maximum Indirect Rate %" inside page block
    #506076
    Then I softly see field "Budgeting is Required for:" is not editable
    Then I softly see field "Is a Detailed Budget Required on the Application?" is not editable
    When I click on "Save" in the page details
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    Then I softly see field "Is a Detailed Budget Required on the Application?" as "No"
    And I wait for "5" seconds
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
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
   #506145
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I softly cannot see field "Maximum Indirect Rate %" inside page block
      #506076
    Then I softly see field "Budgeting is Required for:" is not editable
    Then I softly see field "Is a Detailed Budget Required on the Application?" is not editable
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    Then I softly see field "Is a Detailed Budget Required on the Application?" as "No"
    And I wait for "5" seconds
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
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    #506145
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I softly cannot see field "Maximum Indirect Rate %" inside page block
    #506076
    Then I softly see field "Budgeting is Required for:" is not editable
    Then I softly see field "Is a Detailed Budget Required on the Application?" is not editable
    When I click on "Save" in the page details
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    Then I softly see field "Is a Detailed Budget Required on the Application?" as "No"
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @505626 @Sprint-06 @US-501279 @M04Announcement
  Scenario Outline: Verify that the program's fund code is added as the last column at the Create Announcement modal->Program ID lookup and Announcement Layout->Overview tab->Information Section after the Program ID field.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I see value "Fund Code" inside lookup field "Program__c" displayed
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "4" seconds
    Given I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" added after "Program ID"
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    Then I see value "Fund Code" inside lookup field "Program__c" displayed
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" added after "Program ID"
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    Then I see value "Fund Code" inside lookup field "Program__c" displayed
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" added after "Program ID"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @505702 @Sprint-06 @US-501279 @M04Announcement
    @NYSED-10276 @NYSED-Sprint-36 @US-NYSED-9919 @M06
  Scenario Outline: Verify that Fund Year field is added at the competitive announcement list view, next to Announcement Name Column.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    Then I see only the following headers in table with id "---announcement:-:competitiveTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Competitive Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:competitiveTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Competitive Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:competitiveTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Competitive Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:competitiveTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I wait for "3" seconds
    And I click toggle button to select "Competitive Announcements - All"
    Then I see only the following headers in table with id "---announcement:-:competitiveTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @505688 @Sprint-06 @US-501279 @M04Announcement
  Scenario Outline: Verify that Fund Year field is added at announcement list view, next to Announcement Name Column.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I wait for "3" seconds
    And I click toggle button to select "Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I wait for "3" seconds
    And I click toggle button to select "Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I wait for "3" seconds
    And I click toggle button to select "Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I wait for "3" seconds
    And I click toggle button to select "Announcements - All"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @505668-C @505652-C @Sprint-06 @US-501279 @M04Announcement
  Scenario Outline: Verify that Fund Year field is added at Announcement Layout->Overview tab->Information Section, is auto-populated as Fund Code + Last 2 digits of Year and is not editable
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Overview" sub tab
    Then I softly see field "Status" as "Under Revision"
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Fund Code" as "1990"
    Then I softly see field "Year" as "2010"
    Then I softly see field "Fund Year" as "1990-10"
    When I click on "Edit" in the page details
    Then I softly see field "Fund Year" is not editable
    #505652
    Given I navigate to "Overview" sub tab
    Then I softly see value "1990" inside dropdown field "NYSED_Year__c" displayed
    Then I softly see value "2075" inside dropdown field "NYSED_Year__c" displayed
    And I enter value "--None--" into field "NYSED_Year__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required in the Overview tab under the Information section. |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username}  |
#      | FO       | {SavedValue:FO Username}  |
#      | FD       | {SavedValue:FD Username}  |

  @506503 @Sprint-06 @US-504645 @M04Announcement
  Scenario Outline: Verify that the PM/PO/FD/FO profile users only can see the 'New' button on the Announcement phase->Competitive announcement list view.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    Then I softly can see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @506511 @Sprint-06 @US-504645 @sanitysuite
  Scenario Outline: Verify that the PM/PO/FD/FO profile users only can see the 'New' button on the Announcement phase->Competitive announcement list view.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"

    Examples:
      | UserType |
      | EXE      |
#      | ADMIN    |

  @506530 @506532-C @506879-C @@506542-C @506608-C @506613-C @Sprint-06 @US-504645 @US-500142 @M04Announcement @Bug-Ticket-539331
  Scenario Outline: Verify that the Announcement Owner (PM/PO/FD/FO profile users only) can see that the announcement row level Edit action and record level edit action are available to the record owner only.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    #506532-C
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    #@506613-C
    And I navigate to "Announcements" tab
    And I wait for "4" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I softly see the following messages in the page details contains:
      | You don`t have sufficient access to edit this record |
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    #@506608-C
    And I navigate to "Announcements" tab
    And I wait for "4" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "5" seconds
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
    Then I softly see field "Soft Application Due Date?" is displayed as a checkbox
    When I enter value "Checked" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Soft Application Due Date?" is checked
    Then I softly see field "Subrecipient Match (%)" as "10.00%"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
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
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
     #@506608-C
    And I navigate to "Announcements" tab
    And I wait for "4" seconds
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Announcement}"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:Automation Runtime Announcement}" in global search with id "Announcements"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "5" seconds
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
    Then I softly see field "Soft Application Due Date?" is displayed as a checkbox
    When I enter value "Unchecked" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly do not see field "Soft Application Due Date?" is checked
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
    #@506613-C
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

  @506619 @Sprint-06 @US-504645 @M04Announcement
  Scenario Outline: Verify that the PM/PO/FD/FO profile users can see Pre-application is set to 'No' and is hidden on Create Announcement modal->Announcement Specific Setting section and on Announcement layout->Overview tab->Announcement Specific Setting section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see field "Pre-application is set to 'No'" inside page block
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Pre-application is set to 'No'" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-2042 @506541-C @Sprint-06 @US-503093 @US-504645 @M04Announcement @NYSEDSprint-24 @US-NYSED-1804
  Scenario Outline: Verify that the peer reviewer can see the updated 'Eligible Applicant Types' list at Announcement layout->Overview tab->Eligibility Details section when Allow Record Editing is Yes
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #NYSED-2042
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
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
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

  @506905-C @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see specified columns at Announcement layout->Financials tab->Budget Categories table and details in the table are populated as per the given excel when the budget type is selected as 'FS-10'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @509566 @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline:Verify that the announcement owner can see specified columns are hidden when the budget type is selected as 'Lump Sum'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
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

  @516273 @Sprint-06 @US-495110 @bug_id_529808 @M04Announcement
  Scenario Outline: Verify that 'Lumpsum' has been updated to 'Lump Sum' in the following locations: the Budget Type picklist value on the Create Announcement modal, the Budget Specific Settings section, and the Budget Categories section under the Financials tab.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
   #516273
    Then I see only the following ordered options in dropdown field "Budget_Category_Package__c" :
      | --None-- | FS-10 | Lump Sum |
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    Then I see only the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Actions | Budget Category | Budget Category Code |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Actions     | Budget Category | Budget Category Code |
      | Action menu | Lump Sum        | 0                    |

    Examples:
      | UserType |
      | PM       |
#        | PO      |
#        | FO      |
#        | FD      |

  @509519 @Sprint-06 @US-495110 @M04Announcement
  Scenario Outline: Verify that 'Include In Indirect Cost Calculation' is a picklist field and 'Line Item available if applicable' is currency field up to 2 decimal places, is not required when Budget type is selected as 'FS-10'- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
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
      | {SavedValue:PO Username} | Step 1       |
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

  @511020-C @510971-C @NYSED-2113 @Sprint-07 @US-487309 @US-506360 @NYSEDSprint-23 @US-NYSED-1849 @M04 @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see a new field 'OSC Approved?' is added at Announcement Layout->Overview tab->Announcement Specific Settings section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I click on "Update Details" in the page details
    When I enter in modal value "4" into field "Bud_Stop__c"
    When I enter in modal value "5" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Overview" sub tab
    #NYSED-2113
    Then I softly cannot see field "OSC Approved?" inside page block
    And I get the "EGMS ID"
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
      #511020-C
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
      #511020-C
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
      #511020-C
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    #NYSED-2113
    Then I softly cannot see field "OSC Approved?" inside page block
    #510971-C
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @512177-C @Sprint-07 @US-487964 @M04Announcement
  Scenario Outline: Verify that the grantee user cannot see the section-level instructions in the Applicants and Allocations section on the Opportunity.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I wait for "3" seconds
    And I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:publishedOpputunityTableId---"
    When I navigate to "Overview" sub tab
    Then I softly do not see "Applicants and Allocations" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @510767-C @510790-C @Sprint-07 @US-503307 @M04Announcement
  Scenario Outline: Verify that the announcement owner sees that the 'Office' field is added after the 'Project Role' field in the Contact Information section on the 'Create Contact' modal on the Announcement when the announcement owner clicks on the 'New' button.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    #510767-C
    Given I navigate to "Overview" sub tab
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
    #510790-C
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I see only the following headers in table with id "---announcement:-:annoucementContactTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    Then I see the following rows under the following headers in table with id "---announcement:-:contactTableId---" :
      | Name           | Office          |
      | Automation EXE | Automation Test |
    When I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:contactTableId---"
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
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    #510767-C
    Given I navigate to "Overview" sub tab
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
    #510790-C
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I see only the following headers in table with id "---announcement:-:annoucementContactTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    Then I see the following rows under the following headers in table with id "---announcement:-:contactTableId---" :
      | Name           | Office          |
      | Automation EXE | Automation Test |
    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @511011-C @Sprint-07 @US-506360 @M04Announcement
  Scenario Outline: Verify that the FD user sees the updated validation message as 'Available Balance cannot be negative. Please adjust the Cert Level accordingly.'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
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

  @511594-C @NYSED-2115 @NYSED-2114 @Sprint-07 @US-508916 @US-514567 @516276-C @516289-C @516279-C @NYSEDSprint-23 @US-NYSED-1849 @M04 @M04Announcement
  Scenario Outline: Verify that the Only FD profile users see the 'OSC Approved?' field is added on the 'Update Details' modal and is editable, and when the modal is closed, the updated value should populate on the Announcement Specific Settings section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    #516289-C
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly see fields "PreEncumbranceAmount__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #NYSED-2114
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-C
    And I wait for "2" seconds
    #@516276
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    #516279
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
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
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    #517082-C
    Then I softly cannot see top right button "Update Details" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #516279
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    ##NYSED-2114
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "11" into field "Bud_Stop__c"
    When I enter in modal value "22" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-C #516276
    And I wait for "2" seconds
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+11}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+22}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    #NYSED-2115
    Then I softly cannot see the following messages in the page details contains:
      | The announcement cannot be published because OSC approval is not received. Please contact the FD user to update the 'OSC Approved?' value using the Update Details button. |
    #516279
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    ##NYSED-2114
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "3" into field "Bud_Stop__c"
    When I enter in modal value "6" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-C #@516276
    And I wait for "2" seconds
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+3}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+6}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    #516279
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly cannot see top right button "Update Details" in page detail
    And I navigate to "Financials" sub tab
    Then I cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:ClosedCompetitiveAnnouncement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedCompetitiveAnnouncement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    #NYSED-2114
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "2" into field "Bud_Stop__c"
    When I enter in modal value "4" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    #511594-C #@516276
    And I wait for "2" seconds
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+2}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+4}"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @519306-C @534228-C @Sprint-08 @US-518025 @M04Announcement
  Scenario Outline: Verify that 'hyphen' (-) is added in the Fund Year value in Overview tab-->Information section on Announcement layouts
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Fund Year" as "1990-30"
    When I click on "Edit" in the page details
    Then I softly see field "Fund Year" is not editable
    And I click on "Save" in the page details
     #534228
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
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
      #534228
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
      #534228
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
      #534228
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    Then I softly see field "Fund Year" as "1990-30"
    When I click on "Edit" in the page details
    Then I softly see field "Fund Year" is not editable
    And I click on "Save" in the page details
    #534228
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | PO       | {SavedValue:PO Username} |
#      | FO       | {SavedValue:FO Username} |
#      | FD       | {SavedValue:FD Username} |

  @519309 @Sprint-08 @US-518025 @M04Announcement
  Scenario Outline: Verify that 'hyphen' (-) is added in the Fund Year column in Announcements (All, Draft, Published, Rejected, Closed and Archived, My Records) list views on landing page of Announcements module
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I get the "EGMS ID"
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    #519309
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Fund Year |
      | 1990-30   |
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    #519309
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Fund Year |
      | 1990-30   |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:AEGMSID}" with properties "default"
    And I click toggle button to select "Announcements - Published"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    #519309
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Fund Year |
      | 1990-00   |
    And I click toggle button to select "Announcements - Closed and Archived"
    When I perform quick search for "{SavedValue:ClosedCompetitiveAnnouncement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    #519309
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Fund Year |
      | 1990-30   |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @519310 @Sprint-08 @US-518025 @M04Announcement
  Scenario Outline: Verify that 'hyphen' (-) is added in the Fund Year column in Announcements (All, Draft, Published, Rejected, Closed and Archived, My Records) list views on landing page of Announcements module
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "AEGMSID" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I click toggle button to select "Competitive Announcements - Published"
    When I perform quick search for "{SavedValue:AEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Fund Year |
      | 1990-00   |
    And I click toggle button to select "Competitive Announcements - Closed and Archived"
    When I perform quick search for "{SavedValue:ClosedCompetitiveAnnouncement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @520581 @Sprint-09 @518586 @M04Announcement
  Scenario Outline: Verify that the announcement owner can see that the existing Year field, which was required for Submit, is now required for Save on the Competitive Announcement layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "2" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I enter value "--None--" into field "NYSED_Year__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Year is required in the Overview tab under the Information section. |
    And I enter value "1991" into field "NYSED_Year__c"
    And I click on "Save" in the page details
    Then I softly see field "Year" as "1991"
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
    When I navigate to "Overview" sub tab
    And I enter value "Yes" into field "Soft_Application_Due_Date__c"
    And I click on "Save" in the page details
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

  @510578 @Sprint-07 @US-509836 @M04Announcement
  Scenario Outline: Verify that user should see data type of all currency fields at announcement layout->Financials tab, is changes to accept whole numbers only - Competitive Announcement FS-10 Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Financials" sub tab
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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

  @514176 @Sprint-07 @US-509836 @M04Announcement
  Scenario Outline: Verify that user should see data type of all currency fields at announcement layout->Financials tab, is changes to accept whole numbers only - Competitive Announcement Lump Sum Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "2" seconds
    And I enter value "Lump Sum" into field "Budget_Category_Package__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Financials" sub tab
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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

  @494996 @495174 @Sprint-06 @US-500360 @M04Announcement @rerunAnnouncement494996 @Bug-Ticket-NYSED-3052
  Scenario Outline: Verify that apart from FD users, other users (PM, PO, FO) cannot edit, remove, associate 'Funding Account' when competitive announcement is in status- Created, Under Revision, Submitted for Review, Review Completed, Publish
  |Verify that FD user can not associate and remove Funding Accounts but can edit funding accounts (Pre-Encumbrance is editable) when competitive announcement is in status- Publish |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
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
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    #Owner- Created state
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #owner - Send back / Under revision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I "Send to Owner" in the approval decision
    And I wait for "1" seconds
    #Owner- Created state
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
    #owner - Submit for Approval
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #owner - Send back / Under revision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
#    #Owner- Approved state
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "3" seconds
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
    Then I softly see field "Status" as "Published"
    #owner- Publish State
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #495174 FD- can edit but can not associate new or remove- Publish state
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |

  @494996_1 @NYSED-2761 @Sprint-06 @US-500360 @NYSEDSprint-24 @US-NYSED-1887 @M04Announcement
  Scenario Outline: Verify that apart from FD users, other users (EXE, Admin cannot edit, remove, associate 'Funding Account' when competitive announcement is in status- Created, Under Revision, Submitted for Review, Review Completed, Publish
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "Public Schools" into field "EligibleApplicantTypes__c"
    And I enter value "BOCES" into field "EligibleApplicantTypes__c"
    And I enter value "Library Systems/Libraries" into field "EligibleApplicantTypes__c"
    And I enter value "Local Governments" into field "EligibleApplicantTypes__c"
    And I enter value "Institutions of Higher Education" into field "EligibleApplicantTypes__c"
    And I enter value "Community Based Organizations" into field "EligibleApplicantTypes__c"
    And I enter value "Museums & Historical Societies" into field "EligibleApplicantTypes__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    # Created state
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
    When I navigate to "Responsibilities" sub tab
    And I click on "Submit For Approval" in the page details
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
    # Send back / Under revision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Responsibilities" sub tab
    And I click on "Submit For Approval" in the page details
      # Approved state
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Responsibilities" sub tab
    And I click on "Publish" in the page details
    # Publish State
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
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I wait for "3" seconds
    #NYSED-2761
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
      | UserType |
      | EXE      |
#      | Admin       |

  @494998-Sprint6 @519309 @Sprint-06 @US-500360 @M04Announcement
  Scenario: Verify that FD users cannot edit 'Pre-Encumbrance' field when competitive announcement is in status- Submitted for Approval, Approved and Rejected Status
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
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
    # Submit for Approval state
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #Approver approves announcement
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I "Approve" in the approval decision
    And I wait for "1" seconds
    #Approve state
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
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
    # Undo announcement
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Undo" in the page details
    And I wait for "1" seconds
    And I "Reject" in the approval decision
    And I wait for "1" seconds
    #Reject state
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Rejected"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    #519309
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Type | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Fund Year |
      | 1990-30   |
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Rejected"
    When I perform quick search for "{SavedValue:RejectedStateAnnouncement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    #519309
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    Then I see the following rows under the following columns in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Fund Year |
      | 1990-30   |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
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

  @495081-Sprint6 @Sprint-06 @US-500360 @M04Announcement
  Scenario: Verify that when announcement owner sends record to the reviewer (FD) with Edit access as no, still he can updates amounts on Funding information section and can associate new funding account - Competitive  Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:peerReviewTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FD Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I softly can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"

  @495080-Sprint6 @Sprint-06 @US-500360 @M04Announcement
  Scenario: Verify that when announcement owner sends record to the reviewer (PM, PO, EXE, Admin, and FO) with Edit access as yes, he can not updates amounts on Funding information section and associate new funding account- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:peerReviewTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I enter the following values into flex table with id "---announcement:-:peerReviewTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I enter the following values into flex table with id "---announcement:-:peerReviewTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I enter the following values into flex table with id "---announcement:-:peerReviewTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I enter the following values into flex table with id "---announcement:-:peerReviewTableId---" by clicking "New" :
      | Name                        | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:ADMIN Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:ADMIN Username}" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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

  @495067-Sprint6 @Sprint-06 @US-500360 @M04Announcement
  Scenario: Verify that when FD users, updates amounts on Funding information section, amounts should be recalculated on funding account- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
   # Created state
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | #$34            |
    Then I softly see value "$34" for title "Pre-Encumbrance" against the value "---AUTOEnvData:-:fundingAccount---" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_Internal"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_Internal}" for title "Available Balance" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | -22             |
    Then I softly see the following messages in the page details contains:
      | Pre Encumbrance cannot be less than zero |
    And I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | #$34            |
    Then I softly see value "$34" for title "Pre-Encumbrance" against the value "---AUTOEnvData:-:fundingAccount2---" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    And I click on hyperlink containing value "{SavedValue:fundingAccount2}"
    And I wait for "5" seconds
    And I save the field labeled "Available Balance" as "AvailableBalance_External"
    And I click on back arrow
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:AvailableBalance_External}" for title "Available Balance" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 90000000000000  |
    Then I softly see the following messages in the page details contains:
      | Available Balance cannot be negative. Please adjust the Cert Level accordingly. |
    And I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record

  @494996_Closed @506559_Closed @Sprint-06 @US-500360 @M04Announcement
  Scenario Outline: Verify that apart from FD users, other users cannot edit, remove, associate 'Funding Account' when competitive announcement is in status-  Closed
  |Verify that apart from FD users, other users cannot edit, remove, associate 'Funding Account' when Directed/Formula announcement is in status- Closed|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    #Competitive Announcement
    When I perform quick search for "---AUTOEnvData:-:ClosedCompetitiveAnnouncement---" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:ClosedCompetitiveAnnouncement---" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #Formula Announcement
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |

  @495174_Closed @Sprint-06 @US-500360 @M04Announcement
  Scenario: Verify that FD user can not associate and remove Funding Accounts but can edit funding accounts (Pre-Encumbrance is editable) when competitive announcement is in status- Closed
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    #Competitive Announcement
    When I perform quick search for "---AUTOEnvData:-:ClosedCompetitiveAnnouncement---" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:ClosedCompetitiveAnnouncement---" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #Formula Announcement
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"

  @517247-C @517249-C @Sprint-08 @US-514910 @M05
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Create Application' button at the qualified opportunity layout, and the user can create the Application.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    And I wait for "3" seconds
    #517247-C #517249-C
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | UserType   |
      | GRANTEE_CE |
      | GRANTEE_SC |

  @517250 @517251 @517252 @Sprint-08 @US-514910 @M05
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Create Application' button at the qualified opportunity layout, and the user can create the Application.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
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

  @517207-C @517214-C @Sprint-08 @US-514909 @M05
  Scenario Outline:Verify that the Create and Edit Role user can see the 'Qualify' button at the publish opportunity page, and the user can qualify the opportunity.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
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

  @517225-C @517229-C @517230-C @Sprint-08 @US-514909 @M05
  Scenario Outline:Verify that the LEA Admin Role user cannot see the 'Qualify' button at the publish opportunity page.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
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

  @516376 @516378 @516380 @516382 @516386 @Sprint-08 @US-514224 @M05
  Scenario Outline:Verify that the Grantee user does not see the following columns in the 'Published' Opportunity list view, as they have been removed: Funding Organization, Pre-Application Required?
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    Then I see only the following headers in table with id "---applicationIntake:-:publishedOpputunityTableId---" :
      | Actions | EGMS ID | Opportunity Name | Opportunity Release Date | Application Due Date | Status |
    #516378
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    Then I see only the following headers in table with id "---applicationIntake:-:activeOpportunitiesTableId---" :
      | Actions | EGMS ID | Announcement Name | FOA Release Date | Application Due Date | Status |
    When I click toggle button to select "Not Yet Qualified Opportunities - Closed"
    Then I see only the following headers in table with id "---applicationIntake:-:activeOpportunitiesTableId---" :
      | Actions | EGMS ID | Announcement Name | FOA Release Date | Application Due Date | Status |
    When I click toggle button to select "Not Yet Qualified Opportunities - Open"
    Then I see only the following headers in table with id "---applicationIntake:-:activeOpportunitiesTableId---" :
      | Actions | EGMS ID | Announcement Name | FOA Release Date | Application Due Date | Status |
       #516382
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Converted to Application - All"
    Then I see only the following headers in table with id "---applicationIntake:-:convertedToApplicationTableID---" :
      | Actions | EGMS ID | Opportunity Name | Opportunity Release Date | Application Due Date | Status |
    When I click toggle button to select "Opportunities Converted to Application - Open"
    Then I see only the following headers in table with id "---applicationIntake:-:convertedToApplicationTableID---" :
      | Actions | EGMS ID | Opportunity Name | Opportunity Release Date | Application Due Date | Status |
    When I click toggle button to select "Opportunities Converted to Application - Closed"
    Then I see only the following headers in table with id "---applicationIntake:-:convertedToApplicationTableID---" :
      | Actions | EGMS ID | Opportunity Name | Opportunity Release Date | Application Due Date | Status |
    #516386
    And I navigate to "Applications" tab
    Then I softly do not see "Pre-Application" content inside "Applications" subheader on left panel
    #516380
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    When I click toggle button to select "Qualified Opportunities - All"
    Then I see only the following headers in table with id "---applicationIntake:-:qualifiedTableId---" :
      | Actions | EGMS ID | Opportunity Name | Opportunity Release Date | Application Due Date | Status |
    When I click toggle button to select "Qualified Opportunities - Closed"
    Then I see only the following headers in table with id "---applicationIntake:-:qualifiedTableId---" :
      | Actions | EGMS ID | Opportunity Name | Opportunity Release Date | Application Due Date | Status |
    When I click toggle button to select "Qualified Opportunities - Open"
    Then I see only the following headers in table with id "---applicationIntake:-:qualifiedTableId---" :
      | Actions | EGMS ID | Opportunity Name | Opportunity Release Date | Application Due Date | Status |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |
#      | GRANTEE_LEA|
#      | GRANTEE_VO |
#      | GRANTEE_NU |

  @518799 @Sprint-08 @US-506811 @M05
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' as a picklist field with Yes/No dropdown options is added at the create announcement modal->Information Section: Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    When I hovering mouse on help text icon inside modal "Is Announcement for Direct Grant?"
    Then I softly see "This field indicates whether or not this announcement will be used for direct grants." shown as help text
    #518799
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @518804 @518807 @518811 @522707 @518836 @518862 @518863 @518874 @Sprint-08 @US-506811 @M05
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' field is required field at the create announcement modal->Information Section: Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
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
    #518807
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
    #518811 #518862
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts section" page block displayed
    Then I softly do not see "Q & A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block
    #518854
    Then I softly do not see "Contacts" inside page block detail
    #518863
    Then I softly see field "Grant Abbreviation" added after "First Payment %"
     #522707
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?" inside page block
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "No" into field "NYSED_FARequiredForAmendment__c"
    And I enter value "10" into field "First_Payment__c"
    And I enter value "Justified" into field "AnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I wait for "3" seconds
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #518836
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section. |
    #518854
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role.         |
      | Overview Tab - At least one contact should have the 'Program Contact' Role.        |
    #518862
      | Overview Tab - Provide the Application Due Date.                                   |
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    #518874
    Then I softly cannot see top right dropdown button "Publish" in page detail
    Then I softly cannot see top right dropdown button "Revise" in page detail
    Then I softly cannot see top right dropdown button "Extend Dates" in page detail

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @518868 @Sprint-08 @US-506811 @M05
  Scenario Outline: Verify that the Announcement Owner cannot see 'Grant Abbreviation' field is added after 'First Payment %' on announcement layout in Overview->Announcement Specific Settings when option for 'Is Announcement for Direct Grant?' is selected as 'No'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    #518868
    Then I softly cannot see field "Grant Abbreviation" inside page block
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @535950 @Sprint-13 @US-533103 @M04 @M04Announcement
  Scenario Outline:Verify that the internal user sees that on the Announcement layout -> Overview tab -> Announcement Specific Settings section, a new required field 'Fiscal Approval Required for Amendment?' is added.: Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "2" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
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
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
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
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - 'Fiscal Approval Required for Amendment?' is required to submit for approval. |
    Given I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I enter value "Yes" into field "NYSED_FARequiredForAmendment__c"
    When I click on "Save" in the page details
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

  @535890 @NYSED-1169 @Sprint-13 @US-533069 @M04Announcement @US-NYSED-928 @M05
  Scenario Outline: Verify that the internal user sees that the 'Budgeting is Required for:' field is editable and OOTB drop down values are available for selection on Announcement Layout->Financials Tab->Budget Specific settings, if the budget type is selected as 'Lump Sum'
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition_LS" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    Then I softly see field "Is a Detailed Budget Required on the Application?" as "No"
    #NYSED-1169
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    When I hovering mouse on page block help text icon inside table "---announcement:-:fundingAccountsTableId---" for LWC
    Then I softly see the text containing :
      | This is the current balance of Pre - encumbrance after subtracting Outstanding Encumbrance Balance |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see fields "BudgetingPeriod__c" is in edit mode
    Then I see only the following ordered options in dropdown field "BudgetingPeriod__c" :
      | --None-- | All Budget Periods | Only First Budget Period |
    And I enter value "All Budget Periods" into field "BudgetingPeriod__c"
    When I click on "Save" in the page details
    Then I softly see field "Budgeting is Required for:" as "All Budget Periods"
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @540982 @NYSEDSprint-16 @US-540520 @M04 @skipOnJenkins
  Scenario Outline:Verify that for a competitive announcement where 'Is Announcement for Direct Grant?' is set to Yes, the announcement owner sees only organizations with institution IDs on the Add Organizations modal.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    #540982
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
    Then I softly see field "Institution ID" as "166,485,411,254"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I pause execution for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    #540982
    Then I softly see value "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" for title "Applicants" against the value "CACP139" inside table "---announcement:-:directedInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | PM       |

  @535949 @NYSEDSprint-13 @US-526615 @M05
  Scenario Outline: Verify that the 'Is Announcement for Direct Grant?' field is added after the Announcement Name field in the Competitive Announcement list views (All, Draft, Published, Rejected, Closed and Archived, My Records).
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Competitive Announcements - Created"
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Competitive Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Competitive Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Competitive Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |

  @535952 @NYSEDSprint-13 @US-526615 @M05
  Scenario Outline: Verify that the 'Is Announcement for Direct Grant?' field is added after the Announcement Name field in the Directed Announcement list views (All, Draft, Published, Rejected, Closed and Archived, My Records).
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Directed Announcements - Created"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Directed Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Directed Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Directed Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |

  @535954 @NYSEDSprint-13 @US-526615 @M05
  Scenario Outline: Verify that the 'Is Announcement for Direct Grant?' field is added after the Announcement Name field in the Formula Announcement list views (All, Draft, Published, Rejected, Closed and Archived, My Records).
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Formula Announcements - Created"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Formula Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Formula Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |
    And I click toggle button to select "Formula Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Fund Year | Announcement Name | Is Announcement for Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |

  @535948 @NYSEDSprint-13 @US-526615 @M05
    @NYSED-10275 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Verify that the 'Is Announcement for Direct Grant?' field is added after the Type field in the announcement list views (All, Draft, Published, Rejected, Closed and Archived, My Records) on the landing page of the Announcements module.
  |Verify that the Internal User can see that on the Announcements -All table, Announcement list views, a new column, Funding Type is added after the Type column.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I click toggle button to select "Announcements - All"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I click toggle button to select "Announcements - Closed and Archived"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I click toggle button to select "Announcements - Published"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    And I click toggle button to select "Announcements - Rejected"
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |
#        | ADMIN      |

  @NYSED-2179 @NYSED-2178 @NYSED-2187 @NYSED-2186 @NYSEDSprint-23 @US-NYSED-2087 @US-NYSED-2088 @M04
  Scenario Outline: Verify with the Program owner that applications in the Created state are unable to be seen in the Related Applications section for competitive announcements.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
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
    #NYSED-2179
    Then I softly see "No Records Found" inside flex table with id "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2187
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---"
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
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 12             | 12  | 100                    | 100                                                | 1000             | 100        | 100            |
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
    #NYSED-2178
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2186
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
    #NYSED-2178
    Then I softly see value "Review Initiated" for title "Status" inside table "---program:-:RelatedApplicationsTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:ApplicationmEGMSID}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    #NYSED-2186
    Then I softly see value "Review Initiated" for title "Status" inside table "---applicationReview:-:relatedFOApplicationsTableId---"

    Examples:
      | UserType   | Announcement Name                                        | AnnouncementOwner |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PM                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | PO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FO                |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} | FD                |

  @NYSED-2506-C @NYSED-1883-C @NYSEDSprint-24 @US-NYSED-1826 @M04 @M04Announcement
  Scenario Outline: Verify that apart from FD users, other users (EXE, Admin cannot edit, remove, associate 'Funding Account' when competitive announcement is in status- Created, Under Revision, Submitted for Review, Review Completed, Publish
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    #NYSED-2506
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "Revisions Allowed?" as "Yes"
    Then I softly see field "Deputy Area" as "OHE"
    #NYSED-1883
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    And I enter value "No" into field "Carry_Over__c"
    And I enter value "No" into field "Carryover_Limit__c"
    And I enter value "11.5" into field "Carryover_Limit_Percent__c"
    When I click on "Save" in the page details
    #NYSED-2506
    Then I softly see field "Deputy Area" as "P-12"
    #NYSED-1883
    Then I softly see field "Carry Over" as "No"
    Then I softly see field "Carry Over Limit" as "No"
    Then I softly see field "Carry Over Limit %" as "11.50%"

    Examples:
      | UserType |
      | FD       |
#      | PO       |
#      | FO       |
#      | PM       |
#      | EXE      |

  @NYSED-2159 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with the Announcement Owner that in case of multiple if the 'Key Contact' check box is selected 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for a Competitive announcement.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    #@NYSED-2159
    When I navigate to "Overview" sub tab
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
      | Name          | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | checked        |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    #@NYSED-2159
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    #@NYSED-2159
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation EXE | unchecked      |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | unchecked      |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | checked        |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |

  @NYSED-1099 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify with the Ann Owner if the 'Key Contact' check box is not selected/More than 1Contact for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for Formula announcement By Applicant By Focus Area    When I navigate to "Announcements" tab
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Responsibilities" sub tab
    Then I click on "Save" in the page details
    And I wait for "3" seconds
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
    And I wait for "3" seconds
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "Automation FO" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "Automation FO" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Project Role      | Is Key Contact |
      | Automation Fiscal | checked        |
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Project Role      | Is Key Contact |
      | Automation Fiscal | unchecked      |
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PM       | {SavedValue:PM Username} | EXE      | PO           | {SavedValue:PO Username} |

  @NYSED-1101 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that the Forwarded User is able to see the updated data in the contact section in read-only mode For Competitive announcement.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    And I click on "Submit For Approval" in the page details
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly cannot see row level action button "Edit" against "Fiscal Contact" in flex table with id "---announcement:-:contactTableId---"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |


  @NYSED-1102 @NYSED-2472 @NYSED-2481 @NYSED-2498 @NYSED-2486 @NYSEDSprint-21 @US-NYSED-2248 @NYSEDSprint-24 @US-NYSED-927 @M04
  Scenario Outline:Verify that when Send Back is selected then again record get in created state and able to updated data in the contact section For Competitive announcement.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:fundingAccount2}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---fundingsource:-:fundingTableId---"
    And I navigate to "Messages" sub tab
    And I pause execution for "2" seconds
    And I save the field labeled "Funding Account Message" as "FederalFundingAccountMessage"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:fundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:fundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---"
    And I navigate to "Messages" sub tab
    And I pause execution for "2" seconds
    And I save the field labeled "Funding Account Message" as "StateFundingAccountMessage"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I perform quick search for "{SavedValue:fundingAccount2}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    #NYSED-2486
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | Pre-Encumbrance | Pre-Encumbrance Balance |
    #NYSED-2486
    Then I softly see value "{SavedValue:StateFundingAccountMessage}" for title "Funding Account Message" against the value "{SavedValue:fundingAccount}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:FederalFundingAccountMessage}" for title "Funding Account Message" against the value "{SavedValue:fundingAccount2}" inside table "---announcement:-:fundingAccountsTableId---"
    When I click on "Update Details" in the page details
    When I enter in modal value "-1" into field "Bud_Stop__c"
    When I click modal button "Save"
    #NYSED-2472
    Then I softly see the following messages in the page details contains:
      | Bud Stop date cannot be set to a past date. |
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "-1" into field "Pay_Stop__c"
    When I click modal button "Save"
    #NYSED-2481
    Then I softly see the following messages in the page details contains:
      | Pay Stop date cannot be set to a past date. |
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    #NYSED-2472
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    #NYSED-2481
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    And I click modal button "Close"
    And I navigate to "Overview" sub tab
    #NYSED-2472
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    #NYSED-2481
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter value "--None--" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    #NYSED-2498
    Then I softly see the following messages in the page details contains:
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "--None--" into field "Soft_Application_Due_Date__c"
    And I enter value "Yes" into field "Soft_Application_Due_Date__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    #NYSED-2498
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Send to Owner" in the approval decision
    Then I softly can see row level action button "Edit" against "Program Contact" in flex table with id "---announcement:-:contactTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Contact" in flex table with id "---announcement:-:contactTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType | Approver                 | NonOwner |
      | PM       | {SavedValue:PM Username} | EXE      |
#      | FO       | {SavedValue:FO Username} | EXE      |
#      | FD       | {SavedValue:FD Username} | EXE      |
#      | PO       | {SavedValue:PO Username} | EXE      |

  @NYSED-2493 @NYSED-2497 @NYSEDSprint-24 @US-NYSED-1826 @M04 @M04Announcement
  Scenario Outline:Verify that the internal user sees that on the Announcement layout -> Overview tab -> Announcement Specific Settings section, a new required field 'Fiscal Approval Required for Amendment?' is added.: Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I pause execution for "2" seconds
    #NYSED-2493 #NYSED-2497
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "Revisions Allowed?" as "Yes"
    When I enter in modal value "No" into field "IsAdvancePermitted__c"
    When I enter in modal value "No" into field "IsNegotiationsAllowed__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    #NYSED-2493 #NYSED-2497
    Then I softly see field "Advance Payment Allowed?" as "No"
    Then I softly see field "Revisions Allowed?" as "No"

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @NYSED-2079 @NYSEDSprint-22 @US-NYSED-1816 @M04
  Scenario Outline:Verify that the Forwarded User is able to see the updated data in the contact section in read-only mode For Competitive announcement.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    #NYSED-2079
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    And I clear the value from field "MaxApplicationsAllowed__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "2" into field "MaxApplicationsAllowed__c"
    When I click on "Save" in the page details
    Then I softly see field "Maximum # Applications Allowed" as "2"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. Leave blank if there is no limit." shown as help text

    Examples:
      | UserType | Approver                 | NonOwner | ReviewerUser | Reviewer                 |
      | PO       | {SavedValue:PO Username} | EXE      | PM           | {SavedValue:PM Username} |

  @NYSED-1501 @NYSEDSprint-22 @US-NYSED-1229 @M05
  Scenario Outline: Verify with Internal User (announcement owner), if they click on the 'Unpublish' button and the application has been created on the announcement, unable to  change some information - Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTED_COMPETATIVE_DETAILE_BUDGET_YES"
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
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I softly see field "Subaward Floor" is not editable
    Then I softly see field "Subaward Ceiling" is not editable
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

  @NYSED-1503 @NYSEDSprint-22 @US-NYSED-1229 @M05
  Scenario: Verify with Internal Profile(Announcement Owner), when announcement is in 'Under Revision' status and application review is initiated, then some fields from the review step are read-only -Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
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

  @NYSED-3410 @NYSED-3411 @US-NYSED-2887 @yugaC
  Scenario: Verify that the Grantee user sees an Announcement Name column renamed to Opportunity Name on the Home phase → Competitive Opportunities section.
  |Verify that the Grantee user sees an Organization Name column is hidden/removed on the Home phase → Competitive Opportunities section.|
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Home" tab
    #NYSED-3410
    Then I see only the following headers in table with id "---announcement:-:competitiveOpportunitiesTableId---" :
      | Actions | Opportunity Name | Status | Application Due Date |
    #NYSED-3411
    Then I softly do not see "Organization Name" in flex table header "---announcement:-:competitiveOpportunitiesTableId---"

  @NYSED-7199 @Sprint-32 @US-NYSED-6293 @M05 @yugaC
  Scenario Outline: Verify that on FDM record Internal user can see columns 'Cert Level' and 'Available balance' are added on funding accounts - read-only , available with totals and correct values should show up from the related funding accounts
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    Then I softly see field "Revisions Allowed?" inside page block
    Then I softly see asterisk mark on "Revisions Allowed?"
    And I enter value "--None--" into field "IsNegotiationsAllowed__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Revisions Allowed? is required in the Announcement Specific Settings section. |
    Examples:
      | UserType |
      | PM       |