@Pagination @flexgrid @FlexGrid
Feature: Pagination Scenarios
Business Need: To ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @378780 @308792 @309201 @309302
  Scenario Outline: LWC-E-grid-Parent_Enable/Disable Pagination_Admin_To verify that when user enable pagination then user should get Pagination on grid.
  |LWC-E-grid-Parent_Enable Pagination_PM_To verify that user is able to see pagination on grid if Pagination is enable in Config.|
  |LWC-E-grid-Child_Enable/Disable Pagination_Admin_To verify that when user enable pagination then user should get Pagination on child table.|
  |LWC-E-grid-Child_Enable/Disable Pagination_PM_To verify that user is able to see pagination on child table if Pagination is enable in Config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:1 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:2 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "6" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "4" seconds
    When I navigate to "Files" sub tab
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #309201 #309202
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308801 @308802 @309205 @309207
  Scenario Outline: LWC-E-grid-Parent_Enable/Disable Pagination_Admin_To verify that when user disable pagination then user should not get Pagination on grid.
  |LWC-E-grid-Parent_Enable/Disable Pagination_PM_To verify that user is not able to see pagination on grid if Pagination is disable in Config.|
  |LWC-E-grid-Child_Enable/Disable Pagination_Admin_To verify that when user disable pagination then user should not get Pagination on child table.|
  |LWC-E-grid-Child_Enable/Disable Pagination_PM_To verify that user is not able to see pagination on child table if Pagination is disable in Config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:1 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:2 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Pagination | false         | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | false         | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "4" seconds
    When I navigate to "Files" sub tab
    #308801 #308802 
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #309205 #309207 
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308842 @308855 @308843 @308845
  Scenario Outline: LWC-E-grid-Parent_UI/UX Pagination_Admin_To verify that when user click on 'Next' (arrow) in pagination then user should get navigated to next page of table
  |LWC-E-grid-Parent_UI/UX Pagination_PM_To verify that when user click on 'Next' (arrow) in pagination then user should get navigated to next page of table|
  |LWC-E-grid-Child_UI/UX Pagination_Admin_To verify that when user click on 'Next' (arrow) in pagination then user should get navigated to next page of child table
  |LWC-E-grid-Child_UI/UX Pagination_PM_To verify that when user click on 'Next' (arrow) in pagination then user should get navigated to next page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308842 #308855 
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
     #308843 #308845 
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308862 @308863 @308876 @308881
  Scenario Outline:LWC-E-grid-Parent_UI/UX Pagination_Admin_To verify that when user click on 'Previous' (arrow) in pagination then user should get navigated to previous page of table
  |LWC-E-grid-Parent_UI/UX Pagination_PM_To verify that when user click on 'Previous' (arrow) in pagination then user should get navigated to Previous page of table|
  |LWC-E-grid-Child_UI/UX Pagination_Admin_To verify that when user click on 'Previous' (arrow) in pagination then user should get navigated to Previous page of child table|
  |LWC-E-grid-Child_UI/UX Pagination_PM_To verify that when user click on 'Previous' (arrow) in pagination then user should get navigated to Previous page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308862 #308863
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestChildTableId---"
     #308876 #308881 
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308934 @308935 @308937 @308939
  Scenario Outline: LWC-E-grid-Parent_UI/UX Pagination_Admin_To verify that when user click on 'First' (arrow) in pagination then user should get navigated to First page of table
  |LWC-E-grid-Parent_UI/UX Pagination_PM_To verify that when user click on 'First' (arrow) in pagination then user should get navigated to First page of table|
  |LWC-E-grid-Child_UI/UX Pagination_Admin_To verify that when user click on 'First' (arrow) in pagination then user should get navigated to First page of child table|
  |LWC-E-grid-Child_UI/UX Pagination_PM_To verify that when user click on 'First' (arrow) in pagination then user should get navigated to First page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
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
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308934 #308935 
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestChildTableId---"
    #308937 #308939 
    Then I see "First" page is displayed inside table "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308946 @308947 @308949 @308959
  Scenario Outline: LWC-E-grid-Parent_UI/UX Pagination_Admin_To verify that when user click on 'Last' (arrow) in pagination then user should get navigated to Last page of table
  |LWC-E-grid-Parent_UI/UX Pagination_PM_To verify that when user click on 'Last' (arrow) in pagination then user should get navigated to Last page of table|
  |LWC-E-grid-Child_UI/UX Pagination_Admin_To verify that when user click on 'Last' (arrow) in pagination then user should get navigated to Last page of child table|
  |LWC-E-grid-Child_UI/UX Pagination_PM_To verify that when user click on 'Last' (arrow) in pagination then user should get navigated to Last page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Files" sub tab
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308946 #308947 
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestChildTableId---"
    #308949 #308959 
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestChildTableId---"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @308785 @309203
  Scenario:LWC-E-grid-Parent_Enable/Disable Pagination_SPI_To verify that user is able to see pagination on grid if Pagination is enable in Config.
  |LWC-E-grid-Child_Enable/Disable Pagination_SPI_To verify that user is able to see pagination on child table if Pagination is enable in Config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:1 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:2 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
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
    #308785 
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
      #309203 
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"

  @308804 @309212
  Scenario:LWC-E-grid-Parent_Enable/Disable Pagination_SPI_To verify that user is not able to see pagination on grid if Pagination is disable in Config.
  |LWC-E-grid-Child_Enable/Disable Pagination_SPI_To verify that user is not able to see pagination on child table if Pagination is disable in Config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:1 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:2 |
      | Flex Grid             | Default Page Size | 5                 | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Pagination | false         | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 5             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | false         | TestAutomationFlexTable5 | Name                      |                            |
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
    #308804 
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
      #309212 
    Then I do not see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"

  @308556 @308847
  Scenario:LWC-E-grid-Parent_UI/UX Pagination_SPI_To verify that when user click on 'Next' (arrow) in pagination then user should get navigated to next page of table
  |LWC-E-grid-Child_UI/UX Pagination_SPI_To verify that when user click on 'Next' (arrow) in pagination then user should get navigated to next page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
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
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308556
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    #308847 
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestChildTableId---"

  @308868 @308885
  Scenario:LWC-E-grid-Parent_UI/UX Pagination_SPI_To verify that when user click on 'Previous' (arrow) in pagination then user should get navigated to Previous page of table
  |LWC-E-grid-Child_UI/UX Pagination_SPI_To verify that when user click on 'Previous' (arrow) in pagination then user should get navigated to Previous page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
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
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308868 
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "Previous" for table id "---flexgrid:-:TestChildTableId---"
    #308885 
    Then I see "Previous" page is displayed inside table "---flexgrid:-:TestChildTableId---"

  @308936 @308941
  Scenario:LWC-E-grid-Parent_UI/UX Pagination_SPI_To verify that when user click on 'First' (arrow) in pagination then user should get navigated to First page of table
    |LWC-E-grid-Child_UI/UX Pagination_SPI_To verify that when user click on 'First' (arrow) in pagination then user should get navigated to First page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
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
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308936 
    Then I see "First" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestChildTableId---"
    And I click on page navigation arrow "First" for table id "---flexgrid:-:TestChildTableId---"
    #308941 
    Then I see "First" page is displayed inside table "---flexgrid:-:TestChildTableId---"

  @308948 @308960
  Scenario:LWC-E-grid-Parent_UI/UX Pagination_SPI_To verify that when user click on 'Last' (arrow) in pagination then user should get navigated to Last page of table
  |LWC-E-grid-Child_UI/UX Pagination_SPI_To verify that when user click on 'Last' (arrow) in pagination then user should get navigated to Last page of child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:3 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:4 |
      | Flex Table            | Default Page Size | 10                | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
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
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #308948 
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on page navigation arrow "Last" for table id "---flexgrid:-:TestChildTableId---"
    #308960 
    Then I see "Last" page is displayed inside table "---flexgrid:-:TestChildTableId---"
