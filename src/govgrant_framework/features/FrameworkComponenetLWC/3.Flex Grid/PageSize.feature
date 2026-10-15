@PageSize @flexgrid @FlexGrid
Feature: Page Size Scenarios
Business Need: To ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @308069 @308362
  Scenario: LWC-E-grid-Parent_UI/UX Page Size_SPI_To verify that when user select '5' in Show Entries picklist then user should get 5 records per page on grid
  |LWC-E-grid-Child_UI/UX Page Size_SPI_To verify that when user select '5' in Show Entries picklist then user should get 5 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    #308069
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "5"
    And I see "5" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308362
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestChildTableId---"

  @307928 @308067 @308360 @308361
  Scenario Outline:LWC-E-grid-Parent_UI/UX Page Size_Admin_To verify that when user select '5' in Show Entries picklist then user should get 5 records per page on grid
  |LWC-E-grid-Parent_UI/UX Page Size_PM_To verify that when user select '5' in Show Entries picklist then user should get 5 records per page on child table|
  |LWC-E-grid-Child_UI/UX Page Size_Admin/PM_To verify that when user select '5' in Show Entries picklist then user should get 5 records per page on child table|
  |LWC-E-grid-Child_UI/UX Page Size_PM_To verify that when user select '5' in Show Entries picklist then user should get 5 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "5"
    #307928 #308067
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "5"
    And I see "5" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308360 #308361
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @307392 @308084 @308367 @308368
  Scenario Outline: LWC-E-grid-Parent_UI/UX Page Size_Admin_To verify that when user select '20' in Show Entries picklist then user should get 20 records per page on Table
  |LWC-E-grid-Parent_UI/UX Page Size_PM_To verify that when user select '20' in Show Entries picklist then user should get 20 records per page on Table|
  |LWC-E-grid-Child_UI/UX Page Size_Admin_To verify that when user select '20' in Show Entries picklist then user should get 20 records per page on child table|
  |LWC-E-grid-Child_UI/UX Page Size_PM_To verify that when user select '20' in Show Entries picklist then user should get 20 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    #307392 #308084
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "20"
    And I see "20" with page size dropdown at "---flexgrid:-:TestChildTableId---"
     #308367 #308368
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308387 @308369
  Scenario:LWC-E-grid-Parent_UI/UX Page Size_SPI_To verify that when user select '20' in Show Entries picklist then user should get 20 records per page on grid
  |LWC-E-grid-Child_UI/UX Page Size_SPI_To verify that when user select '20' in Show Entries picklist then user should get 20 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
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
    #308387
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "20"
    And I see "20" with page size dropdown at "---flexgrid:-:TestChildTableId---"
     #308369
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestChildTableId---"

  @307934 @308097 @308370 @308371
  Scenario Outline:LWC-E-grid-Parent_UI/UX Page Size_Admin_To verify that when user select '50' in Show Entries picklist then user should get 50 records per page on Table
  |LWC-E-grid-Parent_UI/UX Page Size_PM_To verify that when user select '50' in Show Entries picklist then user should get 50 records per page on grid|
  | LWC-E-grid-Child_UI/UX Page Size_Admin_To verify that when user select '50' in Show Entries picklist then user should get 50 records per page on child table|
  |LWC-E-grid-Child_UI/UX Page Size_PM_To verify that when user select '50' in Show Entries picklist then user should get 50 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "50"
    #307934 #308097
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 51 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "50"
    And I see "50" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308370 #308371
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 51 to 100" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308985 @308372
  Scenario:LWC-E-grid-Parent_UI/UX Page Size_SPI_To verify that when user select '50' in Show Entries picklist then user should get 50 records per page on grid
  |LWC-E-grid-Child_UI/UX Page Size_SPI_To verify that when user select '50' in Show Entries picklist then user should get 50 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
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
    And I pause execution for "3" seconds
    #308985
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 51 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I pause execution for "4" seconds
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "50"
    And I pause execution for "6" seconds
    And I see "50" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308372
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 51 to 100" inside table id "---flexgrid:-:TestChildTableId---"

  @307935 @308100 @308373 @308373
  Scenario Outline:LWC-E-grid-Parent_UI/UX Page Size_Admin_To verify that when user select '100' in Show Entries picklist then user should get 100 records per page on Table
  |LWC-E-grid-Parent_UI/UX Page Size_PM_To verify that when user select '100' in Show Entries picklist then user should get 100 records per page on grid|
  |LWC-E-grid-Child_UI/UX Page Size_Admin_To verify that when user select '100' in Show Entries picklist then user should get 100 records per page on child Table|
  |LWC-E-grid-Child_UI/UX Page Size_PM_To verify that when user select '100' in Show Entries picklist then user should get 100 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    #307935 #308100
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "100"
    And I see "100" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308370 #308371
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308101 @308375
  Scenario:LWC-E-grid-Parent_UI/UX Page Size_SPI_To verify that when user select '100' in Show Entries picklist then user should get 100 records per page on grid
  |LWC-E-grid-Child_UI/UX Page Size_SPI_To verify that when user select '100' in Show Entries picklist then user should get 100 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable6 | Name                      |                            |
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
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "100"
    #308101
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "100"
    And I pause execution for "3" seconds
    And I see "100" with page size dropdown at "---flexgrid:-:TestChildTableId---"
     #308375
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestChildTableId---"

  @307929 @308075 @308063 @308065
  Scenario Outline:LWC-E-grid-Parent_UI/UX Page Size_Admin_To verify that when user select '10' in Show Entries picklist then user should get 10 records per page on Table
  |LWC-E-grid-Parent_UI/UX Page Size_PM_To verify that when user select '10' in Show Entries picklist then user should get 10 records per page on grid|
  |LWC-E-grid-Child_UI/UX Page Size_Admin_To verify that when user select '10' in Show Entries picklist then user should get 10 records per page on child Table|
  |LWC-E-grid-Child_UI/UX Page Size_PM_To verify that when user select '10' in Show Entries picklist then user should get 10 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    #307929 #308075
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "10"
    And I see "10" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308363 #308365
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308079 @308366
  Scenario:LWC-E-grid-Parent_UI/UX Page Size_SPI_To verify that when user select '10' in Show Entries picklist then user should get 10 records per page on grid
  |LWC-E-grid-Child_UI/UX Page Size_SPI_To verify that when user select '10' in Show Entries picklist then user should get 10 records per page on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
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
    And I pause execution for "5" seconds
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "10"
    #308079
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "10"
    And I see "10" with page size dropdown at "---flexgrid:-:TestChildTableId---"
     #308366
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestChildTableId---"

  @308103 @308378
  Scenario:LWC-E-grid-Parent_UI/UX Page Size_SPI_To verify that when user select 'All' in Show Entries picklist then user should get All records on grid
  |LWC-E-grid-Child_UI/UX Page Size_SPI_To verify that when user select 'All' in Show Entries picklist then user should get All records on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
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
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "All"
    #308103
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I pause execution for "3" seconds
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "All"
    And I pause execution for "3" seconds
     #308378
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"

  @307936 @308104 @308376 @308377
  Scenario Outline:LWC-E-grid-Parent_UI/UX Page Size_Admin_To verify that when user select 'All' in Show Entries picklist then user should get All records on Table
  |LWC-E-grid-Parent_UI/UX Page Size_PM_To verify that when user select 'All' in Show Entries picklist then user should get All records on grid|
  |LWC-E-grid-Child_UI/UX Page Size_Admin_To verify that when user select 'All' in Show Entries picklist then user should get All records on child table|
  |LWC-E-grid-Child_UI/UX Page Size_PM_To verify that when user select 'All' in Show Entries picklist then user should get All records on child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:6 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable6 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable6 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "All"
    #307936 #308104
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "All"
    #308376 #308377
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @307956 @308110 @308382 @308383
  Scenario Outline: LWC-E-grid-Parent_UI/UX Page Size_Admin_To verify that when user select page size other than Default Page Size then after getting result user should get display 'Reset Icon' button
  |LWC-E-grid-Parent_UI/UX Page Size_PM_To verify that when user select page size other than Default Page Size then after getting result user should get display 'Reset Icon' button|
  |LWC-E-grid-Child_UI/UX Page Size_Admin_To verify that when user select page size other than Default Page Size then after getting result user should get display 'Reset Icon' button|
  |LWC-E-grid-Child_UI/UX Page Size_PM_To verify that when user select page size other than Default Page Size then after getting result user should get display 'Reset Icon' button|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---" is "20"
    #307956 #308110
    Then I see "resetIcon" button in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "20"
    #308382 #308383
    Then I see "resetIcon" button in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308108 @308384
  Scenario: LWC-E-grid-Parent_UI/UX Page Size_SPI_To verify that when user select page size other than Default Page Size then after getting result user should get display 'Reset Icon' button
  |LWC-E-grid-Child_UI/UX Page Size_SPI_To verify that when user select page size other than Default Page Size then after getting result user should get display 'Reset Table' button|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
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
    #308108
    Then I see "resetIcon" button in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I select value inside table "---flexgrid:-:TestChildTableId---" is "20"
    #308384
    Then I see "resetIcon" button in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"



    ############## Default Page Size ###############
  @308036 @308149
  Scenario: LWC-E-grid-Parent_Default Page Size_SPI_To verify that user able to see default only 5 records per page on grid if Default Page Size is '5' in config.
  |LWC-E-grid-Child_Default Page Size_SPI_To verify that user able to see default only 5 records per page on grid if Default Page Size is '5' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable5 | Name                      |                            |
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
    #308036
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "5" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308149
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestChildTableId---"

  @307842 @308035 @308138 @308144
  Scenario Outline:LWC-E-grid-Parent_Default Page Size_Admin_To verify that when user select '5' as Default Page Size then user should get default 5 records per page on grid
  |LWC-E-grid-Parent_Default Page Size_PM_To verify that user able to see default only 5 records per page on grid if Default Page Size is '5' in config.|
  |LWC-E-grid-Child_Default Page Size_Admin_To verify that when user select '5' as Default Page Size then user should get default 5 records per page on grid|
  |LWC-E-grid-Child_Default Page Size_PM_To verify that user able to see default only 5 records per page on grid if Default Page Size is '5' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
   #307842 #308035
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "5" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308138 #308144
    Then I see table contains "Showing 1 to 5" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 6 to 10" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @307871 @308348 @308153 @308155
  Scenario Outline: LWC-E-grid-Parent_Default Page Size_Admin_To verify that when user select '10' as Default Page Size then user should get default 10 records per page on Table
  |LWC-E-grid-Parent_Default Page Size_PM_To verify that user able to see default only 10 records per page on grid if Default Page Size is '10' in config.|
  |LWC-E-grid-Child_Default Page Size_Admin_To verify that when user select '10' as Default Page Size then user should get default 10 records per page on Table|
  |LWC-E-grid-Child_Default Page Size_PM_To verify that user able to see default only 10 records per page on grid if Default Page Size is '10' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
      #307871 #308348
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "10" with page size dropdown at "---flexgrid:-:TestChildTableId---"
      #308153 #308155
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @307872 @308053 @308268 @308171
  Scenario Outline: LWC-E-grid-Parent_Default Page Size_Admin_To verify that when user select '20' as Default Page Size then user should get default 20 records per page on grid
  |LWC-E-grid-Parent_Default Page Size_PM_To verify that user able to see default only 20 records per page on grid if Default Page Size is '20' in config.|
  |LWC-E-grid-Child_Default Page Size_Admin_To verify that when user select '20' as Default Page Size then user should get default 20 records per page on grid|
  |LWC-E-grid-Child_Default Page Size_PM_To verify that user able to see default only 20 records per page on grid if Default Page Size is '20' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 20            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 20            | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    #307872 #308053
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "20" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308268 #308171
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308050 @308156
  Scenario: LWC-E-grid-Parent_Default Page Size_SPI_To verify that user able to see default only 10 records per page on grid if Default Page Size is '10' in config.
  |LWC-E-grid-Child_Default Page Size_SPI_To verify that user able to see default only 10 records per page on grid if Default Page Size is '10' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
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
    And I pause execution for "5" seconds
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
   #308050
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "10" with page size dropdown at "---flexgrid:-:TestChildTableId---"
      #308156
    Then I see table contains "Showing 1 to 10" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 11 to 20" inside table id "---flexgrid:-:TestChildTableId---"

  @308055 @308178
  Scenario:LWC-E-grid-Parent_Default Page Size_SPI_To verify that user able to see default only 20 records per page on grid if Default Page Size is '20' in config.
  |LWC-E-grid-Child_Default Page Size_SPI_To verify that user able to see default only 20 records per page on grid if Default Page Size is '20' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 20            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 20            | TestAutomationFlexTable5 | Name                      |                            |
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
     #308055
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "20" with page size dropdown at "---flexgrid:-:TestChildTableId---"
      #308178
    Then I see table contains "Showing 1 to 20" inside table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    Then I see table contains "Showing 21 to 40" inside table id "---flexgrid:-:TestChildTableId---"

  @307873 @308059 @308188 @308194
  Scenario Outline: LWC-E-grid-Parent_Default Page Size_Admin_To verify that when user select '50' as Default Page Size then user should get default 50 records per page on grid
  |LWC-E-grid-Parent_Default Page Size_PM_To verify that user able to see default only 50 records per page on grid if Default Page Size is '50' in config.|
  |LWC-E-grid-Child_Default Page Size_Admin_To verify that when user select '50' as Default Page Size then user should get default 50 records per page on grid|
  |LWC-E-grid-Child_Default Page Size_PM_To verify that user able to see default only 50 records per page on grid if Default Page Size is '50' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 50            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 50            | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    #307873 #308059
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "50" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308188 #308194
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308061 @308199
  Scenario: LWC-E-grid-Parent_Default Page Size_SPI_To verify that user able to see default only 50 records per page on grid if Default Page Size is '50' in config.
  |LWC-E-grid-Child_Default Page Size_SPI_To verify that user able to see default only 50 records per page on grid if Default Page Size is '50' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 50            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 50            | TestAutomationFlexTable5 | Name                      |                            |
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
      #308061
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "50" with page size dropdown at "---flexgrid:-:TestChildTableId---"
      #308199
    Then I see table contains "Showing 1 to 50" inside table id "---flexgrid:-:TestChildTableId---"

  @308472 @308496 @308536 @308539
  Scenario Outline: LWC-E-grid-Parent_Default Page Size_Admin_To verify that when user select '100' as Default Page Size then user should get default 100 records per page on grid
  |LWC-E-grid-Parent_Default Page Size_PM_To verify that user able to see default only 100 records per page on grid if Default Page Size is '100' in config.|
  |LWC-E-grid-Child_Default Page Size_Admin_To verify that when user select '100' as Default Page Size then user should get default 100 records per page on grid|
  |LWC-E-grid-Child_Default Page Size_PM_To verify that user able to see default only 100 records per page on grid if Default Page Size is '100' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    #308472 #308496
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "100" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #308536 #308539
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308533 @308543
  Scenario: LWC-E-grid-Parent_Default Page Size_SPI_To verify that user able to see default only 100 records per page on grid if Default Page Size is '100' in config.
  |LWC-E-grid-Child_Default Page Size_SPI_To verify that user able to see default only 100 records per page on grid if Default Page Size is '100' in config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable5 | Name                      |                            |
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
      #308533
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "100" with page size dropdown at "---flexgrid:-:TestChildTableId---"
      #308543
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestChildTableId---"

  @309115 @309117 @309120 @309128
  Scenario Outline: LWC-E-grid-Parent_Default Page Size_Admin_To verify that when user select 'None' as Default Page Size then user should get default 100 records per page on grid
  |LWC-E-grid-Parent_Default Page Size_PM_To verify that when user select 'None' as Default Page Size then user should get default 100 records per page on grid|
  |LWC-E-grid-Child_Default Page Size_Admin_To verify that when user select 'None' as Default Page Size then user should get default 100 records per page on grid|
  |LWC-E-grid-Child_Default Page Size_PM_To verify that when user select 'None' as Default Page Size then user should get default 100 records per page on grid|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size |               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size |               | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    #309115 #309117
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "100" with page size dropdown at "---flexgrid:-:TestChildTableId---"
    #309120 #309128
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @309119 @309130
  Scenario: LWC-E-grid-Parent_Default Page Size_SPI_To verify that when user select 'None' as Default Page Size then user should get default 100 records per page on grid
  |LWC-E-grid-Child_Default Page Size_SPI_To verify that when user select 'None' as Default Page Size then user should get default 100 records per page on grid|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 100           | TestAutomationFlexTable5 | Name                      |                            |
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
      #309119
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see "100" with page size dropdown at "---flexgrid:-:TestChildTableId---"
      #309130
    Then I see table contains "Showing 1 to 100" inside table id "---flexgrid:-:TestChildTableId---"

    ################ Enable/ Disable Page Size #######

  @307834 @308023 @308114 @308118
  Scenario Outline: LWC-E-grid-Parent_Enable Page Size_Admin_To verify that when user enable page size then user should get Show page size Entries picklist on grid.
  |LWC-E-grid-Parent_Enable Page Size_PM_To verify that user is able to see 'Show page size Entries' picklist on grid if Page size is enable in Config.|
  |LWC-E-grid-Child_Enable Page Size_Admin_To verify that when user enable page size then user should get Show page size Entries picklist on grid.|
  |LWC-E-grid-Child_Enable Page Size_PM_To verify that user is able to see 'Show page size Entries' picklist on grid if Page size is enable in config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size | true          | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    #307834 #308023
    Then I see "Entries" page size inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #308114 #308118
    Then I see "Entries" page size inside table "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308027 @308124
  Scenario:LWC-E-grid-Parent_Enable/Disable Page Size_SPI_To verify that user is able to see 'Show page size Entries' picklist on grid if Page size is enable in Config
  |LWC-E-grid-Child_Enable/Disable Page Size_SPI_To verify that user is able to see 'Show page size Entries' picklist on grid if Page size is enable in Config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size | true          | TestAutomationFlexTable5 | Name                      |                            |
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
      #308027
    Then I see "Entries" page size inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
      #308124
    Then I see "Entries" page size inside table "---flexgrid:-:TestChildTableId---"

  @307835 @308030 @308124 @308126
  Scenario Outline: LWC-E-grid-Parent_Enable/Disable Page Size_Admin_To verify that when user disable page size then user should not get Show page size Entries picklist on grid
  |LWC-E-grid-Parent_Enable/Disable Page Size_PM_To verify that user is not able to see 'Show page size Entries' picklist on grid if Page size is disable in Config.|
  |LWC-E-grid-Child_Enable/Disable Page Size_Admin_To verify that when user disable page size then user should not get Show page size Entries picklist on grid|
  |LWC-E-grid-Child_Enable/Disable Page Size_PM_To verify that user is not able to see 'Show page size Entries' picklist on grid if Page size is disable in Config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size | false         | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size | false         | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
      #307835 #308030
    Then I do not see "Entries" page size inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
      #308124 #308126
    Then I do not see "Entries" page size inside table "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308031 @308134
  Scenario: LWC-E-grid-Parent_Enable/Disable Page Size_SPI_To verify that user is not able to see 'Show page size Entries' picklist on grid if Page size is disable.
  |LWC-E-grid-Child_Enable/Disable Page Size_SPI_To verify that user is not able to see 'Show page size Entries' picklist on grid if Page size is disable.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Page Size | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size | false         | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size | false         | TestAutomationFlexTable5 | Name                      |                            |
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
      #308031
    Then I do not see "Entries" page size inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
      #308134
    Then I do not see "Entries" page size inside table "---flexgrid:-:TestChildTableId---"
