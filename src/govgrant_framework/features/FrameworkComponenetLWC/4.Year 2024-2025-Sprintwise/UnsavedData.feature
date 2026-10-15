@UnsavedData @Sprint-2025
Feature: Unsaved Data Files View/Preview
Business Need: To ensure that the Unsaved Data of our web pages meets the needs of different user roles: admin, internal users, and external users.
1.US-509163
2.US-534418

  @514186
  Scenario Outline: LWC - Unsaved Data - Page Layout - Admin/PM - To verify when user closes the console tab without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I close console with "Close tab" for record "{SavedValue:ANNEGMSID}"
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @514392
  Scenario Outline: LWC - Unsaved Data - Page Layout - Admin/PM - To verify when user click on the cancel action without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "4" seconds
    And I click on "Cancel" in the page details
    And I wait for "3" seconds
    Then I see confirmation box with message "Are you sure you want to cancel?" is displayed

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @521280
  Scenario Outline: LWC - Unsaved Data - Page Layout - Admin/PM - To verify when user try to change the console tab without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    And I enter value "Test Announcement" into field "AnnouncementName__c"
    And I navigate to "Announcements" tab
    And I pause execution for "5" seconds
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @514340
  Scenario Outline: LWC - Unsaved Data - E-Table/E-Grid - Admin/PM - To verify when user closes the console tab without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation PM" in the table "---announcement:-:annoucementContactTableId---"
    When I click modal button "Close"
    When I click on "Edit" icon for "Automation PM" inside flex table with id "---announcement:-:contactTableId---" without accept popup
    And I close console with "Close tab" for record "{SavedValue:ANNEGMSID}"
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @514469
  Scenario Outline: LWC - Unsaved Data - E-Table/E-Grid - Admin/PM - To verify when user click on the another console Tab without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation PM" in the table "---announcement:-:annoucementContactTableId---"
    When I click modal button "Close"
    When I click on "Edit" icon for "Automation PM" inside flex table with id "---announcement:-:contactTableId---" without accept popup
    And I navigate to "Announcements" tab
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @514474
  Scenario Outline: LWC - Unsaved Data - Modal - Admin/PM - To verify when user click on the close button or icon of modal without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I click modal button "Close"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @521207
  Scenario Outline: LWC - Unsaved Data - E-Table/E-Grid - Admin/PM - To verify when user click on the page layout Edit action without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation PM" in the table "---announcement:-:annoucementContactTableId---"
    When I click modal button "Close"
    When I click on "Edit" icon for "Automation PM" inside flex table with id "---announcement:-:contactTableId---" without accept popup
    And I close console with "Close tab" for record "{SavedValue:ANNEGMSID}"
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @514467
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when user click on the Cancel action without saving the data then system should be generated alert for unsaved data
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{allforms:ApplicationRecordCreatedStateSPI}" in "{applicationIntake:recipientApplications}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordCreatedStateSPI}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    When I click on "Cancel" in the page details
    Then I see confirmation box with message "Are you sure you want to cancel?" is displayed

  @514258
  Scenario Outline:  LWC - Unsaved Data - Form Layout - Admin/PM - To verify when user closes the console tab without savingForm saved successfully' the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    And I pause execution for "5" seconds
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I save the field labeled "Form ID" as "FORMID"
    And I close console with "Close tab" for record "{SavedValue:FORMID}"
    Then I softly see message "You have records with unsaved changes:" on confirmation box
    Then I softly see message "If you leave these tabs, you'll lose your changes." on confirmation box

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @514420
  Scenario Outline: LWC - Unsaved Data - Form Layout - Admin/PM - To verify when user click on the cancel action without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "7" seconds
    When I click on "Cancel" in the page details without processing
    Then I see confirmation box with message "Are you sure you want to cancel?" is displayed

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @514571
  Scenario: LWC - Unsaved Data - Modal - SPI - To verify when user click on the close button or icon of modal  without saving the data then system should be generated alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @521262
  Scenario: LWC - Unsaved Data - E-Table/E-Grid - SPI - To verify when user click on the page layout edit action without saving the data then system should be generated alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    When I click on "Edit" in the page details without processing
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @534650 @UnsavedDataSpi @US-534418
  Scenario:LWC - Unsaved Data - Modal - SPI - To verify when modal is open and user closes the browser tab without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I close the tab
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534651 @UnsavedDataSpi @US-534418
  Scenario:LWC - Unsaved Data - Modal - SPI - To verify when modal is open and user clicks the browser back button without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I navigate to back
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534652 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Modal - SPI - To verify when modal is open and user clicks the browser refresh button without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I refresh the page
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534653 @534654 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Modal - SPI - To verify when modal is open and user clicks on the close action without saving the data then system should be generate alert for unsaved data
  |LWC - Unsaved Data - Modal - SPI - To verify when modal is open and user clicks on the close icon without saving the data then system should be generate alert for unsaved data|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I click modal button "Close"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @534656 @514350 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when record is in edit mode and user closes the browser tab without saving data then system should be generate alert for unsaved data
  |LWC - Unsaved Data - E-Table/E-Grid - SPI - To verify when user closes the console tab without saving the data then system should be generated alert for unsaved data|
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I close the tab
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534657 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when record is in edit mode and user clicks the browser back button without saving data then system should be generate alert for unsaved data
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I navigate to back
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534658 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when record is in edit mode and user clicks the browser refresh button without saving data then system should be generate alert for unsaved data
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I refresh the page
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534659 @514396 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when record is in edit mode and user clicks on the cancel action without saving data then system should be generate alert for unsaved data
  |LWC - Unsaved Data - Page Layout - SPI - To verify when user click on the Cancel action without saving the data then system should be generated alert for unsaved data||
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Cancel" in the page details without processing
    Then I softly see message "Are you sure you want to cancel?" on confirmation box

  @534660 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Data Table Enhanced/Grid - SPI - To verify when table record is inline edit mode and user closes the browser tab without saving data then system should be generate alert for unsaved data
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    And I close the tab
    When I click on "Cancel" in the page details without processing
    Then I softly see message "Are you sure you want to cancel?" on confirmation box

  @534661 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Data Table Enhanced/Grid - SPI - To verify when table record is in inline edit mode and user clicks the browser back button without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I upload attachment without random number "ScrollableTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "ScrollableTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I enter value "{flexgrid:char255}" into description box
    And I navigate to back
    Then I softly see message "Are you sure you want to cancel?" on confirmation box

  @534662 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Data Table Enhanced/Grid - SPI - To verify when table record is in inline edit mode and user clicks the browser refresh button without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I upload attachment without random number "ScrollableTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" icon for "ScrollableTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I enter value "{flexgrid:char255}" into description box
    And I refresh the page
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534663 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Form Layout - SPI - To verify when record is in edit mode and user closes the browser tab without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I close the tab
    Then I softly see message "Changes you made may not be saved." on confirmation box

  @534665 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Form Layout - SPI - To verify when record is in edit mode and user clicks the browser refresh button without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I refresh the page
    Then I softly see message "Changes you made may not be saved." on confirmation box

  @534666 @UnsavedDataSpi @US-534418
  Scenario: LWC - Unsaved Data - Form Layout - SPI - To verify when record is in edit mode and user clicks on the cancel action without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "6" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Cancel" in the page details without processing
    Then I softly see message "Changes you made may not be saved." on confirmation box

  @534519 @UnsavedDataPm @US-527546
  Scenario: LWC - Unsaved Data - Modal - Admin/PM - To verify when user click on browser refresh without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I refresh the page
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534520 @UnsavedDataPm @US-527546
  Scenario: LWC - Unsaved Data - Modal - Admin/PM - To verify when user click on the back button of browser without saving the data then system should be generated alert for unsaved data
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I navigate to back
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534522 @534524 @UnsavedDataPm @US-527546
  Scenario: LWC - Unsaved Data - Modal - Admin/PM - To verify when user click on the close action without saving the data then system should be generate alert for unsaved data
  |LWC - Unsaved Data - Modal - Admin/PM - To verify when user click on the close action without saving the data then system should be generate alert for unsaved data|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I click modal button "Close"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @534516 @UnsavedDataPm @US-527546
  Scenario:LWC - Unsaved Data - Modal - Admin/PM - To verify when user closes the browser tab without saving the data then system should be generate alert for unsaved data
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "{flexgrid:char255}" into description box
    And I close the tab
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @534672 @UnsavedDataSpi @US-527546
  Scenario: LWC - Unsaved Data - Modal - SPI - To verify when user click on browser refresh without saving the data then system should be generated alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I enter value "{flexgrid:char255}" into description box
    And I click modal button "Close"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @534673 @UnsavedDataSpi @US-527546
  Scenario: LWC - Unsaved Data - Modal - SPI - To verify when user click on the back button of browser without saving the data then system should be generated alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I enter value "{flexgrid:char255}" into description box
    And I navigate to back
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @534529 @534530 @UnsavedDataSpi @US-527546
  Scenario: LWC - Unsaved Data - Modal - SPI - To verify when user click on the close action without saving the data then system should be generate alert for unsaved data
  |LWC - Unsaved Data - Modal - SPI - To verify when user click on the close icon without saving the data then system should be generate alert for unsaved data|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I enter value "{flexgrid:char255}" into description box
    And I click modal button "Close"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @534528 @UnsavedDataSpi @US-527546
  Scenario: LWC - Unsaved Data - Modal - SPI - To verify when user closes the browser tab without saving the data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I enter value "{flexgrid:char255}" into description box
    And I close the tab
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box
