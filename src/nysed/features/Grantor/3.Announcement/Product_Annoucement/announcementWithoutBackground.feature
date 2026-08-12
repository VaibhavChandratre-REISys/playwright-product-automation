@commonAnnouncements  @regression @announcementWB @AnnouncementTemp @Product-M04 @announcementExecution @Productannouncement
Feature: Validate all common scenarios in the  Announcement tab (Announcement without background)

  @70878 @70373 @70821 @70978 @validationOverrideProgramSetting @BugTicket-NYSED-3272
  Scenario: To Verify that user can override program settings at Announcement level
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsMatchRequired__c"
    Then I softly see that "GranteeMatch__c" rendered in view mode only
    And I enter value "No" into field "FocusAreaRequired__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #Bug446474
    Then I softly see field "Focus Areas Required?" as "No"
    Then I softly cannot see field "Pre-Application Due Date" inside page block

  @70553 @70604 @validationForNoFocusAreaAndNOObjective @smoke
  Scenario: To Verify thatIf user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal FA" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsGoalsRequired__c"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    Then I softly do not see "Related Focus Areas" page block displayed
    Then I softly do not see "Objectives" page block displayed

   @75632 @75621 @searchFunctionalityForMessagesMyFeedInCollab  @buglogged95462 @wip @ExcludeSendEmail
  Scenario: To verify search functionality for messages section in collab tab for announcement
  | To verify entered My Feed from the collab tab section of announcement is getting displayed on home phase.
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    And I enter value "Hi @{SavedValue:PM Username}" in my feed section and share the post
    Then I softly see "{SavedValue:PM Username}" inside flex table with id "---announcement:-:myFeedTableId---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject | Body             |
      | internal.user.product@gmail.com | jitu    | this is bodyless |
    Then I softly see the following messages in the page details :
      | Email sent succesfully. |
    And I close "Send Email" modal by clicking the top right x button
    #When I perform quick search for "jitu" in "---announcement:-:collabMessages---" panel
    Then I softly see "jitu" inside flex table with id "---announcement:-:collabMessages---"
    And I navigate to "Home" tab
    Then I softly see "{SavedValue:PM Username}" inside flex table with id "---announcement:-:homeCollabFeedId---"
    Then I softly see "Hi" inside flex table with id "---announcement:-:homeCollabFeedId---"




