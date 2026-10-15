@Sort @flexgrid @FlexGrid
Feature: Sort Order Scenarios
Business Need: To ensure that the sort order of table meets the needs of different user roles: admin, internal users, and external users.

  @312629 @312632 @312634 @312635
  Scenario Outline: LWC-E-grid-Parent_Config Sort_Admin_To verify that all available records of parent table are sorted in ascending direction, when Sort direction is selected as 'Asc'.
  |LWC-E-grid-Parent_UI Sort_PM_To verify that all available records of parent table are sorted in ascending direction, when Sort direction is selected as 'Asc'.|
  |LWC-E-grid-Child_Config Sort_Admin_To verify that all available records of child table are sorted in ascending direction, when Sort direction is selected as 'Asc'.|
  |LWC-E-grid-Child_UI Sort_PM_To verify that all available records of child table are sorted in ascending direction, when Sort direction is selected as 'Asc'.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                 | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                 | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    #312629 #312632
    Then I see column name "Eligibility Category Name" with "Ascending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #322634 #312635
    Then I see column name "Eligibility Question Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      #| ADMIN |{flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |{flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312638 @312641 @312644 @312645
  Scenario Outline: LWC-E-grid-Parent_Config Sort_Admin_To verify that all available records of parent table are sorted in ascending direction, when Sort direction is selected as 'None'.
  |LWC-E-grid-Parent_UI Sort_PM_To verify that all available records of parent table are sorted in ascending direction, when Sort direction is selected as 'None'.|
  |LWC-E-grid-Child_Config Sort_Admin_To verify that all available records of child table are sorted in ascending direction, when Sort direction is selected as 'None'.|
  |LWC-E-grid-Child_UI Sort_PM_To verify that all available records of child table are sorted in ascending direction, when Sort direction is selected as 'None'.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      |                     | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      |                     | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    #312638 #312641
    Then I see column name "Eligibility Category Name" with "Ascending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #312644 #312645
    Then I see column name "Eligibility Question Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      #| ADMIN |{flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |{flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312650 @312651 @212673 @212679 @312654 @312656 @312682 @312683
  Scenario Outline: LWC-E-grid-Parent_Config Sort_Admin_To verify that all available records of parent table are sorted in descending direction, when Sort direction is selected 'Desc'
  |LWC-E-grid-Parent_UI Sort_PM_To verify that all available records of parent table are sorted in descending direction, when Sort direction is selected as 'Desc'|
  |LWC-E-grid-Child_Config Sort_Admin_To verify that all available records of child table are sorted in descending direction, when Sort direction is selected as 'Desc'|
  |LWC-E-grid-Child_UI Sort_PM_To verify that all available records of child table are sorted in descending direction, when Sort direction is selected as 'Desc'|
  |LWC-E-grid-Parent_UI Sort_Admin_To verify that parent table is by default rendering in order by field which is added in 'Order By' in Config.|
  |LWC-E-grid-Parent_UI Sort_PM_To verify that parent table is by default rendering in order by field which is added in 'Order By' in Config.|
  |LWC-E-grid-Child_UI Sort_Admin_To verify that child table is by default rendering in order by field which is added in 'Order By' in Config.|
  |LWC-E-grid-Child_UI Sort_PM_To verify that child table is by default rendering in order by field which is added in 'Order By' in Config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    #312650 #312651 #212673 #212679
    Then I see column name "Eligibility Category Name" with "Descending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #312654 #312656 #312682 #312683
    Then I see column name "Eligibility Question Name" with "Descending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      #| ADMIN |{flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |{flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312710 @312712 @312718 @312719
  Scenario Outline: LWC-E-grid-Parent_UI Sort_Admin_To verify that when user click on column header then sort direction should be changed.
  |LWC-E-grid-Parent_UI Sort_PM_To verify that when user click on column header then sort direction should be changed.|
  |LWC-E-grid-Child_UI Sort_Admin_To verify that when user click on column header then sort direction should be changed.
  |LWC-E-grid-Child_UI Sort_PM_To verify that when user click on column header then sort direction should be changed.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    #312710 #312712
    And I click on column name "Eligibility Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Eligibility Category Name" with "Ascending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #312718 #312719
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    Then I see column name "Eligibility Question Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      #| ADMIN |{flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |{flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312728 @312729 @312731 @312733
  Scenario Outline: LWC-E-grid-Parent_UI Sort_Admin_To verify that when user changes sort direction and click on 'Reset Table' then sort direction should be set back to default sort direction.
  |LWC-E-grid-Parent_UI Sort_PM_To verify that when user changes sort direction and click on 'Reset Table' then sort direction should be set back to default sort direction.|
  |LWC-E-grid-Child_UI Sort_Admin_To verify that when user changes sort direction and click on 'Reset Table' then sort direction should be set back to default sort direction.|
  |LWC-E-grid-Child_UI Sort_PM_To verify that when user changes sort direction and click on 'Reset Table' then sort direction should be set back to default sort direction.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I click on column name "Eligibility Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Eligibility Category Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
     #312728 #312729
    Then I see the following message in the page details :
      | Table has been reset. |
    #Then I see column name "Eligibility Category Name" with "Descending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    And I see column name "Eligibility Question Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
        #312731 #312733
    Then I see column name "Eligibility Question Name" with "Descending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      #| ADMIN |{flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} |{flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312750 @312751
  Scenario Outline: LWC-E-grid-Parent_UI Sort_Admin_To verify that when user pagination changes to next and sort direction in ascending order and refreshes page then table should restore the pagination and sorting.
  |LWC-E-grid-Parent_UI Sort_PM_To verify that when user pagination changes to next and sort direction in ascending order and refreshes page then table should restore the pagination and sorting.|  |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By          | Category_Name__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC             | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Category Name" with "Descending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on column name "Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Category Name" with "Ascending" order
    And I refresh the page
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Category Name" with "Ascending" order

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @312753 @312757
  Scenario Outline: LWC-E-grid-Child_UI Sort_Admin_To verify that when user pagination changes to next and sort direction in ascending order and refreshes page then table should restore the pagination and sorting.
  |LWC-E-grid-Child_UI Sort_PM_To verify that when user changes pagination to next and sort direction in ascending order and refreshes page then table should restore the pagination and sorting.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Order By          | Name          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC          | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"
    And I see column name "Eligibility Question Name" with "Descending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestChildTableId---"
    And I see column name "Eligibility Question Name" with "Ascending" order
    And I refresh the page
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"
    Then I see column name "Eligibility Question Name" with "Descending" order

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @312791 @312794 @312947 @312948 @313192 @313193
  Scenario Outline: LWC-E-grid-Parent_UI Sort_Admin_To verify that when user changes sort direction on clicking column header then "Click ‘Reset Table’ under the menu icon to refresh the table’s default values" message should be displayed.
  |LWC-E-grid-Parent_UI Sort_PM_To verify that when user changes sort direction on clicking column header then "Click ‘Reset Table’ under the menu icon to refresh the table’s default values" message should be displayed.|
  |LWC-E-grid-Parent_UI Sort_Admin_To verify when user changes sort direction and clicks on clear session then sort direction should set back to default sort direction|
  |LWC-E-grid-Parent_UI Sort_PM_To verify when user changes sort direction and clicks on clear session then sort direction should set back to default sort direction|
  |LWC-E-grid-Parent_UI Sort_PM_To verify when user changes sort direction and clicks on clear session then sort direction should set back to default sort direction|
  |LWC-E-grid-Parent_UI Sort_Admin_To verify that when user click on column header then sort direction should be changed.|
  |LWC-E-grid-Parent_UI Sort_PM_To verify that when user click on column header then sort direction should be changed.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By          | Category_Name__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC             | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    And I see column name "Category Name" with "Descending" order
    And I click on column name "Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #313192 #313193
    Then I see column name "Category Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #312791 #312794 #312947 #312948
    Then I see the following message in the page details :
      | Table has been reset. |

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @312798 @312800 @312950 @312951 @313195 @313196
  Scenario Outline: LWC-E-grid-Child_UI Sort_Admin_To verify that when user changes sort direction on clicking column header then "Click ‘Reset Table’ under the menu icon to refresh the table’s default values" message should be displayed.
  |LWC-E-grid-Child_UI Sort_PM_To verify that when user changes sort direction on clicking column header then "Click ‘Reset Table’ under the menu icon to refresh the table’s default values" message should be displayed.|
  |LWC-E-grid-Child_UI Sort_Admin_To verify when user changes sort direction and clicks on clear session then sort direction should set back to default sort direction|
  |LWC-E-grid-Child_UI Sort_PM_To verify when user changes sort direction and clicks on clear session then sort direction should set back to default sort direction|
  |LWC-E-grid-Child_UI Sort_Admin_To verify that when user click on column header then sort direction should be changed.|
  |LWC-E-grid-Child_UI Sort_PM_To verify that when user click on column header then sort direction should be changed.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Order By          | Name          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC          | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Files" sub tab
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see column name "Eligibility Question Name" with "Descending" order
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    #313195 #313196
    Then I see column name "Eligibility Question Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #312798 #312800 #312950 #312951
    Then I see the following message in the page details :
      | Table has been reset. |

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @312887 @312896
  Scenario Outline: LWC-E-grid-Parent_UI Sort_Admin_To verify that when user changes sort direction for 'Date' datatypes field to ascending then dates should be sorted in ascending order.
  LWC-E-grid-Parent_UI Sort_PM_To verify that when user changes sort direction for 'Date' datatypes field to ascending then dates should be sorted in ascending order.
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
      | Flex Table:General    | Sort Direction      | DESC           | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi> | TestAutomationFlexTable4 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    And I see column name "Test Date" with "Descending" order
    And I click on column name "Test Date" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Date" with "Ascending" order

    Examples:
      | User | newFieldsApi                               | defaultFieldsApi              |
      #| ADMIN | {flexgrid:ParentFlexGrid1DFN},Test_Date__c | {flexgrid:ParentFlexGrid1DFN} |
      | PM   | {flexgrid:ParentFlexGrid1DFN},Test_Date__c | {flexgrid:ParentFlexGrid1DFN} |

  @312922 @312924
  Scenario Outline:LWC-E-grid-Child_UI Sort_Admin_To verify that when user changes sort direction for 'Date' datatypes field to ascending then dates should be sorted in ascending order.
  |LWC-E-grid-Child_UI Sort_PM_To verify that when user changes sort direction for 'Date' datatypes field to ascending then dates should be sorted in ascending order.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Test_Date_1__c      | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    When I navigate to "Files" sub tab
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see column name "Test Date 1" with "Descending" order
    And I click on column name "Test Date 1" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Date 1" with "Ascending" order

    Examples:
      | User | newFieldsApiChild                          | defaultFieldsApiChild       |
      #| ADMIN |{flexgrid:ChildFlexGridDFN},Test_Date_1__c | {flexgrid:ChildFlexGridDFN} |
      | PM   | {flexgrid:ChildFlexGridDFN},Test_Date_1__c | {flexgrid:ChildFlexGridDFN} |

  @312633 @312636
  Scenario Outline:LWC-E-grid-Parent_UI Sort_SPI_To verify that all available records of parent table are sorted in ascending direction, when Sort direction is selected as 'Asc'.
  |LWC-E-grid-Child_UI Sort_SPI_To verify that all available records of child table are sorted in ascending direction, when Sort direction is selected as 'Asc'.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                 | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                 | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    #312633
    Then I see column name "Eligibility Category Name" with "Ascending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #322636
    Then I see column name "Eligibility Question Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312643 @312647
  Scenario Outline:LWC-E-grid-Parent_UI Sort_SPI_To verify that all available records of parent table are sorted in ascending direction, when Sort direction is selected as 'None'.
  |LWC-E-grid-Child_UI Sort_SPI_To verify that all available records of child table are sorted in ascending direction, when Sort direction is selected as 'None'.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      |                     | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      |                     | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    #312643
    Then I see column name "Eligibility Category Name" with "Ascending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #312647
    Then I see column name "Eligibility Question Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312652 @312657
  Scenario Outline: LWC-E-grid-Parent_UI Sort_SPI_To verify that all available records of parent table are sorted in descending direction, when Sort direction is selected as 'Desc'
  |LWC-E-grid-Child_UI Sort_SPI_To verify that all available records of child table are sorted in descending direction, when Sort direction is selected as 'Desc'|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    #312652
    Then I see column name "Eligibility Category Name" with "Descending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #312657
    Then I see column name "Eligibility Question Name" with "Descending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312714 @312721
  Scenario Outline:LWC-E-grid-Parent_UI Sort_SPI_To verify that when user click on column header then sort direction should be changed.
  |LWC-E-grid-Child_UI Sort_SPI_To verify that when user click on column header then sort direction should be changed.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    #312714
    And I click on column name "Eligibility Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Eligibility Category Name" with "Ascending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #312721
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    Then I see column name "Eligibility Question Name" with "Ascending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312680 @312684 @313191
  Scenario Outline: LWC-E-grid-Parent_UI Sort_SPI_To verify that parent table is by default rendering in order by field which is added in 'Order By' in Config.
  |LWC-E-grid-Child_UI Sort_SPI_To verify that child table is by default rendering in order by field which is added in 'Order By' in Config.|
    |LWC-E-grid-Child_UI Sort_SPI_To verify that child table is by default rendering in order by field which is added in 'Order By' in Config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    #312680
    Then I see column name "Eligibility Category Name" with "Descending" order
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    #312684 #313191
    Then I see column name "Eligibility Question Name" with "Descending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312730 @312734
  Scenario Outline: LWC-E-grid-Parent_UI Sort_SPI_To verify that when user changes sort direction and click on 'Reset Table' then sort direction should be set back to default sort direction.
  |LWC-E-grid-Child_UI Sort_SPI_To verify that when user changes sort direction and click on 'Reset Table' then sort direction should be set back to default sort direction.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | DESC                    | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApi>      | ApiGeneratedId:2 |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:4 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable4 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable4 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApi>      | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By            | Name                | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I click on column name "Eligibility Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Eligibility Category Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
     #312730
    Then I see the following message in the page details :
      | Table has been reset. |
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    And I see column name "Eligibility Question Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
        #312734
    Then I see column name "Eligibility Question Name" with "Descending" order

    Examples:
      | User | newFieldsApi                       | defaultFieldsApi              | newFieldsApiChild                | defaultFieldsApiChild       |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Name | {flexgrid:ParentFlexGrid1DFN} | {flexgrid:ChildFlexGridDFN},Name | {flexgrid:ChildFlexGridDFN} |

  @312752
  Scenario Outline: LWC-E-grid-Parent_UI Sort_SPI_To verify that when user pagination changes to next and sort direction in ascending order and refreshes page then table should restore the pagination and sorting.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By          | Category_Name__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC             | TestAutomationFlexTable4 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Category Name" with "Descending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I click on column name "Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    And I see column name "Category Name" with "Ascending" order
    And I refresh the page
    Then I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Category Name" with "Ascending" order

    Examples:
      | User |
      | SPI3 |

  @312756
  Scenario Outline: LWC-E-grid-Child_UI Sort_SPI_To verify that when user changes pagination to next and sort direction in ascending order and refreshes page then table should restore the pagination and sorting.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Order By          | Name          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC          | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"
    And I see column name "Eligibility Question Name" with "Descending" order
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:TestChildTableId---"
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    And I see pagination is displayed with "Page 2 of" inside table id "---flexgrid:-:TestChildTableId---"
    And I see column name "Eligibility Question Name" with "Ascending" order
    And I refresh the page
    Then I see pagination is displayed with "Page 1 of" inside table id "---flexgrid:-:TestChildTableId---"
    Then I see column name "Eligibility Question Name" with "Descending" order

    Examples:
      | User |
      | SPI3 |

  @312797
  Scenario Outline: LWC-E-grid-Parent_UI Sort_SPI_To verify that when user changes sort direction on clicking column header then "Click ‘Reset Table’ under the menu icon to refresh the table’s default values" message should be displayed.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By          | Category_Name__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC             | TestAutomationFlexTable4 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I see column name "Category Name" with "Descending" order
    And I click on column name "Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Category Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see the following message in the page details :
      | Table has been reset. |

    Examples:
      | User |
      | SPI3 |

  @312801
  Scenario Outline: LWC-E-grid-Child_UI Sort_SPI_To verify that when user changes sort direction on clicking column header then "Click ‘Reset Table’ under the menu icon to refresh the table’s default values" message should be displayed.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Order By          | Name          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC          | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see column name "Eligibility Question Name" with "Descending" order
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    Then I see column name "Eligibility Question Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #312801
    Then I see the following message in the page details :
      | Table has been reset. |

    Examples:
      | User |
      | SPI3 |

  @312899
  Scenario Outline: LWC-E-grid-Parent_UI Sort_SPI_To verify that when user changes sort direction for 'Date' datatypes field to ascending then dates should be sorted in ascending order.
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
      | Flex Table:General    | Sort Direction      | DESC           | TestAutomationFlexTable4 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I see column name "Test Date" with "Descending" order
    And I click on column name "Test Date" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Date" with "Ascending" order

    Examples:
      | User | newFieldsApi                               | defaultFieldsApi              |
      | SPI3 | {flexgrid:ParentFlexGrid1DFN},Test_Date__c | {flexgrid:ParentFlexGrid1DFN} |

  @312926
  Scenario Outline: LWC-E-grid-Child_UI Sort_SPI_To verify that when user changes sort direction for 'Date' datatypes field to ascending then dates should be sorted in ascending order.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue       | filterId         |
      | Flex Table            | Order By            | LastModifiedDate        | ApiGeneratedId:0 |
      | Flex Table            | Sort Direction      | ASC                     | ApiGeneratedId:1 |
      | Flex Grid:General     | Display Field Names | <defaultFieldsApiChild> | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Order By            | Test_Date_1__c      | TestAutomationFlexTable5 |                           |                            |
      | Flex Table:General    | Sort Direction      | DESC                | TestAutomationFlexTable5 |                           |                            |
      | Flex Grid:General     | Display Field Names | <newFieldsApiChild> | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see column name "Test Date 1" with "Descending" order
    And I click on column name "Test Date 1" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see column name "Test Date 1" with "Ascending" order

    Examples:
      | User | newFieldsApiChild                          | defaultFieldsApiChild       |
      | SPI3 | {flexgrid:ChildFlexGridDFN},Test_Date_1__c | {flexgrid:ChildFlexGridDFN} |

  @312949
  Scenario Outline: LWC-E-grid-Parent_UI Sort_SPI_To verify when user changes sort direction and clicks on clear session then sort direction should set back to default sort direction
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true             | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10               | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Order By          | Category_Name__c | TestAutomationFlexTable4 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC             | TestAutomationFlexTable4 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    And I see column name "Category Name" with "Descending" order
    And I click on column name "Category Name" for sorting of table "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    #312949
    Then I see column name "Category Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see the following message in the page details :
      | Table has been reset. |

    Examples:
      | User |
      | SPI3 |

  @312952
  Scenario Outline: LWC-E-grid-Child_UI Sort_SPI_To verify when user changes sort direction and clicks on clear session then sort direction should set back to default sort direction
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Flex Table            | Enable Page Size  | true              | ApiGeneratedId:0 |
      | Flex Table            | Enable Pagination | true              | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size | 10                | ApiGeneratedId:2 |
      | Flex Table            | Order By          | LastModifiedDate  | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction    | DESC              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Page Size  | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Enable Pagination | true          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Grid:General     | Default Page Size | 10            | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Order By          | Name          | TestAutomationFlexTable5 | Name                      |                            |
      | Flex Table:General    | Sort Direction    | DESC          | TestAutomationFlexTable5 | Name                      |                            |
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
    And I get the "EGMS ID"
    When I navigate to "History" sub tab
    When I perform quick search for "{flexgrid:ExpandParentRecord}" in "---flexgrid:-:TestAutomationFlexGrid2TableId---" panel
    And I expand nested table containing column value "{flexgrid:ExpandParentRecord}"
    And I see column name "Eligibility Question Name" with "Descending" order
    And I click on column name "Eligibility Question Name" for sorting of table "---flexgrid:-:TestChildTableId---"
    #312952
    Then I see column name "Eligibility Question Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid2TableId---"
    Then I see the following message in the page details :
      | Table has been reset. |

    Examples:
      | User |
      | SPI3 |