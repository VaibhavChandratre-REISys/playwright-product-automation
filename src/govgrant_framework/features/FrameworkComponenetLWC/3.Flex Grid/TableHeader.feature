@TableHeader @flexgrid @FlexGrid
Feature: Table Header Scenarios
Business Need: To ensure that the flex grid of our web pages meets the needs of different user roles: admin, internal users, and external users.

  Background:
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Block            | Is Active | true              | ApiGeneratedId:0 |
      | Page Block            | Is Active | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | Grantor State Program     | Name                      | PB-13952                   |
      | Page Block:Page Block Detail | Is Active | true          | Recipient Pre-Application | Name                      | PB-13960                   |

  @316606 @316607
  Scenario Outline: LWC-E-grid-UI_Header_Admin_To verify that user is able to see provided text in a Header config as a Table Header
  |LWC-E-grid-UI_Header_PM_To verify that user is able to see provided text in a Header config as a Table Header|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active | true                | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header    | Parent Table Grid 2 | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I softly see "Parent Table Grid 2" page block displayed
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316610 @316611
  Scenario Outline:LWC-E-grid-UI_Header_Admin_To verify that user is able to see blank value as a Table header, when no any text is provided in a Header config
  |LWC-E-grid-UI_Header_PM_To verify that user is able to see blank value as a Table header, when no any text is provided in a Header config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header    |               | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I softly see "" page block displayed
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316613 @316314
  Scenario Outline:LWC-E-grid-UI_Header_Admin_To verify that user is able to enter only characters in Header
  |LWC-E-grid-UI_Header_PM_To verify that user is able to enter only characters in Header|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active | true              | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header    | Parent Table Grid | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I softly see "Parent Table Grid" page block displayed
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316617 @316618
  Scenario Outline: LWC-E-grid-UI_Header_Admin_To verify that user is able to enter only Digits in Header
  |LWC-E-grid-UI_Header_PM_To verify that user is able to enter only Digits in Header|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header    | 1234567890    | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I softly see "1234567890" page block displayed
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316620 @316622
  Scenario Outline: LWC-E-grid-UI_Header_Admin_To verify that user is able to enter alphanumeric values in Header
  |LWC-E-grid-UI_Header_PM_To verify that user is able to enter alphanumeric values in Header|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active | true                 | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header    | Test Table1234567890 | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I softly see "Test Table1234567890" page block displayed
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316626 @316627
  Scenario Outline: LWC-E-grid-UI_Header_Admin_To verify that user is able to enter alphanumeric values with sp.characters in Header
  |LWC-E-grid-UI_Header_PM_To verify that user is able to enter alphanumeric values with sp.characters in Header|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active | true                         | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header    | Test Table @$#%&^*1234567890 | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I softly see "Test Table @$#%&^*1234567890" page block displayed
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316629 @316630
  Scenario Outline: LWC-E-grid-UI_Header_Admin_To verify that user is able to enter Characters values with sp.characters in Header
  |LWC-E-grid-UI_Header_PM_To verify that user is able to enter Characters values with sp.characters in Header|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active | true                    | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header    | TestTable@$#%&^*!()_<>? | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I softly see "TestTable@$#%&^*!()_<>?" page block displayed
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316662 @316665
  Scenario Outline: LWC-E-grid-UI_HeaderHelpText_Admin_To verify user is able to see header help text provided in config, on hovering over respective help icon
  |LWC-E-grid-UI_HeaderHelpText_Admin_To verify user is able to see header help text provided in config, on hovering over respective help icon|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active        | true                | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Header Help Text | Help Text Test      | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    And I pause execution for "2" seconds
    Then I softly see "Help Text Test" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316672 @316675
  Scenario Outline: LWC-E-grid-UI_HeaderHelpText_Admin_To verify user is able to enter all characters in header help text
  |LWC-E-grid-UI_HeaderHelpText_PM_To verify user is able to enter all characters in header help text |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active        | true                       | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header           | Parent Table Grid 2        | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Header Help Text | abcdefghijklmnopqrstuvwxyz | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "abcdefghijklmnopqrstuvwxyz" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316681 @316682
  Scenario Outline: LWC-E-grid-UI_HeaderHelpText_Admin_To verify user is able to enter all digits in header help text
  |LWC-E-grid-UI_HeaderHelpText_PM_To verify user is able to enter all digits in header help text |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active        | true                | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Header Help Text | 0123456789          | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "0123456789" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316684 @316685
  Scenario Outline: LWC-E-grid-UI_HeaderHelpText_Admin_To verify user is able to enter Characters with sp.characters  in header help text
  |LWC-E-grid-UI_HeaderHelpText_PM_To verify user is able to enter Characters with sp.characters  in header help text |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active        | true                | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Header Help Text | !@#$%^&*()~         | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "!@#$%^&*()~" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316686
  Scenario: LWC-E-grid-UI_HeaderHelpText_SPI_To verify user is able to enter Characters with sp.characters  in header help text
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active        | true                | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Header Help Text | !@#$%^&*()~         | TestAutomationFlexTable4  | Name                      |                                        |
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
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "!@#$%^&*()~" shown as help text

  @316683
  Scenario: LWC-E-grid-UI_HeaderHelpText_SPI_To verify user is able to enter all digits in header help text
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active        | true                | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Header Help Text | 0123456789          | TestAutomationFlexTable4  | Name                      |                                        |
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
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "0123456789" shown as help text

  @316678 @316667
  Scenario: LWC-E-grid-UI_HeaderHelpText_SPI_To verify user is able to enter all characters in header help text
  |LWC-E-grid-UI_HeaderHelpText_SPI_To verify user is able to see header help text provided in config, on hovering over respective help icon|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active        | true                       | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header           | Parent Table Grid 2        | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Header Help Text | abcdefghijklmnopqrstuvwxyz | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "abcdefghijklmnopqrstuvwxyz" shown as help text

  @316687 @316688
  Scenario Outline: LWC-E-grid-UI_HeaderHelpText_Admin_To verify user is able to enter Alphanumeric values  in header help text
  |LWC-E-grid-UI_HeaderHelpText_PM_To verify user is able to enter Alphanumeric values  in header help text|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active        | true                | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Header Help Text | ABC123              | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "ABC123" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316690
  Scenario: LWC-E-grid-UI_HeaderHelpText_SPI_To verify user is able to enter Alphanumeric values  in header help text
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active        | true                | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Header Help Text | ABC123              | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "ABC123" shown as help text

  @316691 @316692
  Scenario Outline: LWC-E-grid-UI_HeaderHelpText_Admin_To verify user is able to enter Alphanumeric values with sp.characters in header help text
  |LWC-E-grid-UI_HeaderHelpText_PM_To verify user is able to enter Alphanumeric values with sp.characters in header help text |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active        | true                | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Header Help Text | TEST@#$876!@YUHJK   | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "TEST@#$876!@YUHJK" shown as help text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316693
  Scenario: LWC-E-grid-UI_HeaderHelpText_SPI_To verify user is able to enter Alphanumeric values with sp.characters in header help text
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active        | true                | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Header Help Text | TEST@#$876!@YUHJK   | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    Then I softly see "TEST@#$876!@YUHJK" shown as help text

  @316616
  Scenario:LWC-E-grid-UI_Header_SPI_To verify that user is able to enter only characters in Header
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active | true              | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header    | Parent Table Grid | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly see "Parent Table Grid" page block displayed

  @316619
  Scenario: LWC-E-grid-UI_Header_SPI_To verify that user is able to enter only Digits in Header
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header    | 1234567890    | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly see "1234567890" page block displayed

  @316623
  Scenario: LWC-E-grid-UI_Header_SPI_To verify that user is able to enter alphanumeric values in Header
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active | true                 | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header    | Test Table1234567890 | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly see "Test Table1234567890" page block displayed

  @316628 @316609
  Scenario: LWC-E-grid-UI_Header_SPI_To verify that user is able to enter alphanumeric values with sp.characters in Header
  |LWC-E-grid-UI_Header_SPI_To verify that user is able to see provided text in a Header config as a Table Header|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active | true                  | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header    | Test123@$#%&^*!()_<>? | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly see "Test123@$#%&^*!()_<>?" page block displayed

  @316612
  Scenario: LWC-E-grid-UI_Header_SPI_To verify that user is able to see blank value as a Table header, when no any text is provided in a Header config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active | true                | ApiGeneratedId:0 |
      | Flex Table            | Header    | Parent Table Grid 2 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header    |               | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly see " " page block displayed

