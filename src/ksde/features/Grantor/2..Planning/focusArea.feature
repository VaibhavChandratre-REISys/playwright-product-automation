@focusArea @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios in Focus Area

  @34512 @creationOfFocusArea @smoke @training
  Scenario: Creation of Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @50963 @editionOfFocusArea
  Scenario: Edition of Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @50961 @addAttachmentToFocusArea
  Scenario Outline: Addition of Attachment to Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---focusarea:-:FocusAreaFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I click modal button "Close"
    Then I see "Other" has been added in "Focus Area Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---focusarea:-:FocusAreaFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Supporting Documents" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---focusarea:-:FocusAreaFilesTableId---"
    Then I softly see value "Supporting Documents" for title "Classification" inside table "---focusarea:-:FocusAreaFilesTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @34729 @activateFocusArea @smoke
  Scenario: Activate Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @52455 @creationOFFocusAreaFOUser
  Scenario: Negative Scenario-Verify that FO is not able to create focus area
    Given I login to "As a Grantor" app as "FO" user
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"

  @53219 @userFOEditfocusArea
  Scenario: Negative Case-Verfiy that FO user cannot Edit  the record
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "---focusarea:-:focusAreaTableId---"

  @52620 @userFODeletefocusArea
  Scenario: Negative Case-Verfiy that FO user cannot Delete the record
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "---focusarea:-:focusAreaTableId---"

  @53220 @deactivatingfocusArea
  Scenario: Verfiy deactivating focus area by user - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"

  @53221 @foUserdeactivatingfocusArea
  Scenario: Negative Case- Verfiy that other users (other than Admin, EXE, PM) can not deactivate focus area
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I cannot see top right button "Deactivate" in page detail

  @52476 @closedfocusAreaListView
  Scenario: Verfiy that user can see Closed Focus Area under Inactive Focus Area list view (Admin/EXE/PM)
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Inactive"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I see status in Progress-bar is "Closed" and is "dark blue"

  @106643 @109276 @VerifyAssociatedFocusAreaAtRlatedGrantRecord
  Scenario: Validate user should be able to see associated focus area at grant record for program
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "3" seconds
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "Automation Permanent Focus Area" inside flex table with id "---focusarea:-:focusAreaTableId---"
    #109276 #monu
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---focusarea:-:ActiveGrantsTableIdFocusArea---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---focusarea:-:ActiveGrantsTableIdFocusArea---"
    And I pause execution for "3" seconds
    And I navigate to "Subawards" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---focusarea:-:GrantsSubAwardsTableIdFocusArea---" panel
    And I pause execution for "3" seconds
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---focusarea:-:SubAwardFocusAreaTableId---"

  @106615 @VerifyCorrespondingAnnouncement
  Scenario: Validate user should be able to see related announcement associated with program
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside table
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---program:-:AnnouncementTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime FDM Announcement}" for title "Announcement Name" inside table "---program:-:AnnouncementTableId---"

  @109436 @ValidateEditOfBusinessForm
  Scenario Outline: Validate expected user is able to edit business form on internal program
    When I login to "As a Grantor" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Setup" sub tab
    Then I softly can see row level action button "Edit" against "Grantor Application Forms" in flex table with id "---program:-:ProgramBusinessFormTableId---"
    Then I softly can see row level action button "Edit" against "Organization Desk Review" in flex table with id "---program:-:ProgramBusinessFormTableId---"
    Then I softly can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:ProgramBusinessFormTableId---"
    Examples:
      | userType |
      | ADMIN    |
      | PM       |

  @109641 @109606 @ValidateDeletionOfReviewerFromInternalProgram
  Scenario: Validate user is able to delete associated Reviewer at internal program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    #109606 #monu
    When I enter the following values into flex table with id "---program:-:addReviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"
    And I click on "Remove from Form" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:addReviewersTableId---" without waiting for record
    Then I softly do not see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"