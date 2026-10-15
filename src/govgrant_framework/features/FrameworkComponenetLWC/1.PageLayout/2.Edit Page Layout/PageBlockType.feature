@PageLayout @PageBlockType @EditLayout @PageLayout2
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @361959 @361960 @361979 @361982 @361986 @361988 @361991 @361994 @361997 @361999
  Scenario Outline: Master TC- LWC-Flex Edit Layout -Page Block Types - Config- Admin-To verify that page block should get render on tab when we provide page block type as 'field' in config.
  LWC-Flex Edit Layout -Page Block Types - UI- PM-To verify that page block should get render on tab when we provide page block type as 'Attachments' in config.
  LWC-Flex Edit Layout -Page Block Types - UI- PM-To verify that page block should get render on tab when we provide page block type as 'Approval History' in config.
  LWC-Flex Edit Layout -Page Block Types - UI- PM-To verify that page block should get render on tab when we provide page block type as 'Flex Table' in config.
  LWC-Flex Edit Layout -Page Block Types - UI- PM-To verify that page block should get render on tab when we provide page block type as 'Grid' in config.
  LWC-Flex Edit Layout -Page Block Types - UI- PM-To verify that page block should get render on tab when we provide page block type as 'Notes and Attachments' in config.
  LWC-Flex Edit Layout -Page Block Types -UI-PM -To verify that page block should get render on tab when we provide page block type as 'Record History' in config.
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see "Description" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Program Specific Settings" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Setup" sub tab
    Then I softly see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Review Steps" page block displayed
    Then I softly see "Related Focus Area" page block displayed
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    When I navigate to "Files" sub tab
    Then I softly see "Attachments" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Program Files" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Field Audit" sub tab
    Then I softly see "Program History" page block displayed
    Examples:
      | User |
     # | Admin |
      | PM   |

    @361965 @361972 @361977 @361984 @361990 @361996 @362000
    Scenario: Master TC- LWC-Flex Edit Layout -Page Block Types - UI- SPI-To verify that page block should get render on tab when we provide page block type as 'field' in config.
    LWC-Flex Edit Layout -Page Block Types - UI- SPI-To verify that page block should get render on tab when we provide page block type as 'Attachments' in config.
    LWC-Flex Edit Layout -Page Block Types - UI- SPI-To verify that page block should get render on tab when we provide page block type as 'Approval History' in config.
    LWC-Flex Edit Layout -Page Block Types - UI- SPI-To verify that page block should get render on tab when we provide page block type as 'Flex Table' in config.
    LWC-Flex Edit Layout -Page Block Types - UI- SPI-To verify that page block should get render on tab when we provide page block type as 'Grid' in config.
    LWC-Flex Edit Layout -Page Block Types - UI- SPI-To verify that page block should get render on tab when we provide page block type as 'Notes and Attachments' in config.
    LWC-Flex Edit Layout -Page Block Types -UI-SPI -To verify that page block should get render on tab when we provide page block type as 'Record History' in config.
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
      And I click modal button "Save and Continue"
      And I wait for "2" seconds
      When I enter "Edition" values from "Application_Field_Values.xlsx"
      When I navigate to "Overview" sub tab
      Then I softly see "Application Information" page block displayed
      Then I softly see "Primary Place of Performance" page block displayed
      Then I softly see "Opportunity Overview" page block displayed
      Then I softly see "Application Overview" page block displayed
      Then I softly see "Project Information" page block displayed
      Then I softly see "Contacts" page block displayed
      When I navigate to "Forms and Files" sub tab
      And I pause execution for "5" seconds
      Then I softly see "Supporting Documents Checklist" page block displayed
      Then I softly see "Notes" page block displayed
      Then I softly see "Application Files" page block displayed
      When I navigate to "History" sub tab
      Then I softly see "Snapshot History" page block displayed