############## Header Instruction Test Cases ##########
  @316701 @316702
  Scenario Outline: LWC-E-grid-UI_HeaderInstruction_Admin_To verify when user entered text in a header instruction in a table config, then it get displayed on top of the table, above quick search element
  |LWC-E-grid-UI_HeaderInstruction_PM_To verify when user entered text in a header instruction in a table config, then it get displayed on top of the table, above quick search element|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                  | filterId         |
      | Page Block            | Is Active          | true                               | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active          | true                               | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header Instruction | Test Automation Header Instruction | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I see "Test Automation Header Instruction" shown as header instruction text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316703
  Scenario: LWC-E-grid-UI_HeaderInstruction_SPI_To verify when user entered text in a header instruction in a table config, then it get displayed on top of the table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                  | filterId         |
      | Page Block            | Is Active          | true                               | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue                      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active          | true                               | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header Instruction | Test Automation Header Instruction | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I see "Test Automation Header Instruction" shown as header instruction text

  @316704 @316705
  Scenario Outline: LWC-E-grid-UI_HeaderInstruction_Admin_To verify when user not entered text in a header instruction in a table config, then nothing get displayed on top of the table, above quick search element
  |LWC-E-grid-UI_HeaderInstruction_PM_To verify when user not entered text in a header instruction in a table config, then nothing get displayed on top of the table, above quick search element|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                  | filterId         |
      | Page Block            | Is Active          | true                               | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active          | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header Instruction |               | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I see "" shown as header instruction text

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316706
  Scenario: LWC-E-grid-UI_HeaderInstruction_SPI_To verify when user not entered text in a header instruction in a table config, then nothing get displayed on top of the table, above quick search element
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                  | filterId         |
      | Page Block            | Is Active          | true                               | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active          | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header Instruction |               | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I see " " shown as header instruction text

  @316707 @316709 @316712 @316713 @316715 @316716 @316719 @316720 @316723 @316724
  Scenario Outline: LWC-E-grid-UI_HeaderInstruction_Admin_To verify user is able to enter all characters in header instruction
  |LWC-E-grid-UI_HeaderInstruction_PM_To verify user is able to enter all characters in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_Admin_To verify user is able to enter all digits in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_PM_To verify user is able to enter all digits in header instruction |
  |LWC-E-grid-UI_HeaderInstruction_Admin_To verify user is able to enter Characters with sp.characters  in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_PM_To verify user is able to enter Characters with sp.characters  in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_Admin_To verify user is able to enter Alphanumeric values  in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_PM_To verify user is able to enter Alphanumeric values  in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_Admin_To verify user is able to enter Alphanumeric values with sp.characters in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_PM_To verify user is able to enter Alphanumeric values with sp.characters in header instruction|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue | filterId         |
      | Page Block            | Is Active          | true              | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | <defaultvalue>    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active          | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header Instruction | <newvalue>    | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I see "<newvalue>" shown as header instruction text

    Examples:
      | User | defaultvalue                       | newvalue                   |
      #316707 #316709
     # | ADMIN  / Test Automation Header Instruction | abcdefghijklmnopqrstuvwxyz |
      | PM   | Test Automation Header Instruction | abcdefghijklmnopqrstuvwxyz |
      #316712 #316713
      #| ADMIN  | Test Automation Header Instruction | 1234567890               |
      | PM   | Test Automation Header Instruction | 1234567890                 |
      #316715 #316716
      #| ADMIN  | Test Automation Header Instruction | ABCdef!@#$%^&*()          |
      | PM   | Test Automation Header Instruction | ABCdef!@#$%^&*()           |
      #316719 #316720
      #| ADMIN  | Test Automation Header Instruction | AKNJ45678ret             |
      | PM   | Test Automation Header Instruction | AKNJ45678ret               |
      #316723 #316724
      #| ADMIN | Test Automation Header Instruction | AKNJ45678ret@!#$%^&*()     |
      | PM   | Test Automation Header Instruction | AKNJ45678ret@!#$%^&*()     |

  @316710 @316714 @316718 @316721 @316725
  Scenario Outline: LWC-E-grid-UI_HeaderInstruction_SPI_To verify user is able to enter all characters in header instruction
  |LWC-E-grid-UI_HeaderInstruction_SPI_To verify user is able to enter all digits in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_SPI_To verify user is able to enter Characters with sp.characters  in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_SPI_To verify user is able to enter Alphanumeric values  in header instruction|
  |LWC-E-grid-UI_HeaderInstruction_SPI_To verify user is able to enter Alphanumeric values with sp.characters in header instruction|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue | filterId         |
      | Page Block            | Is Active          | true              | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | <defaultvalue>    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active          | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Header Instruction | <newvalue>    | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    Then I see "<newvalue>" shown as header instruction text

    Examples:
      | User | defaultvalue                       | newvalue                   |
      #316710 #characters
      | SPI3 | Test Automation Header Instruction | abcdefghijklmnopqrstuvwxyz |
      #316714 #digits
      | SPI3 | Test Automation Header Instruction | 1234567890                 |
      #316718 #specialcharacters
      | SPI3 | Test Automation Header Instruction | ABCdef!@#$%^&*()           |
      #316721 #alphanumeric
      | SPI3 | Test Automation Header Instruction | AKNJ45678ret               |
      #316725 #specialwithalphanumeric
      | SPI3 | Test Automation Header Instruction | AKNJ45678ret@!#$%^&*()     |

  @316732 @316733 @316742 @316744
  Scenario Outline: LWC-E-grid-UI_Menu_Admin_To verify that user is able to see Menu (hamburger icon) section on top right corner, when Disable Menu config is disabled
  |LWC-E-grid-UI_Menu_PM_To verify that user is able to see Menu (hamburger icon) section on top right corner, when Disable Menu config is disabled|
  |LWC-E-grid-UI_Menu_Admin_To verify that user is able to see Refresh link under Menu section|
  |LWC-E-grid-UI_Menu_PM_To verify that user is able to see Refresh link under Menu section|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Block            | Is Active    | true              | ApiGeneratedId:0 |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName    | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active    | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Disable Menu | false         | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    #316732 #316733
    Then I see "Menu" action is displayed at the "---flexgrid:-:TestAutomationFlexGrid2TableId---" modal
    And I click on "Menu" button inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #316742 #316744
    Then I see "Refresh" button is displayed

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316734 @316745
  Scenario: LWC-E-grid-UI_Menu_SPI_To verify that user is able to see Menu (hamburger icon) section on top right corner, when Disable Menu config is disabled
  |LWC-E-grid-UI_Menu_SPI_To verify that user is able to see Refresh link under Menu section|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Block            | Is Active    | true              | ApiGeneratedId:0 |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active    | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Disable Menu | false         | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    #316734
    Then I see "Menu" action is displayed at the "---flexgrid:-:TestAutomationFlexGrid2TableId---" modal
    And I click on "Menu" button inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #316745
    Then I see "Refresh" button is displayed

  @316736 @316737
  Scenario Outline: LWC-E-grid-UI_Menu_Admin_To verify that user is not able to see Menu (hamburger icon) section on top right corner, when Disable Menu config is enabled
  |LWC-E-grid-UI_Menu_PM_To verify that user is not able to see Menu (hamburger icon) section on top right corner, when Disable Menu config is enabled|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Block            | Is Active    | true              | ApiGeneratedId:0 |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName    | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active    | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Disable Menu | true          | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    Then I do not see "Menu" action is displayed at the "---flexgrid:-:TestAutomationFlexGrid2TableId---" modal

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316740
  Scenario: LWC-E-grid-UI_Menu_SPI_To verify that user is not able to see Menu (hamburger icon) section on top right corner, when Disable Menu config is enabled
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Block            | Is Active    | true              | ApiGeneratedId:0 |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active    | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Disable Menu | true          | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    Then I do not see "Menu" action is displayed at the "---flexgrid:-:TestAutomationFlexGrid2TableId---" modal

  @316747 @316749
  Scenario Outline: LWC-E-grid-UI_Menu_Admin_To verify that user is able to Refresh table only by clicking on Menu - Refresh link
  |LWC-E-grid-UI_Menu_PM_To verify that user is able to Refresh table only by clicking on Menu - Refresh link|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Block            | Is Active    | true              | ApiGeneratedId:0 |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName    | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active    | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Disable Menu | false         | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    #When I click on parallel lines menu bar with data target value "#AgencyQualifiedLeadsRelatedFlexToggle"
    And I click on "Menu" button inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select "Refresh" from parallel lines dropdown of "Parent Table Grid 2"
    Then I see table is refreshing

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316750
  Scenario: LWC-E-grid-UI_Menu_SPI_To verify that user is able to Refresh table only by clicking on Menu - Refresh link
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Block            | Is Active    | true              | ApiGeneratedId:0 |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active    | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Disable Menu | false         | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    And I click on "Menu" button inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select "Refresh" from parallel lines dropdown of "Parent Table Grid 2"
    Then I see table is refreshing

  @316752 @316754
  Scenario Outline: LWC-E-grid-UI_Menu_Admin_To verify that user is able to see Help link under Menu section, when Enable Help config is enabled
  |LWC-E-grid-UI_Menu_PM_To verify that user is able to see Help link under Menu section, when Enable Help config is enabled|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName    | fieldOrignalValue | filterId         |
      | Page Block            | Is Active    | true              | ApiGeneratedId:0 |
      | Flex Table            | Disable Menu | false             | ApiGeneratedId:1 |
      | Flex Table            | Enable Help  | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active    | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Disable Menu | false         | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Enable Help  | true          | TestAutomationFlexTable4  | Name                      |                                        |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    And I click on "Menu" button inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "Help" button is displayed

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316766 @316767
  Scenario Outline:LWC-E-grid-UI_AutoIndex_Admin_To verify that user is able to see Index column at left side of the table, on enabling "Enable Auto Index" config
  |LWC-E-grid-UI_AutoIndex_PM_To verify that user is able to see Index column at left side of the table, on enabling "Enable Auto Index" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active         | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    Then I see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see sequence of column "#" is in correct order inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" with startvalue "1"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316768 @316780 @316783
  Scenario: LWC-E-grid-UI_AutoIndex_SPI_To verify that user is able to see Index column at left side of the table, on enabling "Enable Auto Index" config
  |LWC-E-grid-UI_AutoIndex_SPI_To verify that indexing displayed sequentially in a table|
  |LWC-E-grid-UI_AutoIndex_SPI_To verify that indexing continued on next further pages, of a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active         | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Enable Page Size  | true          | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Enable Pagination | true          | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Default Page Size | 10            | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    Then I see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #316780
    Then I see sequence of column "#" is in correct order inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" with startvalue "1"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #316783
    Then I see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @316770 @316772
  Scenario Outline: LWC-E-grid-UI_AutoIndex_Admin_To verify that user is not able to see Index column at left side of the table, on disabling  "Enable Auto Index" config
  |LWC-E-grid-UI_AutoIndex_PM_To verify that user is not able to see Index column at left side of the table, on disabling  "Enable Auto Index" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active         | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Enable Auto Index | false         | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    Then I do not see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316773
  Scenario: LWC-E-grid-UI_AutoIndex_SPI_To verify that user is not able to see Index column at left side of the table, on disabling  "Enable Auto Index" config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active         | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Enable Auto Index | false         | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    When I wait for "5" seconds
    Then I do not see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @316778 @316779
  Scenario Outline:LWC-E-grid-UI_AutoIndex_Admin_To verify that indexing displayed sequentially in a table
  |LWC-E-grid-UI_AutoIndex_PM_To verify that indexing displayed sequentially in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active         | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    Then I see sequence of column "#" is in correct order inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" with startvalue "1"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316781 @316782
  Scenario Outline: LWC-E-grid-UI_AutoIndex_Admin_To verify that indexing continued on next further pages, of a table
  |LWC-E-grid-UI_AutoIndex_PM_To verify that indexing continued on next further pages, of a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active         | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316784 @316785
  Scenario Outline:LWC-E-grid-UI_AutoIndex_Admin_To verify that indexing displayed correctly on performing quick search operation
  |LWC-E-grid-UI_AutoIndex_PM_To verify that indexing displayed correctly on performing quick search operation|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active         | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    Then I see value "1" for title "#" against the value "{flexgrid:ExpandParentRecord}" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316786
  Scenario: LWC-E-grid-UI_AutoIndex_SPI_To verify that indexing displayed correctly on performing quick search operation
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active         | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Enable Auto Index | false         | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    When I wait for "5" seconds
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    Then I see value "1" for title "#" against the value "{flexgrid:ExpandParentRecord}" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @316787
  Scenario Outline:LWC-E-grid-UI_AutoIndex_Admin_To verify that indexing displayed correctly on performing Filter operation
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Filter     | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Auto Index | true          | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Enable Filter     | true          | ProgramReviewStepTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Setup" sub tab
    And I wait for "3" seconds
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Pre-Screen |
    Then I see value "1" for title "#" against the value "Pre-Screen Review" inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316790 @316791
  Scenario Outline: LWC-E-grid-UI_AutoIndex_Admin_To verify that indexing displayed correctly on changing page size and /or pagination
  |LWC-E-grid-UI_AutoIndex_PM_To verify that indexing displayed correctly on changing page size and /or pagination|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active         | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316792
  Scenario: LWC-E-grid-UI_AutoIndex_SPI_To verify that indexing displayed correctly on changing page size and /or pagination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block:Page Block Detail | Is Active         | true          | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTablePageBlockSPI} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Enable Page Size  | true          | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Enable Pagination | true          | TestAutomationFlexTable4  | Name                      |                                        |
      | Flex Table:General           | Default Page Size | 5             | TestAutomationFlexTable4  | Name                      |                                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see auto index symbol "#" for tableid "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @316876 @317009 @317017 @317018 @317020 @317021 @317026 @317017
  Scenario Outline: LWC-E-grid-UI_Admin_To verify that color of text of Table header is as expected
  |LWC-E-grid-UI_PM_To verify that color of text of Table header is as expected|
  |LWC-E-grid-UI_Admin_To verify that color of text of Column header is as expected|
  |LWC-E-grid-UI_PM_To verify that color of text of Column header is as expected|
  |LWC-E-grid-UI_Admin_To verify that color of text of rows contents is as expected|
  |LWC-E-grid-UI_PM_To verify that color of text of rows contents is as expected|
  |LWC-E-grid-UI_Admin_To verify that color of text of Header Instruction is as expected|
  |LWC-E-grid-UI_PM_To verify that color of text of Header Instruction is as expected|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                  | filterId         |
      | Page Block            | Is Active          | true                               | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active          | true                               | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header Instruction | Test Automation Header Instruction | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    #316876 #317009
    Then I see header text color for "Parent Table Grid 2" is "DARK BLUE"
    #317017 #317018
    Then I see column header text color for "Category Name" is "BLACK"
    #317020 @317021
    Then I see rows content text color for "test" is "GRAY"
    #317026 #317027
    Then I see header instruction text color for "Test Automation Header Instruction" is "BLUE"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @317010 @317019 @317022 @317028 @317025
  Scenario: LWC-E-grid-UI_SPI_To verify that color of text of Table header is as expected
  |LWC-E-grid-UI_SPI_To verify that color of text of Column header is as expected|
  |LWC-E-grid-UI_SPI_To verify that color of text of rows contents is as expected|
  |LWC-E-grid-UI_SPI_To verify that color of text of Header Instruction is as expected|
  |LWC-E-grid-UI_SPI_To verify that color of text of Header help text is as expected|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName          | fieldOrignalValue                  | filterId         |
      | Page Block            | Is Active          | true                               | ApiGeneratedId:0 |
      | Flex Table:General    | Header Instruction | Test Automation Header Instruction | ApiGeneratedId:1 |
      | Flex Table            | Header             | Parent Table Grid 2                | ApiGeneratedId:2 |
      | Flex Table            | Header Help Text   | Help Text Test                     | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName          | fieldNewValue                      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active          | true                               | Recipient Pre-Application | Name                      | {flexgrid:ParentGridTableBlockSPI} |
      | Flex Table:General           | Header Instruction | Test Automation Header Instruction | TestAutomationFlexTable4  | Name                      |                                    |
      | Flex Table:General           | Header             | Parent Table Grid 2                | TestAutomationFlexTable4  | Name                      |                                    |
      | Flex Table:General           | Header Help Text   | Help Text Test                     | TestAutomationFlexTable4  | Name                      |                                    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "History" sub tab
    And I wait for "5" seconds
    #317010
    Then I see header text color for "Parent Table Grid 2" is "DARK BLUE"
    #317019
    Then I see column header text color for "Category Name" is "BLACK"
    #317022
    Then I see rows content text color for "test" is "GRAY"
    #317028
    Then I see header instruction text color for "Test Automation Header Instruction" is "BLUE"
    #317015
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    And I pause execution for "2" seconds
    Then I see header help text color for "Help Text Test" is "GRAY"

  @317023 @317024
  Scenario Outline:LWC-E-grid-UI_Admin_To verify that color of text of Header help text is as expected
  |LWC-E-grid-UI_PM_To verify that color of text of Header help text is as expected|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue   | filterId         |
      | Page Block            | Is Active        | true                | ApiGeneratedId:0 |
      | Flex Table            | Header           | Parent Table Grid 2 | ApiGeneratedId:1 |
      | Flex Table            | Header Help Text | Help Text Test      | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active        | true                | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Header           | Parent Table Grid 2 | TestAutomationFlexTable4 | Name                      |                                         |
      | Flex Table:General           | Header Help Text | Help Text Test      | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Parent Table Grid 2"
    And I pause execution for "2" seconds
    Then I see header help text color for "Help Text Test" is "GRAY"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @316774
  Scenario Outline: LWC-E-grid-UI_AutoIndex_Admin_To verify that user is able to see that indexing get auto generated or populated in respective column on adding new record
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Block            | Is Active         | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Auto Index | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block:Page Block Detail | Is Active         | true          | Grantor State Program    | Name                      | {flexgrid:ParentGridTableBlockInternal} |
      | Flex Table:General           | Enable Auto Index | true          | TestAutomationFlexTable4 | Name                      |                                         |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
   # Then I see "Total Records: 3" count in table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I see Total Records count "Total Records: 3" in table name "---flexgrid:-:ProgramReviewStepParentTableId---"
   # Then I see "Total Records: 3" count in enhanced grid "---flexgrid:-:ProgramReviewStepParentTableId---"
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | 4          | Test Description | Test      | 0               | 1           |
    And I pause execution for "4" seconds
    Then I see Total Records count "Total Records: 4" in table name "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |