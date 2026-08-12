@regression @annWithNotes @Product-M04 @announcementExecution @Productannouncement
Feature: Validate all notes scenarios in the  Announcement tab

  @220171 @ValidateFDPOusercantaddnotesonformulaannouncementwhichisClosed @sprint-9-US-201923 @Notes
  Scenario:Validate FD/PO user cant add notes on formula announcement which is Closed
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220178 @ValidatePMPOADMINcantaddnotesonFormulaannouncementhavingstatusasArchived @sprint-9-US-201923 @Notes
  Scenario:Validate PM/PO/ADMIN cant add notes on Formula announcement having status as Archived
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I perform quick search for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I perform quick search for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I perform quick search for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:AnnouncementNotestableId---"
