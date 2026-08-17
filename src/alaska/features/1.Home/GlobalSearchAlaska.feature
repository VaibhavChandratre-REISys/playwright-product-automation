@AlaskaGlobalSearch @AlaskaRegression @AlaskaHome
Feature: Validate all scenarios for the global search

  @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement
  Scenario: Validate EXE user is able to see the global search bar for an announcement
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    Then I softly see global search display at top of the page
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @ValidateTheErrorMessageAndNonOwnerUserIsNotableToSeeTheChangeOwnerOption
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

  @ValidateUseWhenUserClicksOnSearchInputBoxForAnnouncement
  Scenario: Validate user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @ValidateThatEXEUserIsAbleToSeeTheGlobalSearchBarForInternalProgram
  Scenario: Validate that EXE user is able to see the global search bar for an Internal Program
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    Then I softly see global search display at top of the page
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @ValidateWhenUserClicksOnSearchInputBoxForInternalProgram
  Scenario: Validate that user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for Internal Program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @ValidateThatEXEUserIsAbleToSeeTheGlobalSearchBarForAnAward
  Scenario: Validate that EXE user is able to see the global search bar for an Award
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    Then I softly see global search display at top of the page
    Then I softly see "Suggested For You" section inside global search dropdown
    Then I softly see "All Searchable Items" section inside global search dropdown

  @ValidateEGMSIDorAnyKeywordClickOnRecordAndFindingTheResultThenThatRecordShouldOpeningConsoleTab
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

  @ValidateThatRecordShouldOpeningConsoleTab
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

  @ValidateGlobalSearchTheAnyRecordForAnnouncement
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

  @ValidateGlobalSearchTheAnyRecordForInternalProgram
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

  @ValidatePmSearchResultForPlanningModule
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

  @ValidateGlobalSearchAnyRecordByEGMSIDOrOrganizationName&CountryRemainSame0fOrNonMatchingRecords
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

  @ValidateGlobalSearchAnyRecordByEGMSIDOrOrganizationNameCountryRemainSame0fOrNonMatchingRecords
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

  @ValidateInternalOrganizationApplicationDueDateStatus
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

  @ValidateThatInternalOrganizationApplicationDueDateStatus
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