@globalSearch @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios for the global search

  @387431 @387434 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate EXE user is able to see the global search bar for an announcement
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    Then I softly see global search display at top of the page
    #387434
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @387457 @ValidatetherecordownerisabletoedittheaccessforrecordwhenannouncementisintheCreatedsubmitforrevieworinUnpublishedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate the record owner is able to edit the access for record when announcement is in the Created, submit for review or in Unpublished state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Review"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Under Revision"

  @387461 @ValidatethatNonOwneruserdoesnthaveaneditoptioninanystageofannouncementandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that Non-Owner user doesn't have an edit option in any stage of announcement and will get error message on page
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "Edit" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Under Revision"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Rejected"
#   Rejected State
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Rejected"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
#   Closed State
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:ClosedStateAnnouncement}"
    And I click on row level action button "Edit" against "{AUTOEnvData:ClosedStateAnnouncement}" in global search with id "Announcements"
    Then I softly see field "Status" as "Closed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
#    Archived State
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}"
    And I click on row level action button "Edit" against "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in global search with id "Announcements"
    Then I softly see field "Status" as "Archived"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @387477 @Validateuserisnotabletochangetheownerinanystateofannouncementandwillgettheerrormessageandnonowneruserisnotabletoseethechangeowneroption  @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate user is not able to change the owner in any state of announcement and will get the error message and non-owner user is not able to see the change owner option
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    And I click on row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see "Change Owner" opens in overLay window
    When I click modal button "Cancel"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"

  @387731 @ValidatePMuserhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenannouncementisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate PM user have edit access for record only when edit access setting is yes for peer reviewer when announcement is a submit for review state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @387762 @ValidatePMuserdoesnothaveeditaccessforpeerreviewthenPMuserwillgeterrormessageforannouncementwhenannouncementisinthesubmitforreviewstateorinReviewedstates @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate PM user does not have edit access for peer review then PM user will get error message for announcement when announcement is in the submit for review state or in Reviewed states
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @387769 @Validateuserisabletoseethen5mostrecentlyusedrecordsinthedropdownlistwhenuserclicksonsearchinputboxforannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @387772 @Validatethatuserisabletoseetheallthelistofmodulesafterclickingonsuggestedforyousectionforannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to see the all the list of modules after clicking on 'suggested for you section' for announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    Then I softly see dropdown option "All" under the "Suggested For You" section
    Then I softly see dropdown option "Amendment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Announcements" under the "Suggested For You" section
    Then I softly see dropdown option "Applications" under the "Suggested For You" section
    Then I softly see dropdown option "Chatter" under the "Suggested For You" section
    Then I softly see dropdown option "Closeouts" under the "Suggested For You" section
    Then I softly see dropdown option "Contacts" under the "Suggested For You" section
    Then I softly see dropdown option "Events" under the "Suggested For You" section
    Then I softly see dropdown option "Focus Areas" under the "Suggested For You" section
    Then I softly see dropdown option "Funding Decision Memos (FDM)s" under the "Suggested For You" section
    Then I softly see dropdown option "Grants" under the "Suggested For You" section
    Then I softly see dropdown option "Key Performance Indicators (KPI)s" under the "Suggested For You" section
    Then I softly see dropdown option "Organizations" under the "Suggested For You" section
    Then I softly see dropdown option "Payment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Programs" under the "Suggested For You" section
    Then I softly see dropdown option "Progress Report" under the "Suggested For You" section
    Then I softly see dropdown option "Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reviews" under the "Suggested For You" section
    Then I softly see dropdown option "Risk Assessment" under the "Suggested For You" section
    Then I softly see dropdown option "Site Visits" under the "Suggested For You" section
    Then I softly see dropdown option "Strategic Plans" under the "Suggested For You" section
    Then I softly see dropdown option "Subawards" under the "Suggested For You" section
    Then I softly see dropdown option "Tasks" under the "Suggested For You" section

  @388883 @388920 @ValidatethatEXEuserisabletoseetheglobalsearchbarforanInternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that EXE user is able to see the global search bar for an Internal Program
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    Then I softly see global search display at top of the page
    #388920
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @388932 @Validatethatuserisabletoseethe5mostrecentlyusedrecordsinthedropdownlistwhenuserclicksonsearchinputboxforInternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for Internal Program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @388921 @ValidatethattherecordownerisabletoedittheaccessforrecordwhenInternalProgramisintheCreatedsubmitforreviewandBeingAmendedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that the record owner is able to edit the access for record when Internal Program is in the Created, submit for review and Being Amended state
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Reviewed"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "4" seconds
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Being Amended"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @388924 @ValidatethatNonOwneruserdoesnthaveaneditoptioninanystateofInternalProgramandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that Non-Owner user doesn't have an edit option in any state of Internal Program and will get error message on page
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @388926 @ValidatethatuserisnotabletochangetheownerinanystateofInternalProgramandwillgettheerrormessageandnonowneruseisnotabletoseethechangeowneroption @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is not able to change the owner in any state of Internal Program and will get the error message and non-owner user is not able to see the change owner option
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Change Owner" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I wait for "2" seconds
    And I select users value "Automation PM1" in field "forceSearchInputLookup"
    When I click modal button "Submit"
    Then I softly see the following messages in the page details contains:
      | You cannot change the owner from this screen. Click Cancel, and navigate to Home. Then select Ownership Reassignment. |
    When I click modal button "Cancel"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"

  @388928 @ValidateEXEhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenInternalProgramisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validte EXE have edit access for record only when edit access setting is yes for peer reviewer when Internal Program is a submit for review state
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @388930 @ValidateEXEuserdoesnothaveeditaccessforpeerreviewthenEXEuserwillgeterrormessageforInternalProgramwhenInternalProgramisinthesubmitforreviewstateorinReviewedstates @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate EXE user does not have edit access for peer review then EXE user will get error message for Internal Program when Internal Program is in the submit for review state or in Reviewed states
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @388935 @ValidatethatuserisabletoseetheallthelistofmodulesafterclickingonsuggestedforyousectionforInternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to see the all the list of modules after clicking on 'suggested for you section' for Internal Program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    Then I softly see dropdown option "All" under the "Suggested For You" section
    Then I softly see dropdown option "Amendment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Announcements" under the "Suggested For You" section
    Then I softly see dropdown option "Applications" under the "Suggested For You" section
    Then I softly see dropdown option "Chatter" under the "Suggested For You" section
    Then I softly see dropdown option "Closeouts" under the "Suggested For You" section
    Then I softly see dropdown option "Contacts" under the "Suggested For You" section
    Then I softly see dropdown option "Events" under the "Suggested For You" section
    Then I softly see dropdown option "Focus Areas" under the "Suggested For You" section
    Then I softly see dropdown option "Funding Decision Memos (FDM)s" under the "Suggested For You" section
    Then I softly see dropdown option "Grants" under the "Suggested For You" section
    Then I softly see dropdown option "Key Performance Indicators (KPI)s" under the "Suggested For You" section
    Then I softly see dropdown option "Organizations" under the "Suggested For You" section
    Then I softly see dropdown option "Payment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Programs" under the "Suggested For You" section
    Then I softly see dropdown option "Progress Report" under the "Suggested For You" section
    Then I softly see dropdown option "Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reviews" under the "Suggested For You" section
    Then I softly see dropdown option "Risk Assessment" under the "Suggested For You" section
    Then I softly see dropdown option "Site Visits" under the "Suggested For You" section
    Then I softly see dropdown option "Strategic Plans" under the "Suggested For You" section
    Then I softly see dropdown option "Subawards" under the "Suggested For You" section
    Then I softly see dropdown option "Tasks" under the "Suggested For You" section

  @388990 @388995 @ValidatehatEXEuserisabletoseetheglobalsearchbarforanAward @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that EXE user is able to see the global search bar for an Award
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    Then I softly see global search display at top of the page
    #388995
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @388859 @ValidatewhenanyuserglobalsearchanyrecordbyusingEGMSIDoranykeyword&clickonrecordandfindingtheresultthenthatrecordshouldopeninconsoletab @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate when any user global search any record by using EGMS ID or any keywords & click on record and finding the result then that record should open in console tab
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}" without processing
    And I click on record "{SavedValue:AnnEGMSID}" from global search
    Then I softly see field "Status" as "Created"

  @388949 @ValidatethatwhenanyuserglobalsearchanyrecordbyusingEGMSIDoranykeyword&clickonrecordandfindingtheresultthenthatrecordshouldopeninconsoletab @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that when any user global search any record by using EGMS ID or any keywords & click on record and finding the result then that record should open in console tab
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}" without processing
    And I click on record "{SavedValue:ProgramEGMSID}" from global search
    Then I softly see field "Status" as "Created"

  @388862 @ValidateuserredirecttothatrecordwhenusercliconanyhyperlinkprovidedEGMSIDInternalOrganizationCreatedbyonobjectsafterglobalsearchtheanyrecordforannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate user redirect to that record when user click on any hyperlink provided EGMS ID Internal Organization Created by on objects after global search the any record for announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:AnnEGMSID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:EXE Username}"
    Then I softly see the text containing "{SavedValue:EXE Username}"

  @388952 @ValidateuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedEGMSIDInternalOrganizationCreatedbyonobjectsafterglobalsearchtheanyrecordforinternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate user redirect to that record when user click on any hyperlink provided EGMS ID Internal Organization Created by on objects after global search the any record for internal Program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:ProgramEGMSID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:PM Username}"
    Then I softly see the text containing "{SavedValue:PM Username}"

  @387802 @ValidatethatuserisabletoexpandtheresultbyannouncementmoduleandFilter/RefinethetheresultbyconfiguredColumnsforanannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to expand the result by announcement module and Filter/Refine the the result by configured Columns for an announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "Announcements"
    And I perform quick search inside global search "Announcement"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "Application Due Date" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:PM Username}" by label "Created By" in left panel for global search
    Then I softly see value "{SavedValue:PM Username}" for title "Created By" inside table "Announcements"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search

  @388940 @ValidatethatuserisabletoexpandtheresultbyplanningmoduleandFilterRefinethetheresultbyconfiguredColumnsforanInternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to expand the result by planning module and Filter/Refine the the result by configured Columns for an Internal Program.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "Programs"
    And I perform quick search inside global search "Programs"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Program Name" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:PM Username}" by label "Created By" in left panel for global search
    Then I softly see value "{SavedValue:PM Username}" for title "Created By" inside table "Programs"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @387857 @ValidatethatadminuserwillseeallthelistofobjectsinthesearchresultwhicharementioninthelistReferDescriptionforglobalsearch @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that admin user will see all the list of objects in the 'search result' which are mention in the list (Refer Description) for global search
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    And I perform quick search inside global search "Announcement"
    And I click on "Show more" button on left navigation for global search
    Then I softly see the text "Config: Batch Jobs" on left navigation for global search
    Then I softly see the text "Contact Point Addresses" on left navigation for global search
    Then I softly see the text "Contact Point Emails" on left navigation for global search
    Then I softly see the text "Contact Point Phones" on left navigation for global search
    Then I softly see the text "Contact Point Phones" on left navigation for global search
    Then I softly see the text "Case Comments" on left navigation for global search
    Then I softly see the text "Task Config" on left navigation for global search
    Then I softly see the text "Step Progressbar Header Config" on left navigation for global search
    Then I softly see the text "SObject Config" on left navigation for global search
    Then I softly see the text "Page Layouts Config" on left navigation for global search

  @388946 @ValidatePMuserisabletoseethetableforextraobjectswhicharepresentinthesearchresultforPlanningmodule @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate PM user is able to see the table for extra objects which are present in the search result for Planning module
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "Programs"
    And I click on "Expand List" button on left navigation for global search
    And I click on "Show more" button on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Email Messages" on left navigation for global search
    Then I softly see the text "Notes" on left navigation for global search
    Then I softly see the text "Tasks" on left navigation for global search
    Then I softly see the text "Folders" on left navigation for global search

  @388338 @387972 @ValidateEXEuserisabletoseethetableforextraobjectswhicharepresentinthesearchresultforannouncementmodule @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate EXE user is able to see the table for extra objects which are present in the search result for announcement module
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I perform quick search inside global search "Announcement"
    And I click on "Show more" button on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Email Messages" on left navigation for global search
    Then I softly see the text "Notes" on left navigation for global search
    Then I softly see the text "Tasks" on left navigation for global search
    Then I softly see the text "Folders" on left navigation for global search
    #387972
    And I click on module "Events" on left navigation for global search
    Then I softly see the text containing "No results"
    And I click on module "Folders" on left navigation for global search
    Then I softly see the text containing "No results"
    And I click on module "Holidays" on left navigation for global search
    Then I softly see the text containing "No results"
    And I click on module "List Emails" on left navigation for global search
    Then I softly see the text containing "No results"
    And I click on module "Topics" on left navigation for global search
    Then I softly see the text containing "No results"
    And I click on module "Dashboards" on left navigation for global search
    Then I softly see the text containing "No results"

  @388863 @ValidatethatrecordscountsshouldbeupdatedformatchingresultsformoduleslistedonfixedsidebarofleftnavigationafterglobalsearchanyrecordbyEGMSIDororganizationname&countremainsame0fornonmatchingrecords @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that records counts should be updated for matching results for modules listed on fixed sidebar of left navigation after global search any record by EGMS ID or organization name & count remain same (0) for non matching records
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on "Expand List" button on left navigation for global search
    Then I softly see record count "1" for module "Announcements" on left navigation for global search
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "add123"
    Then I softly see record count "0" for module "Announcements" on left navigation for global search

  @388961 @ValidaterecordscountsshouldbeupdatedformatchingresultsformoduleslistedonfixedsidebarofleftnavigationafterglobalsearchanyrecordbyEGMSIDororganizationnamecountremainsame0fornonmatchingrecords @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate records counts should be updated for matching results for modules listed on fixed sidebar of left navigation after global search any record by EGMS ID or organization name & count remain same (0) for non matching records
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on "Expand List" button on left navigation for global search
    Then I softly see record count "1" for module "Programs" on left navigation for global search
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "add123"
    Then I softly see record count "0" for module "Programs" on left navigation for global search

  @388882 @ValidateusescansortanyobjectsafterglobalsearchanyrecordbyEGMSIDCreatedDateRelevanceAnnouncementNameInternalOrganizationApplicationDueDateStatus @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate user can sort any objects after global search any record by EGMS ID, Created Date, Relevance, Announcement Name, Internal Organization, Application Due Date, Status
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "Announcements"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Announcement Name" inside "Relevance" dropdown
    Then I softly see options "Application Due Date" inside "Relevance" dropdown
    Then I softly see options "Created By" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @388972 @ValidatethatusercansortanyobjectsafterglobalsearchanyrecordbyEGMSIDCreatedDateRelevanceInternalProgramInternalOrganizationApplicationDueDateStatus @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user can sort any objects after global search any record by EGMS ID, Created Date, Relevance, Internal Program, Internal Organization, Application Due Date, Status
    When I login to "As a Grantor" app as "PM" user
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "Programs"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Type" inside "Relevance" dropdown
    Then I softly see options "Program Name" inside "Relevance" dropdown
    Then I softly see options "Created By" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389538 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: VerifythattherecordownerisabletoedittheaccessforrecordwhenCloseoutRequestisintheCreatedAcknowledgedbySRSenttoreviewReviewedOverriddenorinUnpublishedstate
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "closeoutRequestNo"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutRequestNo}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutRequestNo}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutRequestNo}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutRequestNo}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    And I wait for "3" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    When I click on "Save" in the page details
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeout"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @389558 @VerifythatPeerreviewerhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenCloseoutisasubmittedforreviewandReviewedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that Peer reviewer have edit access for record only when edit access setting is yes for peer reviewer when Closeout is a submitted for review and Reviewed state.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeout"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeout"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @389644 @VerifythatuserisabletoexpandtheresultbyCloseoutandFilterRefinetheresultbyconfigureColumnsforanCloseout @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by Closeout and Filter/Refine the the result by configured Columns for an Closeout.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeouts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "Closeouts"
    And I perform quick search inside global search "CL--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Closeout" inside refine by filter
    Then I softly see "Grant EGMS ID" inside refine by filter
    Then I softly see "Project Name" inside refine by filter
    Then I softly see "Project Period" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "Closeouts"
    Then I softly see value "{SavedValue:EXE Username}" for title "Created By" inside table "Closeouts"

  @389645 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedEGMSIDGrantEGMSIDCreatedByonobjectsafterglobalsearchtheanyrecordf0orCloseout @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. -EGMS ID, Grant EGMS ID, Created By) on objects after global search the any record for Closeout.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I wait for "2" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:closeoutID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:EXE Username}"
    Then I softly see the text containing "{SavedValue:EXE Username}"

  @390081 @VerifythattherecordownerisabletoedittheaccessforrecordwhenFundingSourceisintheCreatedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Funding Source is in the Created state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    Then I softly can see row level action button "Change Owner" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    And I wait for "2" seconds
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @390082 @VerifythatNonOwneruserdoesnthaveaneditoptioninanystageofFundingsourcesandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that Non-Owner user doesn't have an edit option in any stage of Funding sources and will get error message on page.
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Draft"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourcesID}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingSourcesID}" inside table
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "Status" as "Activated"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourcesID}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingSourcesID}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see field "State" as "Closed"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "State" as "Closed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail

  @390084 @VerifythatuserisabletoexpandtheresultbyFundingSourceandFilterRefinethetheresultbyconfiguredColumnsforafundingSource @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by FundingSource and Filter/Refine the the result by configured Columns for a funding Source
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:FundingSourcesID}" for title "EGMS ID" inside table "Funding Sources"
    And I perform quick search inside global search "FS--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Funding Source Type" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see value "{SavedValue:FundingSourcesID}" for title "EGMS ID" inside table "Funding Sources"
    Then I softly see value "{SavedValue:EXE Username}" for title "Created By" inside table "Funding Sources"

  @390085 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedEGMSIDCreatedbyonobjectsafteglobalsearchtheanyrecordforFundingSources @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, Created by ) on objects after global search the any record for Funding Sources.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    And I wait for "2" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:FundingSourcesID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:FundingSourcesID}"
    Then I softly see the text containing "{SavedValue:FundingSourcesID}"

  @390107 @SubrecipientOrganizationVerifythattheAdminisabletoedittheaccessfororganizationwhenOrganizationiintheactivestate @sprint-2-US-386939  @GlobalSearch
  Scenario: Subrecipient Organization -> Verify that the Admin is able to edit the access for organization when Organization is in the active state.
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "Automation Permanent Organization for Risk Assessment"
    And I click on row level action button "Edit" against "Automation Permanent Organization for Risk Assessment" in global search with id "Organizations"
    Then I softly see the text containing "Automation Permanent Organization for Risk Assessment"
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @390112 @SubrecipientOrganizationVerifythaNonwneruserdoesnthaveaneditoptioninanyOrganizationandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario: Subrecipient Organization -> Verify that Non-owner user doesn't have an edit option in any Organization and will get error message on page.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "Automation Permanent Organization for Risk Assessment"
    And I click on row level action button "Edit" against "Automation Permanent Organization for Risk Assessment" in global search with id "Organizations"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390139 @390140-1 @VerifythattherecordownerisabletoedittheaccessforrecordwhenAmendmentisintheCreatedAcknowledgedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Amendment is in the Created, Acknowledged state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Acknowledged"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Acknowledged"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Activated"
    And I pause execution for "10" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "4" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Closed/Completed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390140-2 @VerifythattherecordownerisabletoedittheaccessforrecordwhenAmendmentisintheCreatedAcknowledgedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Amendment is in the Created, Acknowledged state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I click on "Reject" in the page details
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Rejected"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390145 @VerifythatuserisabletoexpandtheresultbyAmendmentmoduleandFilterRefinetheresultbyconfiguredColumnsforanAmendment @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by Amendment module and Filter/Refine the the result by configured Columns for an Amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests"
    And I perform quick search inside global search "CR--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Subaward ID" inside refine by filter
    Then I softly see "Subaward Title" inside refine by filter
    Then I softly see "Request Type" inside refine by filter
    Then I softly see "Initiated By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:budgetPChangeId}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390150 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedegEGMSIDonobjectsafterglobalsearchtheanyrecordforamendment @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID ) on objects after global search the any record for amendment.
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on hyperlink for global search containing value "{SavedValue:budgetPChangeId}"
    Then I softly see the text containing "{SavedValue:budgetPChangeId}"

  @390156 @390157-1 @VerifythattherecordownerisabletoedittheaccessforrecordwhenProgressReportisintheSubmittoGrantorandsenttoSRstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Progress Report is in the Submit to Grantor and sent to S/R state
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    Then I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Given I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 95     | 7             |
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                        | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390157-2 @VerifythattherecordownerisabletoedittheaccessforrecordwhenProgressReportisintheSubmittoGrantorandsenttoSRstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Progress Report is in the Submit to Grantor and sent to S/R state
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "3" seconds
    Given I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 95     | 7             |
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                        | Progress Report |
      | {SavedValue:PM Username}    | Step 1          |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    And I wait for "2" seconds
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:progID}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Progress Report"
    Then I softly see field "Status" as "Force Closed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390163 @VerifythatuserisabletoexpandtheresultbyProgressReportmoduleandFilterRefinetheresultbyconfiguredColumnsforanProgressReport @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Progress Report module and Filter/Refine the the result by configured Columns for an Progress Report
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "Progress Report"
    And I perform quick search inside global search "PR--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Grant Title" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Reporting Period Start Date" inside refine by filter
    Then I softly see "Reporting Period End Date" inside refine by filter
    Then I softly see "Due Date" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:progID}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "Progress Report"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Reports" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390169 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedegEGMSIDonobjectsafterglobalsearchtheanyrecordforProgressReport @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID ) on objects after global search the any record for Progress Report
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Progress Report" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on hyperlink for global search containing value "{SavedValue:progID}"
    Then I softly see the text containing "{SavedValue:progID}"

  @390190 @390201 @VerifythattherecordownerisabletoedittheaccessforrecordwhenRiskAssessmentisintheCreatedsubmitforrevieworinReviewedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Risk Assessment is in the Created, submit for review or in Reviewed state
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "RiskAssessmentApproverRoles" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "RiskAssessmentApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Complete Review" in page detail
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Reviewed"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID1"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I see status in Progress-bar is "Expired" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390220 @VerifythatPMRevieweruserhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenRiskAssessmentisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that PM Reviewer user have edit access for record only when edit access setting is yes for peer reviewer when Risk Assessment is a submit for review state
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "RiskAssessmentApproverRoles" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @390222 @VerifythatPMRevieweruserhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenRiskAssessmentisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that PM Reviewer user have edit access for record only when edit access setting is yes for peer reviewer when Risk Assessment is a submit for review state
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "RiskAssessmentApproverRoles" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Automation Test Description | 7        | NO                 |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390224 @VerifythatuserisabletoexpandtheresultbyRiskAssessmentmoduleandFilterRefinethetheresultbyconfiguredColumnsforanRiskAssessment @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Risk Assessment module and Filter/Refine the the result by configured Columns for an Risk Assessment.
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    Then I softly see value "{SavedValue:riskID}" for title "EGMS ID" inside table "Risk Assessment"
    And I perform quick search inside global search "RA-"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Effective Date" inside refine by filter
    Then I softly see "Expiration Date" inside refine by filter
    Then I softly see "Risk Level" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:riskID}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:riskID}" for title "EGMS ID" inside table "Risk Assessment"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Risk Assessment" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390225 @VerifythatuserisabletoexpandtheresultbyRiskAssessmentmoduleandFilterRefinethetheresultbyconfiguredColumnsforanRiskAssessment @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Risk Assessment module and Filter/Refine the the result by configured Columns for an Risk Assessment.
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    Then I softly see value "{SavedValue:riskID}" for title "EGMS ID" inside table "Risk Assessment"
    And I click on hyperlink for global search containing value "{SavedValue:riskID}"
    Then I softly see the text containing "{SavedValue:riskID}"

  @390304 @VerifythattherecordownerisnotabletoedittheaccessforrecordwhenPaymentRequestisintheSubmittograntorstate @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the record owner is not able to edit the access for record when Payment Request is in the Submit to grantor state.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "paymentEGMSID"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 20                       | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Payment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:paymentEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:paymentEGMSID}" in global search with id "Payment Requests"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390311 @VerifythattherecordownerisnotabletoedVerifythatuserisabletoexpandtheresultbyPaymentRequestmoduleandFilterRefinetheresultbyconfiguredColumnsforanPaymentRequest @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Payment Request module and Filter/Refine the the result by configured Columns for an Payment Request.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "paymentEGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Payment Request" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:paymentEGMSID}"
    Then I softly see value "{SavedValue:paymentEGMSID}" for title "EGMS ID" inside table "Payment Request"
    And I perform quick search inside global search "PR-"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Subaward Id" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Payment Period" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:paymentEGMSID}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:paymentEGMSID}" for title "EGMS ID" inside table "Payment Request"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Payment Requests" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390317 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedegEGMSIDSubawardIDonobjectsafterglobalsearchtheanyrecordforPaymentRequest @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, Subaward ID ) on objects after global search the any record for Payment Request.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "paymentEGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Payment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:paymentEGMSID}"
    Then I softly see value "{SavedValue:paymentEGMSID}" for title "EGMS ID" inside table "Payment Requests"
    And I click on hyperlink for global search containing value "{SavedValue:paymentEGMSID}"
    Then I softly see the text containing "{SavedValue:paymentEGMSID}"

  @390367 @390372 @SubrecipientOrganizationVerifythattheAdminisabletoedittheaccessforrecordwhenExternalOrganizationisintheApprovedstate @sprint-2-US-386939  @GlobalSearch
  Scenario:Subrecipient Organization ->Verify that the Admin is able to edit the access for record when External Organization is in the Approved state
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgApproved}" for title "Account Name" inside table "Organizations"
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgApproved}" in global search with id "Organizations"
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgApproved}" for title "External Organization" inside table "Organizations"
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgApproved}" in global search with id "Organizations"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390379 @SubrecipientOrganizationVerifythatNonOwneruserdoesnthaveaneditoptioninanystageofExternalSROrganizationandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario:Subrecipient Organization -> Verify that Non-Owner user doesn't have an edit option in any stage of External S/R Organization and will get error message on page
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I select "External Registration" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgInProgress}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgInProgress}" for title "External Organization" inside table "External Registration"
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgInProgress}" in global search with id "External Registration"
    Then I softly see field "Status" as "In Progress"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "5" seconds
    And I navigate to "Home" tab
    And I select "External Registration" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgSubmitforApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgSubmitforApproved}" for title "External Organization" inside table "External Registration"
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgSubmitforApproved}" in global search with id "External Registration"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "5" seconds
    And I navigate to "Home" tab
    And I select "External Registration" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgApproved}" for title "External Organization" inside table "External Registration"
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgApproved}" in global search with id "External Registration"
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Home" tab
    And I select "External Registration" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgRejected}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgRejected}" for title "External Organization" inside table "External Registration"
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgRejected}" in global search with id "External Registration"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @389520 @389525 @389537 @389536 @VerifythatthereviewownerisabletoeditSubmitDeclinetheaccessforrecordwhenReviewsareinsentforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the review owner is able to edit/Submit/Decline the access for record when Reviews are in sent for review state.
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews"
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" in global search with id "Reviews"
    And I wait for "2" seconds
    Then I softly see that "Status" is in "Sent for Review" status
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit" in page detail
    Then I can see top right button "Decline" in page detail
    And I wait for "5" seconds
    #@389536
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews"
    And I perform quick search inside global search "R-"
    Then I softly see "Review Form EGMS ID" inside refine by filter
    Then I softly see "Announcement EGMS Id" inside refine by filter
    Then I softly see "Form Name" inside refine by filter
    Then I softly see "Application EGMS ID" inside refine by filter
    Then I softly see "Assigned To" inside refine by filter
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see "Due Date" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" by label "Review Form EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Reviews" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews"
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" in global search with id "Reviews"
    And I wait for "2" seconds
    #@389525
    Then I softly see that "Status" is in "Sent for Review" status
    Then I cannot see top right button "Edit" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewCompleted}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewCompleted}" for title "Review Form EGMS ID" inside table "Reviews"
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewCompleted}" in global search with id "Reviews"
    And I wait for "2" seconds
    Then I softly see that "Status" is in "Review Completed" status
    Then I cannot see top right button "Edit" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewDecline}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewDecline}" for title "Review Form EGMS ID" inside table "Reviews"
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewDecline}" in global search with id "Reviews"
    And I wait for "2" seconds
    Then I softly see that "Status" is in "Review Declined" status
    Then I cannot see top right button "Edit" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews"
    And I click on hyperlink for global search containing value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    #@389537
    Then I softly see the text containing "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"

  @390386 @390389 @ValidateEXEuserisabletoseetheglobalsearchbarforSubrecipientOrganziation @sprint-2-US-386939 @GlobalSearch
  Scenario Outline: subrecipient organization ->Verify that user is able to expand the result by External S/R org module and Filter/Refine the the result by configured Columns for an External S/R org.
  |subrecipient Organization -> Verify that user redirect to that record when user click on any hyperlink provided (e.g. - Acc Name ) on objects after global search the any record for External S/R org.|
    When I login to "As a Grantor" app as "<User>" user
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Account Name" inside table "Organizations"
    And I click on hyperlink for global search containing value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see page title contains as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see field "Status" as "Active"
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Account Name" inside table "Organizations"
    Then I softly see "Account Name" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "EIN" inside refine by filter
    Then I softly see "DUNS" inside refine by filter
    Then I softly see "Organization Type" inside refine by filter
    Then I softly see "Created Date" inside refine by filter
    Then I softly see "Agency Abbreviation" inside refine by filter
    Then I softly see "Executive Office" inside refine by filter
    And I refresh the page
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I click on "Expand List" button on left navigation for global search
    Then I softly see record count "3" for module "Organizations" on left navigation for global search

    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @390420 @390405 @390408 @390410 @390424 @390428 @ValidateEXEuserisabletoseetheglobalsearchbarforanAwardDeskReview @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Award Desk Review is in the Created, submit for review and sent to grantor state
  |Verify that Non-Owner user doesn't have an edit option in any stage of Award Desk Review and will get error message on page.|
  |Verify that PM user have edit access for record only when edit access setting is yes for peer reviewer when Award desk review is a submit for review state.|
  |Verify that the record owner is able to edit the access for record when Org Desk Review is in the Created, submit for review and sent to grantor state|
  |Verify that Non-Owner user doesn't have an edit option in any stage of Org Desk Review and will get error message on page.|
  |Verify that PM user have edit access for record only when edit access setting is yes for peer reviewer when org desk review is a submit for review state.|
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    And I wait for "2" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:DeskReview}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReview}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReview}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    #390420 #390428
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE1 Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    And I pause execution for "5" seconds
    Given I click on "Conduct" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "SiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted for Review"
    #390410 #390428
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "SiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    When I click on "Save" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    Given I click on "Complete Review" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                       | Desk Review |
      | {SavedValue:EXE1 Username} | Step 1      |
    And I pause execution for "3" seconds
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Send to Subrecipient" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see top right button "Save" in page detail
    Then I softly cannot see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    #390408 #390424
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390406 @390409 @390411 @390421 @390425 @390427 @ValidateEXEuserisabletoseetheglobalsearchbarforAwardSiteVisit @sprint-2-US-386939 @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when Award site visit is in the Created, submit for review and sent to grantor state
  |Verify that Non-Owner user doesn't have an edit option in any stage of Award Site Visit and will get error message on page.|
  |Verify that PM (Reviewer)user have edit access for record only when edit access setting is yes for peer reviewer when Award Site Visit is a submit for review state.|
  |Org Site Visit -> Verify that the record owner is able to edit the access for record when Org site visit is in the Created, submit for review and sent to grantor state|
  |Org site visit  -> Verify that Non-Owner user doesn't have an edit option in any stage of Org Site Visit and will get error message on page.|
  |Org Site Visit -> Verify that PM user have edit access for record only when edit access setting is yes for peer reviewer when Org Site Visit is a submit for review state.|
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default-Automation EXE user" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    #390421 #390427
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "SiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted for Review"
    #390411 #390427
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "SiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    Given I click on "Complete Review" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept and Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    #390409 #390425
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390415 @390418 @390430 @390432 @ValidateEXEuserisabletoseetheglobalsearchbarforAwardSiteVisit @sprint-2-US-386939 @GlobalSearch
  Scenario:Verify that user is able to expand the result by award site visit module and Filter/Refine the the result by configured Columns for an award site visit.
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Award site visit.|
  |Org Site visit -> Verify that user is able to expand the result by Org site visit module and Filter/Refine the the result by configured Columns for an Org site visit.|
  |Org Site Visit ->Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Org site visit.|
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default-Automation EXE user" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "Site Visits"
    #390430
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Visit Period" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "MonitoringType" inside refine by filter
    Then I softly see "Subrecipient POC" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "Site Visits"
    And I click on hyperlink for global search containing value "{SavedValue:SitevVisitId}"
  #390418 #390432
    Then I softly see page title contains as "{SavedValue:Automation Runtime Site Visit}"

  @390416 @390419 @390429 @390431 @ValidateEXEuserisabletoseetheglobalsearchbarforDeskReview @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that user is able to expand the result by award desk review module and Filter/Refine the the result by configured Columns for an award desk review
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Award desk review.|
  |Verify that user is able to expand the result by Org desk review module and Filter/Refine the the result by configured Columns for an Org desk review|
  |Org site visit -> Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Org desk review.|
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    And I wait for "2" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    Then I softly see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "Site Visits"
    #390429
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Visit Period" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "MonitoringType" inside refine by filter
    Then I softly see "Subrecipient POC" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    Then I softly see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "Site Visits"
    And I click on hyperlink for global search containing value "{SavedValue:DeskReview}"
      #390419 #390431
    Then I softly see page title contains as "{SavedValue:Automation Runtime Award Desk}"

  @390455 @390454 @390457 @390458 @ValidateEXEuserisabletoseetheglobalsearchbarforApplicationNegotiation @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that Record owner can edit only the negotiation tab when application is in the review initiated state and negotiation is in the created state
  |Verify that Non-Owner user doesn't have an edit option in any stage of application and will get error message on page.|
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, owner first name, owner last name ) on objects after global search the any record for application.|
  |Verify that user is able to expand the result by for application module and Filter/Refine the the result by configured Columns for an Application.|
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "3" seconds
    Then I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AppID"
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on row level action button "Edit" against "{SavedValue:AppID}" in global search with id "Applications"
    When I click on "Save" in the page details
      #390454
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Cancel Negotiation" in page detail
    Then I softly can see top right button "Back to Current Review Step" in page detail
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on hyperlink for global search containing value "{SavedValue:AppID}"
      #390457
    Then I softly see page title contains as "{SavedValue:Automation Runtime FDM Announcement}"
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    Then I softly see value "{SavedValue:AppID}" for title "EGMS ID" inside table "Applications"
    And I perform quick search inside global search "Applications"
      #390458
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Application Name" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Application Due Date" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see "Submitted On" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on row level action button "Edit" against "{SavedValue:AppID}" in global search with id "Applications"
      #390455
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390459 @390459 @390460 @390461 @390465 @ValidateEXEuserisabletoseetheglobalsearchbarforPre-ApplicationNegotiation @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that Record owner can edit only the negotiation tab when pre-application is in the submit to grantor state and negotiation is in the created state
  |Verify that Record owner can edit only the negotiation tab when pre-application is in the submit to grantor state and negotiation is in the created state|
  |Verify that Non-Owner user doesn't have an edit option in any stage of Pre-application and will get error message on page.|
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, owner first name, owner last name ) on objects after global search the any record for Pre-application.|
  |Verify that user is able to expand the result by for Pre-application module and Filter/Refine the the result by configured Columns for an Pre-Application.|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppID"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    And I click on hyperlink for global search containing value "{SavedValue:PreAppID}"
    #390459 #390461
    Then I softly see page title contains as "{SavedValue:Automation Runtime Announcement for Pre-App}"
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    #390459
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    And  I wait for "2" seconds
    #390459
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    Then I softly see value "{SavedValue:PreAppID}" for title "EGMS ID" inside table "Pre-Applications"
    #390465
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Pre-Application Name" inside refine by filter
    Then I softly see "Announcement EGMS ID" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Pre-Application Due Date" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see "Status" inside refine by filter
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    And I click on row level action button "Edit" against "{SavedValue:PreAppID}" in global search with id "Pre-Applications"
    #390460
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390873 @390875 @390882 @390886 @ValidateEXEuserisabletoseetheglobalsearchbarforSubrecipientContacts @sprint-2-US-386939 @GlobalSearch
  Scenario: Subrecipient Contact-> Verify that the record owner and Admin is able to edit the access for record when Subrecipient contact is in the New, Invitation sent, Register, Active, Invitation Expired state
  |Subrecipient Contact -> Verify that Non-Owner user doesn't have an edit option in any stage of Subrecipient Contact and will get error message on page.|
  |Subrecipient Contact -> Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID ) on objects after global search the any record for S/R contact.|
  |subrecipient contact -> Verify that user is able to expand the result by S/R Contact module and Filter/Refine the the result by configured Columns for an S/R Contact|
    When I login to "As a Grantor" app as "EXE" user
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:NewUser}"
    #390886
    Then I softly see "Full Name" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Organization Name" inside refine by filter
    Then I softly see "Email" inside refine by filter
    Then I softly see "Phone" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I click on row level action button "Edit" against "{user:NewUser}" in global search with id "Contacts"
    And I pause execution for "3" seconds
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:InvitationSentUser}"
    And I click on row level action button "Edit" against "{user:InvitationSentUser}" in global search with id "Contacts"
    And I pause execution for "3" seconds
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:ActiveUser}"
    And I click on row level action button "Edit" against "{user:ActiveUser}" in global search with id "Contacts"
    And I pause execution for "3" seconds
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:InactiveUser}"
    And I click on row level action button "Edit" against "{user:InactiveUser}" in global search with id "Contacts"
    #390875
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    And I refresh the page
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Contact}"
    And I click on hyperlink for global search containing value "{SavedValue:Automation Runtime Contact}"
    #390882
    Then I softly see page title contains as "{SavedValue:Automation Runtime Contact}"
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Contact}"
    And I click on hyperlink for global search containing value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    #390882
    Then I softly see page title contains as "SAN DIEGO ELECTRICAL TRAINING TRUST"

  @393746 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that Column label should correctly displayed and clickable on that object when user global search any record by using EGMS ID or any keyword
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "Announcements"
    Then I softly see value "{SavedValue:Automation Runtime Competitive Announcement}" for title "Announcement Name" inside table "Announcements"
    Then I softly see value "" for title "Application Due Date" inside table "Announcements"
    Then I softly see value "Automation EXE" for title "Created By" inside table "Announcements"
    Then I softly see value "Created" for title "Status" inside table "Announcements"

  @389003  @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that the record owner is able to edit the access for record when Award is in the Created, submit for review, Reviewed, Accepted state
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Created"
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Reviewed"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Accepted"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389008  @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that Non-Owner user doesn't have an edit option in any stage of award and will get error message on page.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Accepted"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389011 @sprint-2-US-386939  @GlobalSearch @bug-451578
  Scenario: Verify that user is not able to change the owner in any state of Award and will get the error message and non-owner user is not able to see the change owner option
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    And I click on row level action button "Change Owner" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    Then I softly see "Change Owner" opens in overLay window
    When I click modal button "Cancel"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Subawards"

  @389017 @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that PM user as Reviewer have edit access for record only when edit access setting is yes for peer reviewer when award is a submit for review state.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389023 @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that if PM user does not have edit access for peer review then PM user will get error message for award when award is in the submit for review state or in Reviewed states
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Subawards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389027 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for awardbox for announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Grants" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @389031 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to see the all the list of modules after clicking on 'suggested for you section' for award.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    Then I softly see dropdown option "All" under the "Suggested For You" section
    Then I softly see dropdown option "Amendment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Announcements" under the "Suggested For You" section
    Then I softly see dropdown option "Applications" under the "Suggested For You" section
    Then I softly see dropdown option "Chatter" under the "Suggested For You" section
    Then I softly see dropdown option "Closeouts" under the "Suggested For You" section
    Then I softly see dropdown option "Contacts" under the "Suggested For You" section
    Then I softly see dropdown option "Events" under the "Suggested For You" section
    Then I softly see dropdown option "External Registration" under the "Suggested For You" section
    Then I softly see dropdown option "Focus Areas" under the "Suggested For You" section
    Then I softly see dropdown option "Funding Decision Memos (FDM)s" under the "Suggested For You" section
    Then I softly see dropdown option "Funding Sources" under the "Suggested For You" section
    Then I softly see dropdown option "Grants" under the "Suggested For You" section
    Then I softly see dropdown option "Key Performance Indicators (KPI)s" under the "Suggested For You" section
    Then I softly see dropdown option "Organizations" under the "Suggested For You" section
    Then I softly see dropdown option "Payment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Pre-Applications" under the "Suggested For You" section
    Then I softly see dropdown option "Programs" under the "Suggested For You" section
    Then I softly see dropdown option "Progress Report" under the "Suggested For You" section
    Then I softly see dropdown option "Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reviews" under the "Suggested For You" section
    Then I softly see dropdown option "Risk Assessment" under the "Suggested For You" section
    Then I softly see dropdown option "Site Visits" under the "Suggested For You" section
    Then I softly see dropdown option "Strategic Plans" under the "Suggested For You" section
    Then I softly see dropdown option "Subawards" under the "Suggested For You" section
    Then I softly see dropdown option "Terms and Conditions" under the "Suggested For You" section
    Then I softly see dropdown option "Tasks" under the "Suggested For You" section


  @389048 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that PO user is able to see the table for extra objects which are present in the search result for subaward module
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "Grants"
    And I click on "Expand List" button on left navigation for global search
    And I click on "Show more" button on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Email Messages" on left navigation for global search
    Then I softly see the text "Notes" on left navigation for global search
    Then I softly see the text "Tasks" on left navigation for global search
    Then I softly see the text "Folders" on left navigation for global search

  @389053 @389043  @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID) on objects after global search the any record for announcement.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Subawards" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I wait for "2" seconds
    #389043
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Announcement EGMS ID" inside refine by filter
    Then I softly see "Subaward Title" inside refine by filter
    Then I softly see "External  Organization" inside refine by filter
    Then I softly see the text "Cumulative Obligation" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:AwardEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"

  @389060 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user can sort any objects after global search any record (Eg: EGMS ID, Relevance, Program)
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I select "Subawards" from dropdown for Global search
    And I perform quick search inside global search "awards"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Announcement EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Subaward Title" inside "Relevance" dropdown
    Then I softly see options "External Organization" inside "Relevance" dropdown
    Then I softly see options "New Obligation" inside "Relevance" dropdown
    Then I softly see options "Cumulative Obligation" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389314  @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Grant is in the Created state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    And I wait for "3" seconds
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @389322 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID , Internal Organization, Owner First Name, Owner Last Name ) on objects after global search the any record for Grant.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Draft"
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "Automation"
    Then I softly see the text containing "{SavedValue:EXE Username}"

  @389323 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user can sort any objects after global search any record by (Relevance, EGMS ID, Grant Title, Internal organization, External organization,  Project period) Status.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "Grants"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Grant Title" inside "Relevance" dropdown
    Then I softly see options "External Organization" inside "Relevance" dropdown
    Then I softly see options "Project Period" inside "Relevance" dropdown
    Then I softly see options "Number of Awards" inside "Relevance" dropdown
    Then I softly see options "Cumulative Obligation" inside "Relevance" dropdown
    Then I softly see options "Owner First Name" inside "Relevance" dropdown
    Then I softly see options "Owner Last Name" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389324 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by Grant module and Filter/Refine the the result by configured Columns for an Grant.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    Then I softly see value "{SavedValue:GrantEGMSID}" for title "EGMS ID" inside table "Grants"
    And I perform quick search inside global search "Grants"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Grant Title" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Project Period" inside refine by filter
    Then I softly see the text "Number of Awards" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    And I filter field record by "EXE" by label "Owner Last Name" in left panel for global search
    Then I softly see value "EXE" for title "Owner Last Name" inside table "Grants"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Subawards" on left navigation for global search
    Then I softly see the text "Site Visits" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search

  @389327 @389335 @389342 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when Focus Area is in the Created state
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FocusEGMSID"
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
      #389335
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see the text "Status" on left navigation for global search
    And I filter field record by "EXE" by label "Owner Last Name" in left panel for global search
    Then I softly see value "EXE" for title "Owner Last Name" inside table "Focus Areas"
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "External Registration" on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
      #389342
    And I click on hyperlink for global search containing value "{SavedValue:FocusEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Draft"

  @389343 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that Non-Owner user doesn't have an edit option in any stage of Focus Area and will get error message on page.
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FocusEGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @389459 @389460 @389461 @389462 @sprint-2-US-386939  @GlobalSearch @bug-451518
  Scenario Outline: Verify that the record owner is able to edit the access for record when funding decision memo(FDM) is in the Created state
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside table
    And I get the "EGMS ID"
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "5" seconds
    And I save the value from row "1" for column name "EGMS ID" as "AppId1" from flex table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    Then I softly can see top right button "Funding Decision Memo" in page detail
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Completed"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "Announcement EGMS ID" as "FDMEGMSID"
#    And I save the field labeled "EGMS ID" as "FDMEGMSID"
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    #389459
    And I click on row level action button "Edit" against "{SavedValue:FDMEGMSID}" in global search with id "Funding Decision Memos (FDM)s"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    And I click on hyperlink for global search containing value "Funding Decision Memo"
    And I wait for "3" seconds
    #389461
    Then I softly see field "Status" as "Created"
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    #389462
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Name" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "# of Applications Available for Review" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "AN-"
    And I click on row level action button "Edit" against "{SavedValue:FDMEGMSID}" in global search with id "Funding Decision Memos (FDM)s"
   #389460
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    #check for submit for approval and Approved status hold due to bug
    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @389463 @389464 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when KPI is in the Created state
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    #389464
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{SavedValue:KPIEGMSID}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{SavedValue:KPIEGMSID}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    And I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"


  @389465 @389466 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by KPI module and Filter/Refine the the result by configured Columns for an KPI.
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Domain" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:KPIEGMSID}"
    And I wait for "3" seconds
    #389466
    Then I softly see field "Status" as "Created"

  @389475 @389483  @389486 @389479 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Strategic plan is in the Created state
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I softly see that "Status" is in "Draft" status
    And I save the field labeled "EGMS ID" as "StrategicEGMSID"
    And I navigate to "Planning" tab
    And I select "Strategic Plans" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
    And I click on row level action button "Edit" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Planning" tab
    And I select "Strategic Plans" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
      #389483
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see the text "Status" on left navigation for global search
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:StrategicEGMSID}"
    And I wait for "3" seconds
     #389486
    Then I softly see field "Status" as "Draft"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Strategic Plans" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
      #389479
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Then I softly see that "Status" is in "Draft" status

  @389495 @389502 @389505 @sprint-2-US-386939  @GlobalSearch @bug-451476
  Scenario: Verify that the Admin is able to edit the access for terms and condition when terms and condition is in the New and active state state
    When I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    And I select "Terms and Conditions" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:EGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
    And I click on row level action button "Edit" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
    Then I see textarea field "Description__c" is editable
    And I navigate to "Planning" tab
    And I select "Terms and Conditions" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:EGMSID}"
        #389502
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Source" inside refine by filter
    Then I softly see "Effective From" inside refine by filter
    Then I softly see "Mandatory?" inside refine by filter
    Then I softly see "Source" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:EGMSID}"
    And I wait for "3" seconds
       #389505
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Terms and Conditions" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:EGMSID}"
        #389497 #hold due to bug
    And I click on row level action button "Edit" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
    Then I softly see the text containing "You dont have sufficient access to edit this record"