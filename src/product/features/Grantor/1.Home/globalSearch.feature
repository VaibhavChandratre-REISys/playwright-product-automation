@globalSearch @globalSearchRegression @grantor-regression @grantor-parallel-regression @regression @globalExecution
Feature: Validate all scenarios for the global search

  @387431 @387434 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate EXE user is able to see the global search bar for an announcement
    Given I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    Then I softly see global search display at top of the page
    #387434
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @387457 @ValidatetherecordownerisabletoedittheaccessforrecordwhenannouncementisintheCreatedsubmitforrevieworinUnpublishedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate the record owner is able to edit the access for record when announcement is in the Created, submit for review or in Unpublished state
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
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
    And I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I login to "Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "Edit" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
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
    And I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Under Revision"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
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
    And I perform quick search inside global search "{AUTOEnvData:ClosedStateAnnouncement_ApplicationSubmittedToGrantor}"
    And I click on row level action button "Edit" against "{AUTOEnvData:ClosedStateAnnouncement_ApplicationSubmittedToGrantor}" in global search with id "Announcements"
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
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"

  @387731 @ValidatePMuserhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenannouncementisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate PM user have edit access for record only when edit access setting is yes for peer reviewer when announcement is a submit for review state
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AnnEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @387762 @ValidatePMuserdoesnothaveeditaccessforpeerreviewthenPMuserwillgeterrormessageforannouncementwhenannouncementisinthesubmitforreviewstateorinReviewedstates @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate PM user does not have edit access for peer review then PM user will get error message for announcement when announcement is in the submit for review state or in Reviewed states
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
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
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @387772 @Validatethatuserisabletoseetheallthelistofmodulesafterclickingonsuggestedforyousectionforannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to see the all the list of modules after clicking on 'suggested for you section' for announcement
    When I login to "Grantor" app as "EXE" user
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
    Then I softly see dropdown option "Monitoring Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reviews" under the "Suggested For You" section
    Then I softly see dropdown option "Risk Assessment" under the "Suggested For You" section
    Then I softly see dropdown option "Site Visits" under the "Suggested For You" section
    Then I softly see dropdown option "Strategic Plans" under the "Suggested For You" section
    Then I softly see dropdown option "Awards" under the "Suggested For You" section
    Then I softly see dropdown option "Tasks" under the "Suggested For You" section

  @388883 @388920 @ValidatethatEXEuserisabletoseetheglobalsearchbarforanInternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that EXE user is able to see the global search bar for an Internal Program
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    Then I softly see global search display at top of the page
    #388920
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @388932 @Validatethatuserisabletoseethe5mostrecentlyusedrecordsinthedropdownlistwhenuserclicksonsearchinputboxforInternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for Internal Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @388921 @ValidatethattherecordownerisabletoedittheaccessforrecordwhenInternalProgramisintheCreatedsubmitforreviewandBeingAmendedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that the record owner is able to edit the access for record when Internal Program is in the Created, submit for review and Being Amended state
    When I login to "Grantor" app as "dynamicUser" user
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
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
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
    When I login to "Grantor" app as "dynamicUser" user
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @388926 @ValidatethatuserisnotabletochangetheownerinanystateofInternalProgramandwillgettheerrormessageandnonowneruseisnotabletoseethechangeowneroption @sprint-2-US-386939 @GlobalSearch
  Scenario: Validate that user is not able to change the owner in any state of Internal Program and will get the error message and non-owner user is not able to see the change owner option
    When I login to "Grantor" app as "dynamicUser" user
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"

  @388928 @ValidateEXEhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenInternalProgramisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Validte EXE have edit access for record only when edit access setting is yes for peer reviewer when Internal Program is a submit for review state
    When I login to "Grantor" app as "dynamicUser" user
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @388930 @ValidateEXEuserdoesnothaveeditaccessforpeerreviewthenEXEuserwillgeterrormessageforInternalProgramwhenInternalProgramisinthesubmitforreviewstateorinReviewedstates @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate EXE user does not have edit access for peer review then EXE user will get error message for Internal Program when Internal Program is in the submit for review state or in Reviewed states
    When I login to "Grantor" app as "dynamicUser" user
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
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I login to "Grantor" app as "dynamicUser" user
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
    Then I softly see dropdown option "Monitoring Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reviews" under the "Suggested For You" section
    Then I softly see dropdown option "Risk Assessment" under the "Suggested For You" section
    Then I softly see dropdown option "Site Visits" under the "Suggested For You" section
    Then I softly see dropdown option "Strategic Plans" under the "Suggested For You" section
    Then I softly see dropdown option "Awards" under the "Suggested For You" section
    Then I softly see dropdown option "Tasks" under the "Suggested For You" section

  @388990 @388995 @ValidatehatEXEuserisabletoseetheglobalsearchbarforanAward @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that EXE user is able to see the global search bar for an Award
    Given I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    Then I softly see global search display at top of the page
    #388995
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @388859 @ValidatewhenanyuserglobalsearchanyrecordbyusingEGMSIDoranykeyword&clickonrecordandfindingtheresultthenthatrecordshouldopeninconsoletab @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate when any user global search any record by using EGMS ID or any keywords & click on record and finding the result then that record should open in console tab
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
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
    When I login to "Grantor" app as "dynamicUser" user
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
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
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
    When I login to "Grantor" app as "dynamicUser" user
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
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "Announcements" for global search record
    And I perform quick search inside global search "Announcement"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "Application Due Date" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:PM Username}" by label "Created By" in left panel for global search
    Then I softly see value "{SavedValue:PM Username}" for title "Created By" inside table "Announcements" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search

  @388940 @ValidatethatuserisabletoexpandtheresultbyplanningmoduleandFilterRefinethetheresultbyconfiguredColumnsforanInternalProgram @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user is able to expand the result by planning module and Filter/Refine the the result by configured Columns for an Internal Program.
    When I login to "Grantor" app as "dynamicUser" user
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
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "Programs" for global search record
    And I perform quick search inside global search "Programs"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Program Name" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:PM Username}" by label "Created By" in left panel for global search
    Then I softly see value "{SavedValue:PM Username}" for title "Created By" inside table "Programs" for global search record
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
    Then I softly do not see the text "Config: Batch Jobs" on left navigation for global search
    Then I softly see the text "Contact Point Addresses" on left navigation for global search
    Then I softly see the text "Contact Point Emails" on left navigation for global search
    Then I softly see the text "Contact Point Phones" on left navigation for global search
    Then I softly see the text "Contact Point Phones" on left navigation for global search
    Then I softly see the text "Case Comments" on left navigation for global search
    Then I softly see the text "Task Config" on left navigation for global search
    Then I softly do not see the text "Step Progressbar Header Config" on left navigation for global search
    Then I softly do not see the text "SObject Config" on left navigation for global search
    Then I softly do not see the text "Page Layouts Config" on left navigation for global search

  @388946 @ValidatePMuserisabletoseethetableforextraobjectswhicharepresentinthesearchresultforPlanningmodule @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate PM user is able to see the table for extra objects which are present in the search result for Planning module
    When I login to "Grantor" app as "PM" user
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
    When I login to "Grantor" app as "EXE" user
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
    Then I softly see the text containing "1 Result"
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
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
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
    When I login to "Grantor" app as "dynamicUser" user
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
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "Announcements"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Announcement Name" inside "Relevance" dropdown
    Then I softly see options "Application Due Date" inside "Relevance" dropdown
    Then I softly see options "Created By" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown