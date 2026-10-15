@SessionStorage @flexgrid @FlexGrid
Feature: Session Storage Scenarios
Business Need: To ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  ########################### Parent #####################################
     ###### Page Refresh #####
  @327447 @327448
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 5 and refreshes the page then table should get open on the page size (Show entries) to 5
  LWC-E-grid-Sessionstorge_PM_To verify when user changes the page size (Show entries) to 5 and refreshes the page then table should get open on the page size (Show entries) to 5
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    And I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    And I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327450 @327451
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 10 and refreshes the page then table should get open on the page size (Show entries) to 10
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    #327450 #327451
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327454 @327455
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 20 and refreshes the page then table should get open on the page size (Show entries) to 20
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    And I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327458 @327459
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 50 and refreshes the page then table should get open on the page size (Show entries) to 50
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "50"
    And I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327461 @327462
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 100 and refreshes the page then table should get open on the page size (Show entries) to 100
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    And I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327473 @327475
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to next, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to next
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327479 @327480
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to Last, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to Last
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327482 @327483
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to Previous, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to Previous
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327485 @327487
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to First, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to First
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327490 @327491
  Scenario Outline:  LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to next, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to next
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "4" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I pause execution for "5" seconds
    And I click on back arrow
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327493 @327495
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to Last, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to Last
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "4" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327497 @327498
  Scenario Outline:LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to Previous, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to Previous
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327501 @327502
  Scenario Outline:LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to First, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to First
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327504 @327505
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to next and refreshes the page then table should get open on the page where pagination was set to next
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327507 @327508 @327510 @327511 @327513 @327514 @328028 @328029
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to Last and refreshes the page then table should get open on the page where pagination was set to Last
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to Previous and refreshes the page then table should get open on the page where pagination was set to Previous
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination to First and refreshes the page then table should get open on the page where pagination was set to First
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination then 'Click ‘Reset Table’  message should display
  LWC-E-grid-Sessionstorge_PM_To verify when user changes pagination then 'Click ‘Reset Table’ message should display
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328028 #328029
    Then I see the following message in the page details :
      | Table has been reset. |
    And I pause execution for "5" seconds
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327510 #327511
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327513 #327514
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327517 @327520 @327522 @327523 @327525 @327526
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user searches any value in quick search field, click on row level view action and click on page back arrow then table should show the records of Quick search results
  LWC-E-grid-Sessionstorge_Admin_To verify when user searches any value in quick search field, click on row level Edit action and click on page back arrow then table should show the records of Quick search results
  LWC-E-grid-Sessionstorge_Admin_To verify when user searches any value in quick search field and refreshes the page then table should show the records of Quick search results
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "View" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
     #327517 #327520
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "Edit" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
     #327522 #327523
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327525 #327526
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327410 @327411 @327428 @327429
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify that when user changes the page size (Show entries) to 5, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 5
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 5, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 5
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327410 @327411
    Then I see "5" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327428 #327429
    Then I see "5" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327413 @327414 @327431 @327432
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify that when user changes the page size (Show entries) to 10, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 10
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 10, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 10
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327413 #327414
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327431 #327432
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327416 @327417 @327435 @327436
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify that when user changes the page size (Show entries) to 20, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 20
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 20, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 20
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327416 @327417
    Then I see "20" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327435 #327436
    Then I see "20" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327419 @327420 @327438 @327439
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify that when user changes the page size (Show entries) to 50, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 50
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 50, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 50
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "50"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327419 @327420
    Then I see "50" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "50"
    And I click on "Edit" action for first record of table
    And I click on back arrow
        #327438 #327439
    Then I see "50" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327422 @327423 @327441 @327442
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify that when user changes the page size (Show entries) to 100, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 100
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes the page size (Show entries) to 100, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 100
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    And I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327422 #327423
    Then I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    And I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327441 #327442
    Then I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327528 @327529
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of standard field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for standard type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name           | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Eligibility Category Name" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see column name "Eligibility Category Name" with "Ascending" order
    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              |
      #| ADMIN |{flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |

  @327531 @327532 @327534 @327535
  Scenario Outline:LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of standard field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for standard type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Name           | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Eligibility Category Name" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327532 #327531
    Then I see column name "Eligibility Category Name" with "Ascending" order
    And I refresh the page
    #327534 #327535
    Then I see column name "Eligibility Category Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              |
    #  | ADMIN  | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |

  @327537 @327542 @327546 @327547 @327549 @327550
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Text field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Text type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Text field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Text type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Text field is set in ascending order and refreshes the page then records should be in ascending order for Text type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL          | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Category_Name__c | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Category Name" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327537 #327542
    Then I see column name "Category Name" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327546 #327547
    Then I see column name "Category Name" with "Ascending" order
    And I refresh the page
    #327549 #327550
    Then I see column name "Category Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327552 @327553 @327560 @327561 @327564 @327567
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Text area field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Text area type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Text area field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Text area type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Text area field is set in ascending order and refreshes the page then records should be in ascending order for Text area type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL           | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Text_Area_Test__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>    | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Text Area Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327552 #327553
    Then I see column name "Text Area Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327560 #327561
    Then I see column name "Text Area Test" with "Ascending" order
    And I refresh the page
    #327564 #327567
    Then I see column name "Text Area Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                    | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},Text_Area_Test__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Text_Area_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327586 @327587 @327620 @327622 @327625 @327627
  Scenario Outline:LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Number field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Number type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Number field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Number type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Number field is set in ascending order and refreshes the page then records should be in ascending order for Number type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow         | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL            | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Category_Number__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC                | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>     | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Category Number" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327586 #327587
    Then I see column name "Category Number" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327620 #327622
    Then I see column name "Category Number" with "Ascending" order
    And I refresh the page
     #327625 #327627
    Then I see column name "Category Number" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327630 @327631 @327635 @327637 @327639 @327640
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Currency field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Currency type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Currency field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Currency type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Currency field is set in ascending order and refreshes the page then records should be in ascending order for Currency type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL          | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Currency__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Test Currency" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327630 #327631
    Then I see column name "Test Currency" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327635 #327637
    Then I see column name "Test Currency" with "Ascending" order
    And I refresh the page
    #327639 #327640
    Then I see column name "Test Currency" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327648 @327649 @327652 @327654 @327660 @327663
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Date field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Date type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Date field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Date type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Date field is set in ascending order and refreshes the page then records should be in ascending order for Date type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Date__c   | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Test Date" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327648 #327649
    Then I see column name "Test Date" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327652 #327654
    Then I see column name "Test Date" with "Ascending" order
    And I refresh the page
    #327660 #327663
    Then I see column name "Test Date" with "Ascending" order

    Examples:
      | User | newFieldsApi                               | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},Test_Date__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Test_Date__c | {flexgrid:ParentFlexGrid1DFN} |

  @327666 @327667 @327670 @327672 @327676 @327677
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Date & Time field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Date & Time type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Date & Time field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Date & Time type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Date & Time field is set in ascending order and refreshes the page then records should be in ascending order for Date & Time type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL           | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Date_Time__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>    | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Test Date/Time" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
      #327666 #327667
    Then I see column name "Test Date/Time" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327670 #327672
    Then I see column name "Test Date/Time" with "Ascending" order
    And I refresh the page
       #327676 #327677
    Then I see column name "Test Date/Time" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327680 @327683 @327686 @327688 @327691 @327693
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Percent field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Percent type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Percent field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Percent type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Percent field is set in ascending order and refreshes the page then records should be in ascending order for Percent type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow              | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL                 | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | ParentPercentageTest__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC                     | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>          | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Parent Percentage Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327680 #327683
    Then I see column name "Parent Percentage Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327686 #327688
    Then I see column name "Parent Percentage Test" with "Ascending" order
    And I refresh the page
    #327691 #327693
    Then I see column name "Parent Percentage Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                          | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},ParentPercentageTest__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},ParentPercentageTest__c | {flexgrid:ParentFlexGrid1DFN} |

  @327700 @327702 @327706 @327707 @327709 @327711
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Formula field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Formula type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Formula field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Formula type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Formula field is set in ascending order and refreshes the page then records should be in ascending order for Formula type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow           | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL              | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | ParentFormulaTest__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC                  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>       | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "ParentFormulaTest" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327700 #327702
    Then I see column name "ParentFormulaTest" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327706 #327707
    Then I see column name "ParentFormulaTest" with "Ascending" order
    And I refresh the page
    #327709 #327711
    Then I see column name "ParentFormulaTest" with "Ascending" order

    Examples:
      | User | newFieldsApi                                       | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},ParentFormulaTest__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},ParentFormulaTest__c | {flexgrid:ParentFlexGrid1DFN} |

  @327715 @327717 @327720 @327721 @327724 @327725
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Picklist field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Picklist type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Picklist field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Picklist type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Picklist field is set in ascending order and refreshes the page then records should be in ascending order for Picklist type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Picklist_1__c  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Picklist 1" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327715 #327717
    Then I see column name "Picklist 1" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327720 #327721
    Then I see column name "Picklist 1" with "Ascending" order
    And I refresh the page
    #327724 #327725
    Then I see column name "Picklist 1" with "Ascending" order

    Examples:
      | User | newFieldsApi                                | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},Picklist_1__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Picklist_1__c | {flexgrid:ParentFlexGrid1DFN} |

  @327739 @327740 @327742 @327744 @327746 @327747
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Lookup field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Lookup type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Lookup field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Lookup type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Lookup field is set in ascending order and refreshes the page then records should be in ascending order for Lookup type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Test Lookup" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327739 #327740
    Then I see column name "Test Lookup" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327742 #327744
    Then I see column name "Test Lookup" with "Ascending" order
    And I refresh the page
    #327746 #327747
    Then I see column name "Test Lookup" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327749 @327752 @327754 @327755 @327757 @327759
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Email field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Email type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Email field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Email type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Email field is set in ascending order and refreshes the page then records should be in ascending order for Email type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Email_Test__c  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Email Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327749 #327752
    Then I see column name "Email Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327754 #327755
    Then I see column name "Email Test" with "Ascending" order
    And I refresh the page
    #327757 #327759
    Then I see column name "Email Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},Email_Test__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Email_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327767 @327768 @327772 @327773 @327777 @327778
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Phone field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Phone type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Phone field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Phone type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Phone field is set in ascending order and refreshes the page then records should be in ascending order for Phone type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Phone_Test__c  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Phone Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327767 #327768
    Then I see column name "Phone Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327772 #327773
    Then I see column name "Phone Test" with "Ascending" order
    And I refresh the page
     #327777 #327778
    Then I see column name "Phone Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},Phone_Test__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Phone_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327780 @327781 @327785 @327786 @327789 @327791
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of URL field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for URL type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of URL field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for URL type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of URL field is set in ascending order and refreshes the page then records should be in ascending order for URL type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | URL_Test__c    | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "URL Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327780 #327781
    Then I see column name "URL Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327785 #327786
    Then I see column name "URL Test" with "Ascending" order
    And I refresh the page
     #327789 #327791
    Then I see column name "URL Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                              | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},URL_Test__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},URL_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327793 @327794 @327797 @327798 @327800 @327802 @Holdforreffield @wip
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Reference field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Reference type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Reference field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Reference type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Reference field is set in ascending order and refreshes the page then records should be in ascending order for Reference type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            |                | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name " Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327793 #327794
    Then I see column name " Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327797 #327798
    Then I see column name " Test" with "Ascending" order
    And I refresh the page
    #327800 #327802
    Then I see column name " Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327806 @327807 @327810 @327814 @327819 @327821
  Scenario Outline:LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Checkbox field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Checkbox type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Checkbox field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Checkbox type field
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction of Checkbox field is set in ascending order and refreshes the page then records should be in ascending order for Checkbox type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL          | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Checkbox_Test__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Checkbox Test" with "Ascending" order

    And I click on "View" action for first record of table
    And I click on back arrow
    #327806 #327807
    Then I see column name "Checkbox Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327810 #327814
    Then I see column name "Checkbox Test" with "Ascending" order
    And I refresh the page
    #327819 #327821
    Then I see column name "Checkbox Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                   | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},Checkbox_Test__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Checkbox_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327920 @327922 @327924 @327925 @327927 @327928
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when sort direction-ascending order and searched any value in Quick search, user clicks on row level view action and click on page back arrow then table should restore search results and sorting
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction-ascending order and searched any value in Quick search, user clicks on row level Edit action and click on page back arrow then table should restore search results and sorting
  LWC-E-grid-Sessionstorge_Admin_To verify when sort direction-ascending order and searched any value in Quick search and refreshes the page then table should restore search results and sorting
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Test Lookup" with "Ascending" order
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "View" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
    #327920 #327922
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Lookup" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "Edit" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
     #327924 #327925
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Lookup" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327927 #327928
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Lookup" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327930 @327931 @327933 @327934 @327936 @327937 @needtocheckscenario @wip
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when page size is 10 and searched any value in Quick search, user clicks on row level view action and click on page back arrow then table should restore search results and page size
  LWC-E-grid-Sessionstorge_Admin_To verify when page size is 10 and searched any value in Quick search, user clicks on row level Edit action and click on page back arrow then table should restore search results and page size
  LWC-E-grid-Sessionstorge_Admin_To verify when page size is 10 and searched any value in Quick search and refreshes the page then table should restore search results and page size
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:3 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "View" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
    #327930 #327931
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "Edit" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
    #327933 #327934
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
     #327936 #327937
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327951 @327952 @327954 @327955 @327957 @327958
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when Sort direction-ascending order and page size is 10, user clicks on row level view action and click on page back arrow then table should restore page size and sorting
  LWC-E-grid-Sessionstorge_Admin_To verify when Sort direction-ascending order and page size is 10, user clicks on row level Edit action and click on page back arrow then table should restore page size and sorting
  LWC-E-grid-Sessionstorge_Admin_To verify when Sort direction-ascending order and page size is 10 and refreshes the page then table should restore page size and sorting
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
      | Flex Table            | Enable Page Size    | true               | ApiGeneratedId:5 |
      | Flex Table            | Enable Pagination   | true               | ApiGeneratedId:6 |
      | Flex Table            | Default Page Size   | 10                 | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size    | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination   | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size   | 5              | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab

    And I see column name "Test Lookup" with "Ascending" order
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    And I click on "View" action for first record of table
    And I click on back arrow
    #327951 #327952
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327954 #327955
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    And I refresh the page
    #327957 #327958
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327960 @327961 @327963 @327964 @327966 @327967
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when Pagination is changed to next and page size is 10, user clicks on row level view action and click on page back arrow then table should restore page size and Pagination
  LWC-E-grid-Sessionstorge_Admin_To verify when Pagination is changed to next and page size is 10, user clicks on row level Edit action and click on page back arrow then table should restore page size and Pagination
  LWC-E-grid-Sessionstorge_Admin_To verify when Pagination is changed to next and page size is 10 and refreshes the page then table should restore page size and Pagination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327960 #327961
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327963 #327964
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
     #327966 #327967
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @327969 @327970 @327972 @327974 @327976 @327977
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when Pagination is changed to next and Sort direction-ascending order, user clicks on row level view action and click on page back arrow then table should restore Pagination and sorting
  LWC-E-grid-Sessionstorge_Admin_To verify when Pagination is changed to next and Sort direction-ascending order, user clicks on row level Edit action and click on page back arrow then table should restore Pagination and sorting
  LWC-E-grid-Sessionstorge_Admin_To verify when Pagination is changed to next and Sort direction-ascending order and refreshes the page then table should restore Pagination and sorting
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
      | Flex Table            | Enable Page Size    | true               | ApiGeneratedId:5 |
      | Flex Table            | Enable Pagination   | true               | ApiGeneratedId:6 |
      | Flex Table            | Default Page Size   | 10                 | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size    | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination   | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size   | 5              | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Test Lookup" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
     #327969 #327970
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327972 #327974
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327976 #327977
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327979 @327080 @327983 @327984 @327986 @327987 @328025 @328026 @328045 @328046 @328049 @328050 @328041 @328042
  Scenario Outline: LWC-E-grid-Sessionstorge_Admin_To verify when user changes page size and clicks on Reset table then page size should set back to default value
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination and clicks on Reset table then pagination should set back to default value
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes sort direction and clicks on Reset table then sort direction should set back to default value
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes pagination and clicks on Reset table then 'Table has been reset.' message should display
  LWC-E-grid-Sessionstorge_PM_To verify when user changes pagination and clicks on Reset table then 'Table has been reset.' message should display
  LWC-E-grid-Sessionstorge_Admin_To verify when user changes sort direction and clicks on Reset table then 'Table has been reset.' message should display
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table            | Enable Page Size    | true               | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination   | true               | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 10                 | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size    | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination   | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size   | 10               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Category_Name__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "2" seconds
    When I navigate to "Files" sub tab
    And I click on column name "Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #327979 #327080 #328041 #328042
    Then I see column name "Category Name" with "Descending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328049 #328050
    Then I see the following message in the page details :
      | Table has been reset. |
    And I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    And I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328025 #328026
    Then I see the following message in the page details :
      | Table has been reset. |
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328045 #328046
    Then I see the following message in the page details :
      | Table has been reset. |
    #327983 #327984
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User | newFieldsApi                                 | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},LastModifiedBy | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},LastModifiedBy | {flexgrid:ParentFlexGrid1DFN} |

  @328009 @328010 @328035 @328036 @328052 @328053
  Scenario Outline:LWC-E-grid-Sessionstorge_Admin_To verify when user searches something in quick search and clicks on Reset table then table records should set back to default value
  LWC-E-grid-Sessionstorge_Admin_To verify when user searches something in quick search then 'Click ‘Reset Table’ message should display
  LWC-E-grid-Sessionstorge_PM_To verify when user searches something in quick search then 'Click ‘Reset Table’ message should display
  LWC-E-grid-Sessionstorge_Admin_To verify when user searches something in quick search and clicks on Reset table then 'Table has been reset.' message should display
  LWC-E-grid-Sessionstorge_PM_To verify when user searches something in quick search and clicks on Reset table then 'Table has been reset.' message should display
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By          | Name          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | ASC           | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328035 #328036 #328052
    Then I see the following message in the page details :
      | Table has been reset. |
    #328009
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Examples:
      | User |
      #| ADMIN |
      | PM   |

############Session Storage SPI ###################
  @327412 @327430 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify that when user changes the page size (Show entries) to 5, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 5
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 5, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 5
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327412
    Then I see "5" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327430
    Then I see "5" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327415 @327433 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify that when user changes the page size (Show entries) to 10, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 10
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 10, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 10
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
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
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327415
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on "Edit" action for first record of table
    And I click on back arrow
      #327433
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327418 @327437 @rerunvrush
  Scenario:LWC-E-grid-Sessionstorge_SPI_To verify that when user changes the page size (Show entries) to 20, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 20
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 20, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 20
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327418
    Then I see "20" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327437
    Then I see "20" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327421 @327440 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify that when user changes the page size (Show entries) to 50, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 50
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 50, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 50
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "50"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327421
    Then I see "50" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "50"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327440
    Then I see "50" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327424 @327443 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify that when user changes the page size (Show entries) to 100, click on row level view action and click on page back arrow then table should get open on the page size (Show entries) to 100
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 100, click on row level 'Edit' action and click on page back arrow then table should get open on the page size (Show entries) to 100
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    And I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    #327424
    Then I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    And I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327443
    Then I see "100" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327449 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 5 and refreshes the page then table should get open on the page size (Show entries) to 5
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I pause execution for "4" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    And I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327452 @rerunvrush
  Scenario:LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 10 and refreshes the page then table should get open on the page size (Show entries) to 10
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327457 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 20 and refreshes the page then table should get open on the page size (Show entries) to 20
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    And I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327460 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 50 and refreshes the page then table should get open on the page size (Show entries) to 50
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "50"
    And I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327463 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes the page size (Show entries) to 100 and refreshes the page then table should get open on the page size (Show entries) to 100
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    And I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327477 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to next, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to next
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327481 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to Last, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to Last
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327484 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to Previous, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to Previous
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327488 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to First, click on row level view action and click on page back arrow then table should get open on the page where pagination was set to First
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327492 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to next, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to next
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I pause execution for "5" seconds
    And I click on back arrow
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327496 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to Last, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to Last
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327500 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to Previous, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to Previous
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327503 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to First, click on row level Edit action and click on page back arrow then table should get open on the page where pagination was set to First
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327506 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to next and refreshes the page then table should get open on the page where pagination was set to next
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327509 @327512 @327515 @328030 @rerunvrush
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to Last and refreshes the page then table should get open on the page where pagination was set to Last
  To verify when user changes pagination to Previous and refreshes the page then table should get open on the page where pagination was set to Previous
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination to First and refreshes the page then table should get open on the page where pagination was set to First
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination then 'Click ‘Reset Table’ message should display
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    When I navigate to "History" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327509
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327512
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328030
    Then I see the following message in the page details :
      | Table has been reset. |
    And I pause execution for "5" seconds
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
     #327515
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @wip @327521 @327524 @327527 @quicksearchnotworkineditlayou-buglogged
  Scenario: LWC-E-grid-Sessionstorge_SPI_To verify when user searches any value in quick search field, click on row level view action and click on page back arrow then table should show the records of Quick search results
  LWC-E-grid-Sessionstorge_SPI_To verify when user searches any value in quick search field, click on row level Edit action and click on page back arrow then table should show the records of Quick search results
  LWC-E-grid-Sessionstorge_SPI_To verify when user searches any value in quick search field and refreshes the page then table should show the records of Quick search results
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
   # And I click on "Save" in the page details
    When I navigate to "History" sub tab
  #327521
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I pause execution for "3" seconds
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "View" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
  #327524
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "Edit" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #327527
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I pause execution for "5" seconds
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"

  @327530 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of standard field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for standard type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name           | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Eligibility Category Name" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    Then I see column name "Eligibility Category Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |

  @327533 @327536 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of standard field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for standard type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of standard field is set in ascending order and refreshes the page then records should be in ascending order for standard type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Name           | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Eligibility Category Name" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327533
    Then I see column name "Eligibility Category Name" with "Ascending" order
    And I refresh the page
    #327536
    Then I see column name "Eligibility Category Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |

  @327545 @327548 @327551 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Text field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Text type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Text field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Text type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Text field is set in ascending order and refreshes the page then records should be in ascending order for Text type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL          | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Category_Name__c | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Category Name" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327545
    Then I see column name "Category Name" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
       #327548
    Then I see column name "Category Name" with "Ascending" order
    And I refresh the page
      #327551
    Then I see column name "Category Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |

  @327555 @327563 @327568 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Text area field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Text area type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Text area field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Text area type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Text area field is set in ascending order and refreshes the page then records should be in ascending order for Text area type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL           | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Text_Area_Test__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>    | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Text Area Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327555
    Then I see column name "Text Area Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
      #327563
    Then I see column name "Text Area Test" with "Ascending" order
    And I refresh the page
     #327568
    Then I see column name "Text Area Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                    | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Text_Area_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327588 @327624 @327628 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Number field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Number type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Number field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Number type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Number field is set in ascending order and refreshes the page then records should be in ascending order for Number type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow         | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL            | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Category_Number__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC                | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>     | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Category Number" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327588
    Then I see column name "Category Number" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327624
    Then I see column name "Category Number" with "Ascending" order
    And I refresh the page
     #327628
    Then I see column name "Category Number" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327633 @327638 @327642 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Currency field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Currency type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Currency field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Currency type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Currency field is set in ascending order and refreshes the page then records should be in ascending order for Currency type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL          | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Currency__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Test Currency" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327633
    Then I see column name "Test Currency" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327638
    Then I see column name "Test Currency" with "Ascending" order
    And I refresh the page
     #327642
    Then I see column name "Test Currency" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327650 @327656 @327664 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Date field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Date type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Date__c   | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Test Date" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327650
    Then I see column name "Test Date" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327656
    Then I see column name "Test Date" with "Ascending" order
    And I refresh the page
    #327664
    Then I see column name "Test Date" with "Ascending" order

    Examples:
      | User | newFieldsApi                               | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Test_Date__c | {flexgrid:ParentFlexGrid1DFN} |

  @327669 @327675 @327678 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Date & Time field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Date & Time type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL           | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Date_Time__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>    | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Test Date/Time" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327669
    Then I see column name "Test Date/Time" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327675
    Then I see column name "Test Date/Time" with "Ascending" order
    And I refresh the page
    #327678
    Then I see column name "Test Date/Time" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327685 @327689 @327697 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Percent field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Percent type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Percent field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Percent type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Percent field is set in ascending order and refreshes the page then records should be in ascending order for Percent type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow              | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL                 | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | ParentPercentageTest__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC                     | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>          | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Parent Percentage Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327685
    Then I see column name "Parent Percentage Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327689
    Then I see column name "Parent Percentage Test" with "Ascending" order
    #327697
    And I refresh the page
    Then I see column name "Parent Percentage Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                          | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},ParentPercentageTest__c | {flexgrid:ParentFlexGrid1DFN} |

  @327704 @327708 @327713 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Formula field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Formula type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Formula field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Formula type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Formula field is set in ascending order and refreshes the page then records should be in ascending order for Formula type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow           | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL              | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | ParentFormulaTest__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC                  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>       | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "ParentFormulaTest" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
     #327704
    Then I see column name "ParentFormulaTest" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327708
    Then I see column name "ParentFormulaTest" with "Ascending" order
    And I refresh the page
    #327713
    Then I see column name "ParentFormulaTest" with "Ascending" order

    Examples:
      | User | newFieldsApi                                       | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},ParentFormulaTest__c | {flexgrid:ParentFlexGrid1DFN} |

  @327718 @327722 @327726 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Picklist field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Picklist type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Picklist field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Picklist type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Picklist field is set in ascending order and refreshes the page then records should be in ascending order for Picklist type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Picklist_1__c  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Picklist 1" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327718
    Then I see column name "Picklist 1" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327722
    Then I see column name "Picklist 1" with "Ascending" order
    And I refresh the page
    #327726
    Then I see column name "Picklist 1" with "Ascending" order

    Examples:
      | User | newFieldsApi                                | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Picklist_1__c | {flexgrid:ParentFlexGrid1DFN} |

  @327741 @327745 @327748 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Lookup field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Lookup type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Lookup field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Lookup type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Lookup field is set in ascending order and refreshes the page then records should be in ascending order for Lookup type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Test Lookup" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327741
    Then I see column name "Test Lookup" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327745
    Then I see column name "Test Lookup" with "Ascending" order
    And I refresh the page
    #327748
    Then I see column name "Test Lookup" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327753 @327756 @327761 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Email field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Email type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Email field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Email type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Email field is set in ascending order and refreshes the page then records should be in ascending order for Email type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Email_Test__c  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Email Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327753
    Then I see column name "Email Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327756
    Then I see column name "Email Test" with "Ascending" order
    And I refresh the page
    #327761
    Then I see column name "Email Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Email_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327769 @327776 @327779 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Phone field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Phone type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Phone field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Phone type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Phone field is set in ascending order and refreshes the page then records should be in ascending order for Phone type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Phone_Test__c  | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Phone Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327769
    Then I see column name "Phone Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327776
    Then I see column name "Phone Test" with "Ascending" order
    And I refresh the page
    #327779
    Then I see column name "Phone Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Phone_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327783 @327788 @327792 @rerunvrush
  Scenario Outline:LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of URL field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for URL type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of URL field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for URL type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of URL field is set in ascending order and refreshes the page then records should be in ascending order for URL type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | URL_Test__c    | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "URL Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327783
    Then I see column name "URL Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327788
    Then I see column name "URL Test" with "Ascending" order
    And I refresh the page
    #327792
    Then I see column name "URL Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                              | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},URL_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327809 @327817 @327823 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Checkbox field is set in ascending order, user clicks on row level view action and click on page back arrow then records should be in ascending order for Checkbox type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Checkbox field is set in ascending order, user clicks on row level Edit action and click on page back arrow then records should be in ascending order for Checkbox type field
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction of Checkbox field is set in ascending order and refreshes the page then records should be in ascending order for Checkbox type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL          | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Checkbox_Test__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Checkbox Test" with "Ascending" order
    And I click on "View" action for first record of table
    And I click on back arrow
    #327809
    Then I see column name "Checkbox Test" with "Ascending" order
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327817
    Then I see column name "Checkbox Test" with "Ascending" order
    And I refresh the page
     #327823
    Then I see column name "Checkbox Test" with "Ascending" order

    Examples:
      | User | newFieldsApi                                   | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Checkbox_Test__c | {flexgrid:ParentFlexGrid1DFN} |

  @327923 @327926 @327929 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when sort direction-ascending order and searched any value in Quick search, user clicks on row level view action and click on page back arrow then table should restore search results and sorting
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction-ascending order and searched any value in Quick search, user clicks on row level Edit action and click on page back arrow then table should restore search results and sorting
  LWC-E-grid-Sessionstorge_SPI_To verify when sort direction-ascending order and searched any value in Quick search and refreshes the page then table should restore search results and sorting
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "History" sub tab
    And I see column name "Test Lookup" with "Ascending" order
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "View" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
    #327923
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Lookup" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on "Edit" icon for "{flexgrid:TestRecord}" inside table
    And I click on back arrow
     #327926
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Lookup" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    When I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327929
    Then I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Lookup" with "Ascending" order

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327953 @327956 @327959 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when Sort direction-ascending order and page size is 10, user clicks on row level view action and click on page back arrow then table should restore page size and sorting
  LWC-E-grid-Sessionstorge_SPI_To verify when Sort direction-ascending order and page size is 10, user clicks on row level Edit action and click on page back arrow then table should restore page size and sorting
  LWC-E-grid-Sessionstorge_SPI_To verify when Sort direction-ascending order and page size is 10 and refreshes the page then table should restore page size and sorting
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
      | Flex Table            | Enable Page Size    | true               | ApiGeneratedId:5 |
      | Flex Table            | Enable Pagination   | true               | ApiGeneratedId:6 |
      | Flex Table            | Default Page Size   | 10                 | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size    | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination   | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size   | 5              | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Test Lookup" with "Ascending" order
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
     And I click on "View" action for first record of table
    And I click on back arrow
    #327953
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327956
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I refresh the page
    #327959
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see "10" with page size dropdown at "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327962 @327965 @327968 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when Pagination is changed to next and page size is 10, user clicks on row level view action and click on page back arrow then table should restore page size and Pagination
  LWC-E-grid-Sessionstorge_SPI_To verify when Pagination is changed to next and page size is 10, user clicks on row level Edit action and click on page back arrow then table should restore page size and Pagination
  LWC-E-grid-Sessionstorge_SPI_To verify when Pagination is changed to next and page size is 10 and refreshes the page then table should restore page size and Pagination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table Action     | Where To Open ?   |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior   | EditRecord        | ApiGeneratedId:1 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:2 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:3 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?   | SameWindow    | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior   | OpenURL       | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
     #327962
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
    #327965
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
     #327968
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      | SPI3 |

  @327971 @327975 @327978 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when Pagination is changed to next and Sort direction-ascending order, user clicks on row level view action and click on page back arrow then table should restore Pagination and sorting
  LWC-E-grid-Sessionstorge_SPI_To verify when Pagination is changed to next and Sort direction-ascending order, user clicks on row level Edit action and click on page back arrow then table should restore Pagination and sorting
  LWC-E-grid-Sessionstorge_SPI_To verify when Pagination is changed to next and Sort direction-ascending order and refreshes the page then table should restore Pagination and sorting
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table Action     | Where To Open ?     |                    | ApiGeneratedId:0 |
      | Flex Table Action     | Action Behavior     | EditRecord         | ApiGeneratedId:1 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:2 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:3 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
      | Flex Table            | Enable Page Size    | true               | ApiGeneratedId:5 |
      | Flex Table            | Enable Pagination   | true               | ApiGeneratedId:6 |
      | Flex Table            | Default Page Size   | 10                 | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Where To Open ?     | SameWindow     | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table Action     | Action Behavior     | OpenURL        | TestAutomationFlexTable4 | Name                      | Edit                       |
      | Flex Table:General    | Order By            | Test_Lookup__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size    | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination   | true           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size   | 5              | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I see column name "Test Lookup" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "View" action for first record of table
    And I click on back arrow
     #327971
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on "Edit" action for first record of table
    And I click on back arrow
     #327975
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Test Lookup" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I refresh the page
    #327978
    Then I see column name "Test Lookup" with "Ascending" order
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User | newFieldsApi                  | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ParentFlexGrid1DFN} |

  @327982 @327985 @328008 @328027 @328032 @328043 @328047 @328034 @328033 @328051 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when user changes page size and clicks on Reset table then page size should set back to default value
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination and clicks on Reset table then pagination should set back to default value
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes sort direction and clicks on Reset table then sort direction should set back to default value
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes page size and clicks on Reset table then 'Table has been reset.' message should display
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes pagination and clicks on Reset table then 'Table has been reset.' message should display
  LWC-E-grid-Sessionstorge_SPI_To verify when user changes sort direction and clicks on Reset table then 'Table has been reset.' message should display
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue  | filterId         |
      | Flex Table            | Enable Page Size    | true               | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination   | true               | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size   | 10                 | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate   | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | DESC               | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi> | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size    | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination   | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size   | 10               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Category_Name__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction      | ASC              | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>   | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I navigate to "History" sub tab
    And I click on column name "Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328034
    Then I see column name "Category Name" with "Descending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328008 #328051
    Then I see the following message in the page details :
      | Table has been reset. |
    And I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328027 #328043
    Then I see the following message in the page details :
      | Table has been reset. |
     #327982
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #327985
    And I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328047
    Then I see the following message in the page details :
      | Table has been reset. |
    #328032 #328033
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User | newFieldsApi                                 | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},LastModifiedBy | {flexgrid:ParentFlexGrid1DFN} |

  @328011 @328037 @328054 @rerunvrush
  Scenario Outline: LWC-E-grid-Sessionstorge_SPI_To verify when user searches something in quick search and clicks on Reset table then table records should set back to default value
  LWC-E-grid-Sessionstorge_SPI_To verify when user searches something in quick search then 'Click ‘Reset Table’ message should display
  LWC-E-grid-Sessionstorge_SPI_To verify when user searches something in quick search and clicks on Reset table then 'Table has been reset.' message should display
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By          | Name          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | ASC           | TestAutomationFlexTable4 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "History" sub tab
    And I perform quick search for "{flexgrid:TestRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I softly see value "{flexgrid:TestRecord}" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #328037 #328054
    Then I see the following message in the page details :
      | Table has been reset. |
    #328011
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      | SPI3 |
