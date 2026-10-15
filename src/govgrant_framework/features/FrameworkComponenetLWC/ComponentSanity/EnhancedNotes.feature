@EnhancedNotes @ComponentSanity @ComponentSanity1
Feature: Enhanced Notes Scenarios
Business Need: To ensure that the Enhanced Notes of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @507014
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that the Add New Notes Record functioning correctly
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    And I click on top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I enter value "Test" into field "Title"
    And I click on description icon for table id "---program:-:internalProgramNotesTableId---"
    Then I softly see "Description" opens in overLay window
    Then I softly see "Save" button is displayed on modal
    Then I softly see "Cancel" button is displayed on modal
    When I click modal button "Cancel and close"
    And I click on top right button "Save" in flex table with id "---program:-:internalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I softly see the following message in the page details :
      | Saved Successfully! |

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507015
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that user not enter Title then click outside functioning correctly
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    And I click on top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly see fields "Title" is in edit mode
    And I enter value "Test" into field "Title"
    And I clear the value from field "Title"
    And I click on anywhere in Page Layout
    Then I softly see the text containing "Complete this field."
    And I click on top right button "Save" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I see error message contains text "Please complete all field(s) marked in red." if mandatory fields are not filled

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507016
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that Edit Notes Record functioning correctly
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I pause execution for "4" seconds
    And I softly see the following message in the page details :
      | Saved Successfully! |
    And I pause execution for "4" seconds
    Then I softly can see row level action button "Edit" against "Test1" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Test1" in flex table with id "---program:-:internalProgramNotesTableId---"


    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @Updatesuccessfullyforinternal
  Scenario Outline: Update successfully  for internal
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Title     | Description     |
      | Test Data | Automation Test |
    And I pause execution for "5" seconds
    And I softly see the following message in the page details :
      | Record updated successfully! |

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507017
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that Remove Notes Record functioning correctly
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I pause execution for "4" seconds
    When I click on "Delete" icon for "Test1" inside flex table with id "---program:-:internalProgramNotesTableId---" without accept popup
    And I pause execution for "5" seconds
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    Then I see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Continue" on modal confirmation box
    And I pause execution for "4" seconds
    Then I softly see the following message in the page details :
      | Record deleted successfully. |

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507018 @507019
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that Search Notes functioning correctly
  |3.0- Notes- Admin/PM- To verify that Reset Notes functioning correctly|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Quick Search | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Quick Search | true          | InternalProgramContentNotes |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title  | Description |
      | @#$%^& | Desc Test   |
    Then I softly see quick search inside table id "---program:-:internalProgramNotesTableId---"
    And I perform quick search for "@#" in "---program:-:internalProgramNotesTableId---" panel
    Then I softly see value "@#$%^&" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
     #507019
    Then I softly see "resetIcon" button in flex table with id "---program:-:internalProgramNotesTableId---"
    When I click on button "resetIcon" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly see the following message in the page details :
      | Table has been reset. |

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507020 @507021
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that Refresh action functioning correctly
  |3.0- Notes- Admin/PM- To verify that Download action functioning correctly|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table            | Disable Menu              | false             | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (PDF)       | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (XLS / CSV) | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Disable Menu              | false         | InternalProgramContentNotes | Name                      |                            |
      | Flex Table:General    | Enable Export (PDF)       | true          | InternalProgramContentNotes | Name                      |                            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true          | InternalProgramContentNotes | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title  | Description |
      | @#$%^& | Desc Test   |
    Then I see "Menu" action is displayed at the "---program:-:internalProgramNotesTableId---" modal
    When I click on parallel menu button in flex table title "Notes"
    Then I softly see "Refresh" button is displayed
    Then I softly see "Download as PDF" button is displayed
    Then I softly see "Download as CSV" button is displayed
    And I select "Refresh" from parallel lines dropdown of "Notes"
    Then I see table is refreshing
    #507021
    When I click on parallel menu button in flex table title "Notes"
    And I select "Download as PDF" from parallel lines dropdown of "Notes"
    Then I softly see new tab is opened

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507022
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that Undo Notes functioning correctly
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    When I click on "Edit" icon for "Test1" inside flex table with id "---program:-:internalProgramNotesTableId---" without accept popup
    And I pause execution for "5" seconds
    And I click on Undo button in action for tableid "---program:-:internalProgramNotesTableId---"
    And I pause execution for "4" seconds
    Then I softly see value "Test1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507023
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that Sort Notes functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue | filterId         |
      | Flex Table            | Order By       |                   | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction | DESC              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName      | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By       | Title         | InternalProgramContentNotes |                           |                            |
      | Flex Table:General    | Sort Direction | ASC           | InternalProgramContentNotes |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I click on column name "Title" for sorting of table "---program:-:internalProgramNotesTableId---"
    Then I softly see column name "Title" with "Descending" order

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @507024
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that the Description filed warp data functioning correctly
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description                     |
      | Test1 | {LongText:FormInstruction-Text} |
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title | Description    |
      | Test2 | www.google.com |
    Then I softly see value "www.google.com" for title "Description" inside table "---program:-:internalProgramNotesTableId---"
    And I click on hyperlink containing value "www.google.com"
    Then I softly see new tab is opened

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @506946
  Scenario: 3.0- Notes- SPI- To verify that the Add New Notes Record functioning correctly
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    And I click on top right button "New" in flex table with id "---applicationIntake:-:ApplicationNotesTableId---"
    And I enter value "Test" into field "Title"
    And I click on description icon for table id "---applicationIntake:-:ApplicationNotesTableId---"
    And I pause execution for "3" seconds
    Then I softly see "Description" opens in overLay window
    Then I softly see "Save" button is displayed on modal
    Then I softly see "Cancel" button is displayed on modal
    When I click modal button "Cancel and close"
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:ApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    Then I see the following message in the page details :
      | Saved Successfully! |

  @506948
  Scenario: 3.0- Notes- SPI- To verify that user not enter Title then click outside functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    And I click on top right button "New" in flex table with id "---applicationIntake:-:ApplicationNotesTableId---"
    Then I softly see fields "Title" is in edit mode
    And I enter value "Test" into field "Title"
    And I clear the value from field "Title"
    And I pause execution for "6" seconds
     And I click on anywhere in Page Layout
    Then I softly see the text containing "Complete this field."
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:ApplicationNotesTableId---"
    And I pause execution for "5" seconds
    Then I see the following message in the page details :
      | Please complete all field(s) marked in red. |

  @506951
  Scenario: 3.0- Notes- SPI- To verify that Edit Notes Record functioning correctly
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I wait for "5" seconds
    And I softly see the following message in the page details :
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "Test1" in flex table with id "---applicationIntake:-:ApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Test1" in flex table with id "---applicationIntake:-:ApplicationNotesTableId---"

  @EditNotesUpdated
  Scenario: Edit notes updated successfully
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
    When I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I wait for "5" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "Edit" :
      | Title | Description     |
      | Test1 | Automation Data |
    And I pause execution for "3" seconds
    And I softly see the following message in the page details :
      | Record updated successfully! |

  @506954
  Scenario: 3.0- Notes- SPI- To verify that Delete Notes Record functioning correctly
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
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I pause execution for "4" seconds
    When I click on "Delete" icon for "Test1" inside flex table with id "---applicationIntake:-:ApplicationNotesTableId---" without accept popup
    And I pause execution for "5" seconds
    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "OK" on modal confirmation box
    And I pause execution for "4" seconds
    Then I softly see the following message in the page details :
      | Record deleted successfully. |

  @506956
  Scenario: 3.0- Notes- SPI- To verify that Refresh action functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table            | Disable Menu              | false             | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (PDF)       | true              | ApiGeneratedId:1 |
      | Flex Table            | Enable Export (XLS / CSV) | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Disable Menu              | false         | SubrecipientApplicationContentNotes | Name                      |                            |
      | Flex Table:General    | Enable Export (PDF)       | true          | SubrecipientApplicationContentNotes | Name                      |                            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true          | SubrecipientApplicationContentNotes | Name                      |                            |
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
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title  | Description |
      | @#$%^& | Desc Test   |
    Then I see "Menu" action is displayed at the "---applicationIntake:-:ApplicationNotesTableId---" modal
    When I click on parallel menu button in flex table title "Notes"
    Then I softly see "Refresh" button is displayed
    Then I softly see "Download as PDF" button is displayed
    Then I softly see "Download as CSV" button is displayed
    And I select "Refresh" from parallel lines dropdown of "Notes"
    Then I see table is refreshing
    When I click on parallel menu button in flex table title "Notes"
    And I select "Download as PDF" from parallel lines dropdown of "Notes"
    Then I softly see new tab is opened

  @506957
  Scenario: 3.0- Notes- SPI- To verify that Undo Notes functioning correctly
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
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    When I click on "Edit" icon for "Test1" inside flex table with id "---applicationIntake:-:ApplicationNotesTableId---" without accept popup
    And I pause execution for "5" seconds
    And I click on Undo button in action for tableid "---applicationIntake:-:ApplicationNotesTableId---"
    And I pause execution for "4" seconds
    Then I softly see value "Test1" for title "Title" inside table "---applicationIntake:-:ApplicationNotesTableId---"

  @506961
  Scenario: 3.0- Notes- SPI- To verify that the Long Text Description filed warp data after save functioning correctly
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
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description                     |
      | Test1 | {LongText:FormInstruction-Text} |
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description    |
      | Test2 | www.google.com |
    Then I softly see value "www.google.com" for title "Description" inside table "---applicationIntake:-:ApplicationNotesTableId---"
    And I click on hyperlink containing value "www.google.com"
    Then I softly see new tab is opened

  @506958
  Scenario: 3.0- Notes- SPI- To verify that Sort Notes functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue | filterId         |
      | Flex Table            | Order By       |                   | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction | DESC              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName      | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By       | Title         | SubrecipientApplicationContentNotes |                           |                            |
      | Flex Table:General    | Sort Direction | ASC           | SubrecipientApplicationContentNotes |                           |                            |
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
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title | Description     |
      | Test1 | Automation Test |
    And I click on column name "Title" for sorting of table "---applicationIntake:-:ApplicationNotesTableId---"
    Then I softly see column name "Title" with "Descending" order

  @529631 @529639
  Scenario Outline: 3.0- Notes- Admin/PM- To verify that the Description filed warp data functioning correctly
  |3.0- Notes- Admin/PM- To verify that the Add New Notes TITLE field user cannot enter more than 255 Character working properly|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title              | Description        |
      | {flexgrid:char255} | {flexgrid:char255} |
    And I pause execution for "5" seconds
    #529631
    Then I softly see value "{flexgrid:char255}" for title "Description" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{flexgrid:char255}" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title              | Description         |
      | {flexgrid:char260} | {flexgrid:LTA32768} |
    And I pause execution for "5" seconds
    #529639
    Then I softly do not see value "{flexgrid:char260}" for title "Title" inside table "---program:-:internalProgramNotesTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @529644 @529648
  Scenario:3.0- Notes- SPI- To verify that the Add New Notes TITLE field user can enter up to 255 Character working properly
  |3.0- Notes- SPI- To verify that the Add New Notes TITLE field user cannot be enter more than 255 Character working properly|
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
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Notes" page block displayed
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title              | Description        |
      | {flexgrid:char255} | {flexgrid:char255} |
    And I pause execution for "5" seconds
    #529644
    Then I softly see value "{flexgrid:char255}" for title "Title" inside table "---applicationIntake:-:ApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "New" :
      | Title              | Description         |
      | {flexgrid:char260} | {flexgrid:LTA32768} |
    And I pause execution for "4" seconds
    Then I softly see value "{flexgrid:char255}" for title "Title" inside table "---applicationIntake:-:ApplicationNotesTableId---"
    #529648
    Then I softly do not see value "{flexgrid:char260}" for title "Title" inside table "---applicationIntake:-:ApplicationNotesTableId---"