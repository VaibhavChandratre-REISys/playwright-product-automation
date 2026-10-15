@ComponentSanity @flexgrid @GridComponentSanity @ComponentSanity1

Feature: Component Sanity Testing 1. FlexGrid --Parent, Child , Grandchild Table 2. Flexi page
  In this feature file, we use the following tags for component-wise execution: @gridcomponent @FlexiPage

#########Test suite: Parent (Suite ID: 503265)#############
  @502819 @flexgridSubTotalOverallTotalAndFormula @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Information, SOQL config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:0 |
      | Flex Grid             | Required Fields     | StepNumber__c,Name,Weight__c                |                    | ApiGeneratedId:1 |
      | Flex Grid             | Default Page Size   | 5                                           |                    | ApiGeneratedId:2 |
      | Flex Table            | Order By            | StepNumber__c                               |                    | ApiGeneratedId:3 |
      | Flex Table            | Sort Direction      | ASC                                         |                    | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>        | ProgramReviewStepTemplates |                           |                            |
      | Flex Grid:General     | Required Fields     | StepNumber__c,Name,Weight__c | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Grid:General     | Default Page Size   | 5                            | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Order By            | StepNumber__c                | ProgramReviewStepTemplates |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                          | ProgramReviewStepTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description       | Step Name     | Step Weight (%) |
      | 4          | Automation Test 1 | Review Test 1 | 0               |
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description       | Step Name     | Step Weight (%) |
      | 5          | Automation Test 2 | Review Test 2 | 0               |
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description       | Step Name     | Step Weight (%) |
      | 6          | Automation Test 3 | Review Test 3 | 0               |
    Then I see table contains "Showing 1 to 5 of 6 records" inside table id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I see column "StepNumber__c" value is in "Ascending" order
    Examples:
      | Users | NewDisplayFieldName                         |
      | PM    | {SavedValue:ReviewStepsParentGridTable.dfn} |

  @502825 @flexgridSubTotalOverallTotalAndFormula @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- User Interface Behavior Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue                           | coreComponentField | filterId         |
      | Flex Table            | Display Field Names        | {SavedValue:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:0 |
      | Flex Table            | Enable Page Size           | true                                        |                    | ApiGeneratedId:1 |
      | Flex Table            | Enable Total Records Count | true                                        |                    | ApiGeneratedId:2 |
      | Flex Table            | Enable Filter              | true                                        |                    | ApiGeneratedId:3 |
      | Flex Table            | Enable Auto Index          | true                                        |                    | ApiGeneratedId:4 |
      | Flex Table            | Enable Pagination          | true                                        |                    | ApiGeneratedId:5 |
      | Flex Table            | Header Instruction         |                                             |                    | ApiGeneratedId:6 |
      | Flex Grid             | Default Page Size          | 5                                           |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue           | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names        | <NewDisplayFieldName>   | ProgramReviewStepTemplates |                           |                            |
      | Flex Table:General    | Enable Page Size           | true                    | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Enable Total Records Count | true                    | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Enable Filter              | true                    | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Enable Auto Index          | true                    | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Enable Pagination          | true                    | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Header Instruction         | Header Instruction Test | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Grid:General     | Default Page Size          | 5                       | ProgramReviewStepTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    Then I see "#" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I see "Header Instruction Test" shown as header instruction text
    Then I see Advance Filter box is displayed inside table id "---flexgrid:-:ProgramReviewStepParentTableId---" in flex table
    Then I see "Total Records:" page size inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description       | Step Name     | Step Weight (%) |
      | 4          | Automation Test 1 | Review Test 1 | 0               |
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description       | Step Name     | Step Weight (%) |
      | 5          | Automation Test 2 | Review Test 2 | 0               |
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description       | Step Name     | Step Weight (%) |
      | 6          | Automation Test 3 | Review Test 3 | 0               |
    Then I see table contains "Showing 1 to 5 of 6 records" inside table id "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on page navigation arrow "Next" for table id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I see table contains "Showing 6 to 6 of 6 records" inside table id "---flexgrid:-:ProgramReviewStepParentTableId---"

    Examples:
      | Users | NewDisplayFieldName                         |
      | PM    | {SavedValue:ReviewStepsParentGridTable.dfn} |

  @502828 @flexgridSubTotalOverallTotalAndFormula @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Export Setting, Record Selection
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue                           | coreComponentField | filterId         |
      | Flex Table            | Display Field Names       | {SavedValue:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:0 |
      | Flex Table            | Enable Record Selection   | false                                       |                    | ApiGeneratedId:1 |
      | Flex Table            | Enable Export (PDF)       | true                                        |                    | ApiGeneratedId:2 |
      | Flex Table            | Enable Export (XLS / CSV) | false                                       |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names       | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                            |
      | Flex Table:General    | Enable Record Selection   | true                  | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Enable Export (PDF)       | true                  | ProgramReviewStepTemplates | Name                      |                            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true                  | ProgramReviewStepTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    Then I see "allSelect" displayed inside table id "---flexgrid:-:ProgramReviewStepParentTableId---"
    When I click on parallel lines menu bar with data target value "Review Steps"
    Then I see "Download as PDF" button is displayed
    Then I see "Download as CSV" button is displayed
    Examples:
      | Users | NewDisplayFieldName                         |
      | PM    | {SavedValue:ReviewStepsParentGridTable.dfn} |

  @502865 @flexgridSubTotalOverallTotalAndFormula @flexgrid @316117 @316118 @gridcomponent
  Scenario Outline: LWC-E-grid-SubTotal_Admin_To verify that when user provided Subtotal label through config, then it get displayed as a Prefix to standard sub total label
  |LWC-E-grid-SubTotal_PM_To verify that when user provided Subtotal label through config, then it get displayed as a Prefix to standard sub total label|
  |3.0- FlexGrid Enhanced- PM- Numeric Data Type Fields- Flex Table Detail Config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.all}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.all}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.all} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Formula              |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Formula              |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Formula              |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Formula              |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:15 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:16 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:17 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:18 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:19 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block:Page Block Detail | Is Active            | true                                                          | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}  |
      | Flex Table:General           | Display Field Names  | {SavedValue:ParentFlexTable1.dfn},ParentNumberTest__c         | TestAutomationFlexTable1 |                           |                                      |
      | Flex Table:General           | Display Field Names  | {SavedValue:ChildFlexTable2.dfn},ChildNumberTest__c           | TestAutomationFlexTable2 |                           |                                      |
      | Flex Table:General           | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn},GrandChildNumberTest__c | TestAutomationFlexTable3 |                           |                                      |
      | Flex Table List              | Enable Row Grouping  | true                                                          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}     |
      | Flex Table List              | Enable Sub Total     | true                                                          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}     |
      | Flex Table List              | Enable Row Grouping  | true                                                          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}      |
      | Flex Table List              | Enable Sub Total     | true                                                          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}      |
      | Flex Table List              | Enable Row Grouping  | true                                                          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c} |
      | Flex Table List              | Enable Sub Total     | true                                                          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c} |
      | Flex Table List              | Formula              |                                                               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}           |
      | Flex Table List              | Formula              |                                                               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}      |
      | Flex Table List              | Formula              |                                                               | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c} |
      | Flex Table List              | Sub Total Label      | Lable Test                                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}     |
      | Flex Table List              | Sub Total Label      | Lable Test                                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}      |
      | Flex Table List              | Sub Total Label      | Lable Test                                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c} |
      | Flex Table List              | Hide Grouping Column | false                                                         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}     |
      | Flex Table List              | Hide Grouping Column | false                                                         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}      |
      | Flex Table List              | Hide Grouping Column | false                                                         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    #316117 #316118
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "Lable Test-ParentNumberTest : 232,323" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I expand nested table containing column value "Permanent Parent Record"
    #child
    Then I softly see "Lable Test-ChildNumberTest : 232,323" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
#grandChild
    Then I softly see "Lable Test-GrandChildNumberTest : 232,323" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users |
      | PM    |

  @502873 @flexgridSubTotalOverallTotalAndFormula @flexgrid @314495 @314496 @314498 @314499 @314501 @314502 @gridcomponent
  Scenario Outline:LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Lookup field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Lookup field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Picklist field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Picklist field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Checkbox field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Checkbox field, which have been provided in "Field Label Override" config|
  |3.0- FlexGrid Enhanced- PM- Lookup, Picklist Data Type Fields- Flex Table Detail Config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO ParentLookup                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Field Label Override | FLO ParentPicklist              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Field Label Override | FLO ParentCheckbox              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}      |
      | Flex Table List              | Field Label Override | FLO ChildLookup                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Field Label Override | FLO GrandChildLookup            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I softly see "FLO ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "FLO ChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly see "FLO GrandChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                   | NewDisplayFieldNameChild                        | NewDisplayFieldNameGrandChild                             |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentLookup__c,ParentPicklist__c,ParentCheckbox__c | {SavedValue:ChildFlexTable2.dfn},ChildLookup__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildLookup__c |

  @502884 @flexgridSubTotalOverallTotalAndFormula @flexgrid @314521 @314522 @314524 @314525 @314527 @314528 @314530 @314531 @314533 @314534 @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Checkbox, Email, URL Data Type Fields- Flex Table Detail Config
  LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Standard field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Standard field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Multi-select Picklist field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Multi-select Picklist field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Email field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Email field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Phone field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Phone field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a URL field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a URL field, which have been provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:15 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:16 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:17 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:18 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO Eligibility Category Name   | TestAutomationFlexTable1 | Name                      | {SavedValue:Name}                   |
      | Flex Table List              | Field Label Override | FLO Test_Multi_Picklist         | TestAutomationFlexTable1 | Name                      | {SavedValue:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override | FLO ParentEmail                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Field Label Override | FLO ParentPhone                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Field Label Override | FLO ParentUrl                   | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Field Label Override | FLO ParentCheckbox              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}      |
      | Flex Table List              | Field Label Override | FLO ParentEmail                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Field Label Override | FLO ParentCheckbox              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}      |
      | Flex Table List              | Field Label Override | FLO ChildCheckbox               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCheckbox__c}       |
      | Flex Table List              | Field Label Override | FLO ChildEmail                  | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Field Label Override | FLO ChildUrl                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Field Label Override | FLO GrandChildCheckbox          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCheckbox__c}  |
      | Flex Table List              | Field Label Override | FLO GrandChildEmail             | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Field Label Override | FLO GrandChildUrl               | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "FLO Eligibility Category Name" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO Test_Multi_Picklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentUrl" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "FLO ChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly see "FLO GrandChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                        | NewDisplayFieldNameChild                                                    | NewDisplayFieldNameGrandChild                                                                   |
      | PM    | {SavedValue:ParentFlexTable1.dfn},Name,Test_Multi_Picklist__c,ParentEmail__c,ParentPhone__c,ParentUrl__c,ParentCheckbox__c | {SavedValue:ChildFlexTable2.dfn},ChildCheckbox__c,ChildEmail__c,ChildUrl__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildCheckbox__c,GrandChildEmail__c,GrandChildUrl__c |

  @503224 @gridcomponent
  Scenario Outline: 3.0- FlexGrid  Enhanced- PM-  Quick Search Scenarios- Numeric Data Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #Parent grid table
    And I perform quick search for "232,323" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "232,323" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "232" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "232,323" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "232,323.00" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "232,323.00" for title "ParentNumberTest1" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "   dummy" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    And I perform quick search for "232,323" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "232,323" for title "ChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "232" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "232,323" for title "ChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "232,323.00" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "232,323.00" for title "ChildNumberTest1" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "     $^yt6 dummy" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    And I perform quick search for "232,323" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "232,323" for title "GrandChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "232" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "232,323" for title "GrandChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "232,323.00" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "232,323.00" for title "GrandChildNumberTest1" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "  $^yt6 dummy" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                        | NewDisplayFieldNameChild                                                | NewDisplayFieldNameGrandChild                                                          |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentNumberTest__c,ParentNumberTest1__c | {SavedValue:ChildFlexTable2.dfn},ChildNumberTest__c,ChildNumberTest1__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildNumberTest__c,GrandChildNumberTest1__c |

  @503230 @gridcomponent
  Scenario Outline: 3.0- FlexGrid  Enhanced- PM-  Quick Search Scenarios- Picklist, Lookup field Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.all}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.all}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.all} |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #Parent grid table
    And I perform quick search for "ParentPL10" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentPL10" for title "ParentPicklist" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Cat-0054" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "Cat-0054" for title "ParentLookup" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Cat-0054" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "Cat-0054" for title "ParentLookup" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentPL10test" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Cat-000Test" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    And I perform quick search for "ChildPicklist10" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildPicklist10" for title "ChildPicklist" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Cat-0010" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "Cat-0010" for title "ChildLookup" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "34$#ParentPL10" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Cat-000test" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    And I perform quick search for "GrandChildPL1" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildPL1" for title "GrandChildPicklist" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "$^yt6  GrandChildPL1HelloTest" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "$^yt6  dummy" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                 | NewDisplayFieldNameChild                                         | NewDisplayFieldNameGrandChild                                                   |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentPicklist__c,ParentLookup__c | {SavedValue:ChildFlexTable2.dfn},ChildPicklist__c,ChildLookup__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildPicklist__c,GrandChildLookup__c |

  @503233 @gridcomponent
  Scenario Outline: 3.0- FlexGrid  Enhanced- PM-  Quick Search Scenarios- Checkbox, Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #Parent grid table
    And I perform quick search for "true" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "true" for title "ParentCheckbox" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "parentemail@yopmail.com" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "www.google.com" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "www.google.com" for title "ParentUrl" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "346parentemail@yopmail.comTest" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Cat-www.google.com000Test" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "trueTest" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    And I perform quick search for "true" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "true" for title "ChildCheckbox" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "www.google.com" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "www.google.com" for title "ChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "childemail@yopmail.com" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "childemail@yopmail.com" for title "ChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Childtrue" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Test@#$childemail@yopmail.com" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly do not see value "childemail@yopmail.com" for title "ChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    And I perform quick search for "true" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "true" for title "GrandChildCheckbox" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "www.google.com" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "www.google.com" for title "GrandChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "grandchildemail@yopmail.com" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "grandchildemail@yopmail.com" for title "GrandChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "Test@#$$23true" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "TEST@#$$%234www.google.com" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "Fake@#$%234grandchildemail@yopmail.com" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                             | NewDisplayFieldNameChild                                                    | NewDisplayFieldNameGrandChild                                                                   |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentCheckbox__c,ParentEmail__c,ParentUrl__c | {SavedValue:ChildFlexTable2.dfn},ChildCheckbox__c,ChildUrl__c,ChildEmail__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildCheckbox__c,GrandChildUrl__c,GrandChildEmail__c |

  @503240 @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM-  Quick Search Scenarios- Standard and Text data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I perform quick search for "ParentTextCategoryDescriptionTest" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentTextCategoryDescriptionTest" for title "Category Description" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Automation ADMIN" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "Automation PM" for title "Created By ID" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "dummyParent#$^TextCTest" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "zzzzzz&*" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Automation PM KK" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Autom@#$^" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #GrandChild grid table
    And I perform quick search for "Automation ADMIN" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "Automation PM" for title "Created By ID" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildTextColumnValue" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildTextColumnValue" for title "ChildText" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Automation PM Test" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "dummyChildTextAbc123Testing" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Automation @#$^ 4332 Test" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "dummyChildTe@#$^1234xtAbc123Testing" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    And I perform quick search for "Automation ADMIN" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "Automation PM" for title "Created By ID" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "ChildTextColumnValue" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildTextColumnValue" for title "ChildText" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "Automation" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "Automation PM" for title "Created By ID" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildText" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildTextColumnValue" for title "GrandChildText" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "Test@#GrandChildText" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "TESTAutomation" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "Fake231432test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                       | NewDisplayFieldNameChild                                | NewDisplayFieldNameGrandChild                                     |
      | PM    | {SavedValue:ParentFlexTable1.dfn},CreatedBy,ParentText__c | {SavedValue:ChildFlexTable2.dfn},CreatedBy,ChildText__c | {SavedValue:GrandChildFlexTable3.dfn},CreatedBy,GrandChildText__c |

  @503242 @flexgrid @gridcomponent
  Scenario Outline:3.0- FlexGrid Enhanced- PM-  Quick Search Scenarios-  Date and Date & Time data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #Parent grid
    And I perform quick search for "1/1/2025" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "1/1/2025" for title "ParentDate" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "1/1/2025, 09:30 AM" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "1/1/2025, 09:30 AM" for title "ParentDateTime" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "1/1/2025Test" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "1/1/2025, 09:30 AMTest" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "2025" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "1/1/2025" for title "ParentDate" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "1/1/2025, 09:30" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "1/1/2025, 09:30 AM" for title "ParentDateTime" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    And I perform quick search for "1/1/2026" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026" for title "ChildDate" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "1/1/2026, 09:30 AM" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026, 09:30 AM" for title "ChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "2026" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026" for title "ChildDate" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "1/1/2026, 09:30" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026, 09:30 AM" for title "ChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "1/1/2026Test" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "1/1/2026, 09:30 test  " in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "#$202#6%#" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    And I perform quick search for "1/1/2026" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026" for title "GrandChildDate" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026, 09:30 AM" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026, 09:30 AM" for title "GrandChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "2026" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026" for title "GrandChildDate" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026, 09:30" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026, 09:30 AM" for title "GrandChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026Test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026, 09:30 Test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "#$202#6%#" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                               | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                                 |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c | {SavedValue:ChildFlexTable2.dfn},ChildDate__c,ChildDateTime__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildDate__c,GrandChildDateTime__c |


    ##########Actions ##########
  @503617 @flexgrid @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- PM- Actions- Delete
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | filterId         |
      | Page Block            | Is Active           | true                                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | ApiGeneratedId:3 |
      | Flex Table Action     | Location            | Row                                   | ApiGeneratedId:4 |
      | Flex Table Action     | Refresh Behavior    | Refresh the entire page               | ApiGeneratedId:5 |
      | Flex Table Action     | Location            | Row                                   | ApiGeneratedId:6 |
      | Flex Table Action     | Refresh Behavior    | Refresh the entire page               | ApiGeneratedId:7 |
      | Flex Table Action     | Location            | Row                                   | ApiGeneratedId:8 |
      | Flex Table Action     | Refresh Behavior    | Refresh the entire page               | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable1 | Name                      | Delete                              |
      | Flex Table Action            | Refresh Behavior    | Refresh the entire page         | TestAutomationFlexTable1 | Name                      | Delete                              |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable2 | Name                      | Delete                              |
      | Flex Table Action            | Refresh Behavior    | Refresh the entire page         | TestAutomationFlexTable2 | Name                      | Delete                              |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable3 | Name                      | Delete                              |
      | Flex Table Action            | Refresh Behavior    | Refresh the entire page         | TestAutomationFlexTable3 | Name                      | Delete                              |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #Parent grid
    When I enter the following values into flex table with id "---flexgrid:-:TestAutomationFlexGrid1---" by clicking "New" :
      | Category Name        | Category Number | Category Description           |
      | delete parent record | 11              | delete Refresh the entire page |
    When I perform quick search for "delete parent record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "delete parent record"
    When I enter the following values into flex table with id "---flexgrid:-:TestAutomationFlexTable2---" by clicking "New" :
      | Eligibility Question Name | ChildCurrencyTest |
      | delete child record       | 33                |
    And I click on "Delete" icon for "delete child record" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---" without waiting for record
    Then I see entire page is refreshing
    When I perform quick search for "delete parent record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I click on "Delete" icon for "delete parent record" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---" without waiting for record
    Then I see entire page is refreshing

    Examples:
      | Users | NewDisplayFieldName               | NewDisplayFieldNameChild         | NewDisplayFieldNameGrandChild                           |
      | PM    | {SavedValue:ParentFlexTable1.dfn} | {SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503619 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Actions- Edit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | filterId         |
      | Page Block            | Is Active           | true                                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | ApiGeneratedId:3 |
      | Flex Table Action     | Location            | Row                                   | ApiGeneratedId:4 |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid                      | ApiGeneratedId:5 |
      | Flex Table Action     | Location            | Row                                   | ApiGeneratedId:6 |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid                      | ApiGeneratedId:7 |
      | Flex Table Action     | Location            | Row                                   | ApiGeneratedId:8 |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid                      | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable1 | Name                      | Edit                                |
      | Flex Table Action            | Refresh Behavior    | Refresh the grid                | TestAutomationFlexTable1 | Name                      | Edit                                |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable2 | Name                      | Edit                                |
      | Flex Table Action            | Refresh Behavior    | Refresh the grid                | TestAutomationFlexTable2 | Name                      | Edit                                |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable3 | Name                      | Edit                                |
      | Flex Table Action            | Refresh Behavior    | Refresh the grid                | TestAutomationFlexTable3 | Name                      | Edit                                |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #Parent grid
    When I enter the following values into flex table with id "---flexgrid:-:TestAutomationFlexGrid1---" by clicking "New" :
      | Category Name      | Category Number | Category Description           |
      | Edit parent record | 11              | delete Refresh the entire page |
    And I perform quick search for "Edit parent record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Edit parent record" inside table
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    When I perform quick search for "Edit parent record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Edit parent record"
    When I enter the following values into flex table with id "---flexgrid:-:TestAutomationFlexTable2---" by clicking "New" :
      | Eligibility Question Name | ChildCurrencyTest |
      | Edit child record         | 33                |
    When I click on "Edit" icon for "Edit child record" inside table
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Edit child record" for title "Eligibility Question Name" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see value "Edit parent record" for title "Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on "Delete" icon for "Edit child record" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---" without waiting for record
    And I click on "Delete" icon for "Edit parent record" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---" without waiting for record

    Examples:
      | Users | NewDisplayFieldName               | NewDisplayFieldNameChild         | NewDisplayFieldNameGrandChild                           |
      | PM    | {SavedValue:ParentFlexTable1.dfn} | {SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @503931 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- Standard and Text Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO Parent                      | TestAutomationFlexTable1 | Name                      | {SavedValue:Name}                   |
      | Flex Table List              | Field Label Override | FLO Child                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName}              |
      | Flex Table List              | Field Label Override | FLO Grand Child                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName}         |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable1 | Name                      | {SavedValue:Name}                   |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName}              |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName}         |
      | Flex Table List              | Field Label Override | FLO ParentText                  | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}          |
      | Flex Table List              | Field Label Override | FLO ChildText                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}           |
      | Flex Table List              | Field Label Override | FLO GrandChildText              | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}      |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}          |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}           |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}      |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "FLO Parent" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "Name" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentText__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO Child" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see Help icon i is displayed beside the "Name" column inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see Help icon i is displayed beside the "ChildText__c" column inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO Grand Child" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see Help icon i is displayed beside the "Name" column inside table id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see Help icon i is displayed beside the "GrandChildText__c" column inside table id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                  | NewDisplayFieldNameChild                           | NewDisplayFieldNameGrandChild                                |
      | PM    | {SavedValue:ParentFlexTable1.dfn},Name,ParentText__c | {SavedValue:ChildFlexTable2.dfn},Name,ChildText__c | {SavedValue:GrandChildFlexTable3.dfn},Name,GrandChildText__c |

  @503932 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM-  Date and Date & Time Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:15 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:16 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:17 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:18 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:19 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:20 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:21 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO ParentDate                  | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentDate__c}          |
      | Flex Table List              | Field Label Override | FLO ChildDate                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildDate__c}           |
      | Flex Table List              | Field Label Override | FLO Grand GrandChildDate        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildDate__c}      |
      | Flex Table List              | Field Label Override | FLO ParentDateTime              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentDateTime__c}      |
      | Flex Table List              | Field Label Override | FLO ChildDateTime               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildDateTime__c}       |
      | Flex Table List              | Field Label Override | FLO GrandChildDateTime          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildDateTime__c}  |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentDate__c}          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildDate__c}           |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildDate__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentDateTime__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildDateTime__c}       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildDateTime__c}  |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentDate__c}          |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildDate__c}           |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildDate__c}      |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentDateTime__c}      |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildDateTime__c}       |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildDateTime__c}  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly do not see "FLO ParentDate" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentDate :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "FLO ParentDateTime" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentDateTime : " inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly do not see "FLO ChildDate" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildDate :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "FLO ChildDateTime" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildDateTime :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly do not see "FLO Grand GrandChildDate" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO Grand GrandChildDate :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "FLO GrandChildDateTime" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildDateTime :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                               | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                                 |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c | {SavedValue:ChildFlexTable2.dfn},ChildDate__c,ChildDateTime__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildDate__c,GrandChildDateTime__c |

  @503934 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM-  Phone and Email Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:15 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:16 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:17 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:18 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:19 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:20 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:21 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO ParentEmail                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Field Label Override | FLO ChildEmail                  | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Field Label Override | FLO Grand GrandChildEmail       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Field Label Override | FLO ParentPhone                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Field Label Override | FLO ChildPhone                  | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}          |
      | Flex Table List              | Field Label Override | FLO GrandChildPhone             | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}          |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}     |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly do not see "FLO ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "FLO ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPhone : " inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly do not see "FLO ChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "FLO ChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildPhone :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly do not see "FLO Grand GrandChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO Grand GrandChildEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "FLO GrandChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildPhone :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                             | NewDisplayFieldNameChild                                     | NewDisplayFieldNameGrandChild                                               |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentEmail__c,ParentPhone__c | {SavedValue:ChildFlexTable2.dfn},ChildEmail__c,ChildPhone__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildEmail__c,GrandChildPhone__c |

  @503937 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Formula and Multi-Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}        |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                            |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                            |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                            |
      | Flex Table List              | Field Label Override | FLO Parent                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}          |
      | Flex Table List              | Field Label Override | FLO Child                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}           |
      | Flex Table List              | Field Label Override | FLO Grand Child                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c}      |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}          |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}           |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c}      |
      | Flex Table List              | Field Label Override | FLO ParentText                  | TestAutomationFlexTable1 | Name                      | {SavedValue:Test_Multi_Picklist__c}        |
      | Flex Table List              | Field Label Override | FLO ChildText                   | TestAutomationFlexTable2 | Name                      | {SavedValue:Test_Multi_select_Picklist__c} |
      | Flex Table List              | Field Label Override | FLO GrandChildText              | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}         |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable1 | Name                      | {SavedValue:Test_Multi_Picklist__c}        |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable2 | Name                      | {SavedValue:Test_Multi_select_Picklist__c} |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}         |

    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "FLO Parent" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "Test_Multi_Picklist__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO Child" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see Help icon i is displayed beside the "ChildFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see Help icon i is displayed beside the "Test_Multi_select_Picklist__c" column inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO Grand Child" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see Help icon i is displayed beside the "GrandChildFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see Help icon i is displayed beside the "GrandChildPicklist__c" column inside table id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                           | NewDisplayFieldNameChild                                                           | NewDisplayFieldNameGrandChild                                                        |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentFormulaTest__c,Test_Multi_Picklist__c | {SavedValue:ChildFlexTable2.dfn},ChildFormulaTest__c,Test_Multi_select_Picklist__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildFormulaTest__c,GrandChildPicklist__c |

  @503621 @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Actions- New
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue            | filterId         |
      | Flex Table Action     | Location                   | Top                          | ApiGeneratedId:1 |
      | Flex Table Action     | Refresh Behavior           | Close modal and refresh grid | ApiGeneratedId:2 |
      | Flex Table Action     | Header Action Display Type | Button                       | ApiGeneratedId:3 |
      | Flex Table Action     | Location                   | Top                          | ApiGeneratedId:4 |
      | Flex Table Action     | Refresh Behavior           | Close modal and refresh grid | ApiGeneratedId:5 |
      | Flex Table Action     | Header Action Display Type | Button                       | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Location                   | Top                          | ProgramReviewStepTemplates      | Name                      | New                        |
      | Flex Table Action     | Refresh Behavior           | Close modal and refresh grid | ProgramReviewStepTemplates      | Name                      | New                        |
      | Flex Table Action     | Header Action Display Type | Button                       | ProgramReviewStepTemplates      | Name                      | New                        |
      | Flex Table Action     | Location                   | Top                          | ProgramReviewStepPanelTemplates | Name                      | New                        |
      | Flex Table Action     | Refresh Behavior           | Close modal and refresh grid | ProgramReviewStepPanelTemplates | Name                      | New                        |
      | Flex Table Action     | Header Action Display Type | Button                       | ProgramReviewStepPanelTemplates | Name                      | New                        |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | Step Order | Description       | Step Name     | Step Weight (%) |
      | 4          | Automation Test 1 | Review Test 1 | 0               |
    Then I see table contains "Showing 1 to 4 of 4 records" inside table id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Automation Test 1" for title "Description" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I expand nested table containing column value "Automation Test 1"
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---"
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Form Test | 50              | 1                                         | Checked   | No                     |
    And I wait for "5" seconds
    Then I see table contains "Showing 1 to 1 of 1 records" inside table id "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Form Test" for title "Form Name" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Examples:
      | Users |
      | PM    |

  @503246 @503246_1 @gridequalsto @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- PM- Advance Filter- Numeric Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:5  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:10 |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentNumberTest | equals to | 232323 |
    Then I softly see value "232,323" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentCurrencyTest | equals to | 232323 |
    Then I softly see value "$232,323" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | Parent Percentage Test | equals to | 232323 |
    Then I softly see value "232,323%" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildNumberTest | equals to | 232323 |
    Then I softly see value "232,323" for title "ChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildCurrencyTest | equals to | 232323 |
    Then I softly see value "$232,323" for title "ChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | Child Percentage Test | equals to | 232323 |
    Then I softly see value "232,323%" for title "Child Percentage Test" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildNumberTest | equals to | 232323 |
    Then I softly see value "232,323" for title "GrandChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildCurrencyTest | equals to | 232323 |
    Then I softly see value "$232,323" for title "GrandChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildPercentageTest | equals to | 232323 |
    Then I softly see value "232,323%" for title "GrandChildPercentageTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | PM    | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503246 @503246_2 @gridlessthan @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- PM- Advance Filter- Numeric Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:5  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:10 |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentNumberTest | less than | 7777777 |
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    Then I softly see value "232,323" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentCurrencyTest | less than | 7777777 |
    And I select value inside table "---flexgrid:-:TestAutomationFlexGrid1---" is "All"
    Then I softly see value "$232,323" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | Parent Percentage Test | less than | 7777777 |
    Then I softly see value "232,323%" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildNumberTest | less than | 7777777 |
    Then I softly see value "232,323" for title "ChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildCurrencyTest | less than | 7777777 |
    Then I softly see value "$232,323" for title "ChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | Child Percentage Test | less than | 7777777 |
    Then I softly see value "232,323%" for title "Child Percentage Test" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildNumberTest | less than | 7777777 |
    Then I softly see value "232,323" for title "GrandChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildCurrencyTest | less than | 7777777 |
    Then I softly see value "$232,323" for title "GrandChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildPercentageTest | less than | 7777777 |
    Then I softly see value "232,323%" for title "GrandChildPercentageTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | PM    | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503246 @503246_3 @gridgreaterthan @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- PM- Advance Filter- Numeric Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:5  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:10 |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentNumberTest | greater than | 232322 |
    Then I softly see value "232,323" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentCurrencyTest | greater than | 232322 |
    Then I softly see value "$232,323" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | Parent Percentage Test | greater than | 232322 |
    Then I softly see value "232,323%" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildNumberTest | greater than | 232322 |
    Then I softly see value "232,323" for title "ChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildCurrencyTest | greater than | 232322 |
    Then I softly see value "$232,323" for title "ChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | Child Percentage Test | greater than | 232322 |
    Then I softly see value "232,323%" for title "Child Percentage Test" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildNumberTest | greater than | 232322 |
    Then I softly see value "232,323" for title "GrandChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildCurrencyTest | greater than | 232322 |
    Then I softly see value "$232,323" for title "GrandChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildPercentageTest | greater than | 232322 |
    Then I softly see value "232,323%" for title "GrandChildPercentageTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | PM    | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503246 @503246_4 @gridgreaterthanorequalto @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- PM- Advance Filter- Numeric Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:5  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:10 |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentNumberTest | greater than or equal to | 232322 |
    Then I softly see value "232,323" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentCurrencyTest | greater than or equal to | 232322 |
    Then I softly see value "$232,323" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | Parent Percentage Test | greater than or equal to | 232322 |
    Then I softly see value "232,323%" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildNumberTest | greater than or equal to | 232322 |
    Then I softly see value "232,323" for title "ChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildCurrencyTest | greater than or equal to | 232322 |
    Then I softly see value "$232,323" for title "ChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | Child Percentage Test | greater than or equal to | 232322 |
    Then I softly see value "232,323%" for title "Child Percentage Test" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildNumberTest | greater than or equal to | 232322 |
    Then I softly see value "232,323" for title "GrandChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildCurrencyTest | greater than or equal to | 232322 |
    Then I softly see value "$232,323" for title "GrandChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildPercentageTest | greater than or equal to | 232322 |
    Then I softly see value "232,323%" for title "GrandChildPercentageTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | PM    | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503246 @503246_5 @gridlessthanorequalto @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- PM- Advance Filter- Numeric Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:5  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:10 |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentNumberTest | less than or equal to | 232322 |
    Then I softly see value "232,323" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentCurrencyTest | less than or equal to | 232322 |
    Then I softly see value "$232,323" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | Parent Percentage Test | less than or equal to | 232322 |
    Then I softly see value "232,323%" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildNumberTest | less than or equal to | 232323 |
    Then I softly see value "232,323" for title "ChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildCurrencyTest | less than or equal to | 232323 |
    Then I softly see value "$232,323" for title "ChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | Child Percentage Test | less than or equal to | 232323 |
    Then I softly see value "232,323%" for title "Child Percentage Test" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildNumberTest | less than or equal to | 232323 |
    Then I softly see value "232,323" for title "GrandChildNumberTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildCurrencyTest | less than or equal to | 232323 |
    Then I softly see value "$232,323" for title "GrandChildCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildPercentageTest | less than or equal to | 232323 |
    Then I softly see value "232,323%" for title "GrandChildPercentageTest" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | PM    | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503259 @503259_1 @gridcontains @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Advance Filter- Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:4  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:8  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}       |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}      |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}        |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c} |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentEmail | contains | parentemail |
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentUrl | contains | google |
    Then I softly see value "www.google.com" for title "ParentUrl" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildEmail | contains | childemail |
    Then I softly see value "childemail@yopmail.com" for title "ChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildUrl | contains | www.google.com |
    Then I softly see value "www.google.com" for title "ChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildEmail | contains | grandchildemail |
    Then I softly see value "grandchildemail@yopmail.com" for title "GrandChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildUrl | contains | google |
    Then I softly see value "www.google.com" for title "GrandChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | PM    | ParentEmail__c,ParentUrl__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503259 @503259_2 @gridcontains @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Advance Filter- Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:4  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:8  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}       |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}      |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}        |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c} |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentEmail | does not contains | DoesNotContentTest |
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentUrl | does not contains | DoesNotContentTest |
    Then I softly see value "www.google.com" for title "ParentUrl" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildEmail | does not contains | DoesNotContentTest |
    Then I softly see value "childemail@yopmail.com" for title "ChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildUrl | does not contains | www.DoesNotContentTest |
    Then I softly see value "www.google.com" for title "ChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildEmail | does not contains | DoesNotContentTest |
    Then I softly see value "grandchildemail@yopmail.com" for title "GrandChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildUrl | does not contains | DoesNotContentTest |
    Then I softly see value "www.google.com" for title "GrandChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | PM    | ParentEmail__c,ParentUrl__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503259 @503259_3 @gridstartswith @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Advance Filter- Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:4  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:8  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}       |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}      |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}        |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c} |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentEmail | starts with | parentemail |
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentUrl | starts with | www.goo |
    Then I softly see value "www.google.com" for title "ParentUrl" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildEmail | starts with | childemail |
    Then I softly see value "childemail@yopmail.com" for title "ChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildUrl | starts with | www.face |
    Then I softly see value "www.facebook.com" for title "ChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildEmail | starts with | grandchildemail |
    Then I softly see value "grandchildemail@yopmail.com" for title "GrandChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildUrl | starts with | www.g |
    Then I softly see value "www.google.com" for title "GrandChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | PM    | ParentEmail__c,ParentUrl__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503259 @503259_4 @gridendswith @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Advance Filter- Email, URL data type fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:4  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:8  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}       |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}      |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}        |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c} |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}   |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentEmail | ends with | l@yopmail.com |
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentUrl | ends with | e.com |
    Then I softly see value "www.google.com" for title "ParentUrl" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildEmail | ends with | l@yopmail.com |
    Then I softly see value "childemail@yopmail.com" for title "ChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildUrl | ends with | ok.com |
    Then I softly see value "www.facebook.com" for title "ChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildEmail | ends with | ail@yopmail.com |
    Then I softly see value "grandchildemail@yopmail.com" for title "GrandChildEmail" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildUrl | ends with | le.com |
    Then I softly see value "www.google.com" for title "GrandChildUrl" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | PM    | ParentEmail__c,ParentUrl__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @503261 @503261_1 @gridcontains
  Scenario Outline:  3.0- FlexGrid Enhanced- PM- Advance Filter- Numeric Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:6  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:12 |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:15 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:16 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:17 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                        |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}             |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentTextArea__c}         |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLongTextArea__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentRichTextArea__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                        |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}              |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildTextArea__c}          |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLongTextArea__c}      |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildRichTextArea__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                        |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                        |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}         |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildTextArea__c}     |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLongTextArea__c} |
      | Flex Table List       | Field Label Override |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildRichTextArea__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentText | contains | TextTestColumnValue |
    Then I softly see value "ParentTextTestColumnValue" for title "ParentText" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentTextArea | contains | ParentTextArea |
    Then I softly see value "ParentTextAreaColumnValue" for title "ParentTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentLongTextArea | contains | LongTextAreaColumnValue |
    Then I softly see value "ParentLongTextAreaColumnValue" for title "ParentLongTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"

    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"

    And I refresh the page
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildText | contains | ChildText1ColumnValue |
    Then I softly see value "ChildText1ColumnValue" for title "ChildText" inside table "---flexgrid:-:TestAutomationFlexTable2---"

    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildTextArea | contains | TextAreaColumnValue |
    Then I softly see value "ChildTextAreaColumnValue" for title "ChildTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"

    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable2---" for LWC
      | ChildLongTextArea | contains | LongTextAreaColumn |
    Then I softly see value "ChildLongTextAreaColumnValue" for title "ChildLongTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"

    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildText | contains | GrandChildText |
    Then I softly see value "GrandChildTextColumnValue" for title "GrandChildText" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildTextArea | contains | GrandChildTextAreaColumnValue |
    Then I softly see value "GrandChildTextAreaColumnValue" for title "GrandChildTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"

    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexTable3---" for LWC
      | GrandChildLongTextArea | contains | GrandChildLongTextAreaColumn |
    Then I softly see value "GrandChildLongTextAreaColumnValue" for title "GrandChildLongTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                           | NewDisplayFieldNameChild                                                                                 | NewDisplayFieldNameGrandChild                                                                                                     |
      | PM    | ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,{SavedValue:ParentFlexTable1.dfn} | ChildText__c,ChildTextArea__c,ChildLongTextArea__c,ChildRichTextArea__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,GrandChildTextArea__c,GrandChildLongTextArea__c,GrandChildRichTextArea__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511155 @511184 @511204 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Cell Json- Field
  |3.0- Data Table Enhanced- PM- Read Only Cell Json- Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                     | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                    | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                               | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                          | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTestFieldEqualsFreetext                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest1FieldNotEqualsFreetext             | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest2FieldLessThanEqualsFreetext        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest3FieldGreaterThanEqualsFreetext     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTestFieldEqualsFreetext                  | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest1FieldNotEqualsFreetext              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest2FieldLessThanEqualsFreetext         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest3FieldGreaterThanEqualsFreetext      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTestFieldEqualsFreetext             | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest1FieldNotEqualsFreetext         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest2FieldLessThanEqualsFreetext    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest3FieldGreaterThanEqualsFreetext | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    Then I softly do not see field "ParentNumberTest2__c" on table is input field
    Then I softly do not see field "ParentNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    Then I softly do not see field "ChildNumberTest2__c" on table is input field
    Then I softly do not see field "ChildNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest2__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest3__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511155_1 @511184_1 @511204_1 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Cell Json- Field
  |3.0- Data Table Enhanced- PM- Read Only Cell Json- Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                     | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                    | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                               | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                          | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTestFieldLessThanFreetext               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest1FieldGreaterThanFreetext           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest2FieldContains                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest3FieldGreaterThanEqualsFreetext     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTestFieldLessThanFreetext                | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest1FieldGreaterThanFreetext            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest2FieldContains                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest3FieldGreaterThanEqualsFreetext      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTestFieldLessThanFreetext           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTestFieldGreaterThanFreetext        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest2FieldContains                  | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest3FieldGreaterThanEqualsFreetext | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    Then I softly do not see field "ParentNumberTest2__c" on table is input field
    Then I softly do not see field "ParentNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    Then I softly do not see field "ChildNumberTest2__c" on table is input field
    Then I softly do not see field "ChildNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest2__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest3__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511157 @511205 @511187 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- $User
  |3.0- Data Table Enhanced- PM- Read Only Column Json- $User|
  |3.0- Data Table Enhanced- PM- Read Only Column Json- $User|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                  | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                 | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                            | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                       | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithEqualToAgencyID    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithNotEqualToAgencyID | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithEqualToAgencyID    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithNotEqualToAgencyID | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithEqualToAgencyID    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithNotEqualToAgencyID | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511190 @511206 @511158 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- User Type
  |3.0- Data Table Enhanced- PM- Read Only Column Json- User Type|
  |3.0- Data Table Enhanced- PM- Read Only Column Json- User Type|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                  | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                 | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                            | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                       | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                             | NewDisplayFieldNameChild                                                                    | NewDisplayFieldNameGrandChild                                                                                   |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511177 @511207 @511192 @511177_1 @511207_1 @511192_1 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                     | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                    | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                               | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                          | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInPMForParent                                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInFOForParent                                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInEXEForParent                               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest3FieldGreaterThanEqualsFreetext     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInPMForChild                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInFOForChild                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInEXEForChild                                | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest3FieldGreaterThanEqualsFreetext      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInPMForGrandChild                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInFOForGrandChild                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInEXEForGrandChild                           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest3FieldGreaterThanEqualsFreetext | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on "View" action for first record of table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on "View" action for first record of table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest2__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest2__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest2__c" on table is input field
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511177 @511207 @511192 @511177_2 @511207_2 @511192_2 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                     | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                    | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                               | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                          | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInPMForParent                             | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInFOForParent                             | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInEXEForParent                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest3FieldGreaterThanEqualsFreetext     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInPMForChild                              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInFOForChild                              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInEXEForChild                             | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest3FieldGreaterThanEqualsFreetext      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInPMForGrandChild                         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInFOForGrandChild                         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInEXEForGrandChild                        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest3FieldGreaterThanEqualsFreetext | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly see field "ParentNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly see field "ChildNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly see field "GrandChildNumberTest__c" on table is input field
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on "View" action for first record of table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly see field "GrandChildNumberTest1__c" on table is input field
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on "View" action for first record of table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly see field "ParentNumberTest2__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly see field "ChildNumberTest2__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly see field "GrandChildNumberTest2__c" on table is input field
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511193 @511178 @511208 @511193_1 @511178_1 @511208_1 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- Context
  |3.0- Data Table Enhanced- PM- Read Only Column Json- Context|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                          | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                         | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                    | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>               | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextEditforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextViewforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextEditforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextViewforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextEditforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextViewforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    And I click on "Edit" action for first record of table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on "View" action for first record of table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511193 @511178 @511208 @511193_2 @511178_2 @511208_2 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- Context
  |3.0- Data Table Enhanced- PM- Read Only Column Json- Context|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                               | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                              | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                         | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                    | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextNotInEditforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextNotInViewforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON |                                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON |                                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextNotInEditforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextNotInViewforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON |                                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON |                                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextNotInEditforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextNotInViewforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON |                                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON |                                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    And I click on "Edit" action for first record of table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly see field "ParentNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly see field "ChildNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly see field "GrandChildNumberTest__c" on table is input field
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on "View" action for first record of table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly see field "GrandChildNumberTest1__c" on table is input field
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511194 @511180 @511209 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- User App
  |3.0- Data Table Enhanced- PM- Read Only Column Json- User App|
  |3.0- Data Table Enhanced- PM- Read Only Column Json- User App|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                      | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                     | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                           | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGrantorParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGrantorParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGranteeParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGranteeParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGrantorChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGrantorChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGranteeChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGranteeChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGrantorGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGrantorGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGranteeGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGranteeGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field
    Then I softly do not see field "ParentNumberTest2__c" on table is input field
    Then I softly see field "ParentNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field
    Then I softly do not see field "ChildNumberTest2__c" on table is input field
    Then I softly see field "ChildNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest2__c" on table is input field
    Then I softly see field "GrandChildNumberTest3__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511210 @511181 @511210 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Column Json- Queue
  |3.0- Data Table Enhanced- PM- Read Only Column Json- Queue|
  |3.0- Data Table Enhanced- PM- Read Only Column Json- Queue|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active             | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names   | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names   | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names   | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName             | fieldNewValue                                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active             | true                                                       | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names   | <NewDisplayFieldName>                                      | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names   | <NewDisplayFieldNameChild>                                 | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names   | <NewDisplayFieldNameGrandChild>                            | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Column JSON | govgrants_config:ROCJQUEUEInGovGrantTestQueueParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Column JSON | govgrants_config:ROCJQUEUENotInGovGrantTestQueueParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Column JSON | govgrants_config:ROCJQUEUEInGovGrantTestQueueChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Column JSON | govgrants_config:ROCJQUEUENotInGovGrantTestQueueChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Column JSON | govgrants_config:ROCJQUEUEInGovGrantTestQueueGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Column JSON | govgrants_config:ROCJQUEUENotInGovGrantTestQueueGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field

    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field

    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511219 @511226 @511211 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Read Only Cell Json- Field
  |3.0- Data Table Enhanced- SPI- Read Only Cell Json- Field|
  |3.0- Data Table Enhanced- SPI- Read Only Cell Json- Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                     | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                    | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                               | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                          | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTestFieldEqualsFreetext                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest1FieldNotEqualsFreetext             | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest2FieldLessThanEqualsFreetext        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest3FieldGreaterThanEqualsFreetext     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTestFieldEqualsFreetext                  | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest1FieldNotEqualsFreetext              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest2FieldLessThanEqualsFreetext         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest3FieldGreaterThanEqualsFreetext      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTestFieldEqualsFreetext             | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest1FieldNotEqualsFreetext         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest2FieldLessThanEqualsFreetext    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest3FieldGreaterThanEqualsFreetext | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    Then I softly do not see field "ParentNumberTest2__c" on table is input field
    Then I softly do not see field "ParentNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    Then I softly do not see field "ChildNumberTest2__c" on table is input field
    Then I softly do not see field "ChildNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest2__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest3__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511219 @511226 @511211 @511219_1 @511226_1 @511211_1 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Read Only Cell Json- Field
  |3.0- Data Table Enhanced- PM- Read Only Cell Json- Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                     | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                    | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                               | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                          | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTestFieldLessThanFreetext               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest1FieldGreaterThanFreetext           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest2FieldContains                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJParentNumberTest3FieldGreaterThanEqualsFreetext     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTestFieldLessThanFreetext                | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest1FieldGreaterThanFreetext            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest2FieldContains                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJChildNumberTest3FieldGreaterThanEqualsFreetext      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTestFieldLessThanFreetext           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTestFieldGreaterThanFreetext        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest2FieldContains                  | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJGrandChildNumberTest3FieldGreaterThanEqualsFreetext | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    Then I softly do not see field "ParentNumberTest2__c" on table is input field
    Then I softly do not see field "ParentNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    Then I softly do not see field "ChildNumberTest2__c" on table is input field
    Then I softly do not see field "ChildNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest2__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest3__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511212 @511227 @511220 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Read Only Column Json- $User
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- $User|
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- $User|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                   | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                  | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                             | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                        | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithEqualToAgencyIDForSPI3Parent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithNotEqualToAgencyIDForSPI3Parent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithEqualToAgencyIDForSPI3Child         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithNotEqualToAgencyIDForSPI3Child      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithEqualToAgencyIDForSPI3GrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJDollarUserWithNotEqualToAgencyIDForSPI3GrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511221 @511228 @511213 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Read Only Column Json- User Type
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- User Type|
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- User Type|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                 | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForParentForSPI3        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeNotInApplicantForParentForSPI3     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForChildForSPI3         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeNotInApplicantForChildForSPI3      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeInApplicantForGrandChildForSPI3    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserTypeNotInApplicantForGrandChildForSPI3 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "6" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field
    Examples:
      | Users | NewDisplayFieldName                                                                             | NewDisplayFieldNameChild                                                                    | NewDisplayFieldNameGrandChild                                                                                   |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511214 @511229 @511222 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Read Only Column Json- Profile
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- Profile|
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- Profile|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                              | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                             | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                        | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                   | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInSPIForParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInSPIForParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON |                                                   | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON |                                                   | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInSPIForChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInSPIForChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON |                                                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON |                                                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileInSPIForGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJProfileNotInSPIForGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON |                                                   | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON |                                                   | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511223 @511230 @511216 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Read Only Column Json- Context
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- Context|
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- Context|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                          | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                         | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                    | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>               | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextEditforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextViewforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextEditforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextViewforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextEditforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJContextViewforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON |                                               | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on "View" action for first record of table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest1__c" on table is input field
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511217 @511231 @511224 @gridcomponent
  Scenario Outline:3.0- Data Table Enhanced- SPI- Read Only Column Json- User App
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- User App|
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- User App|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Cell JSON |                                       |                    | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                      | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                     | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                           | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGrantorParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGrantorParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGranteeParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGranteeParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGrantorChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGrantorChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGranteeChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGranteeChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGrantorGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGrantorGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppNotInStateAsGranteeGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Read Only Cell JSON | govgrants_config:ROCJUserAppInStateAsGranteeGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly do not see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field
    Then I softly do not see field "ParentNumberTest2__c" on table is input field
    Then I softly see field "ParentNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly do not see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field
    Then I softly do not see field "ChildNumberTest2__c" on table is input field
    Then I softly see field "ChildNumberTest3__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly do not see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field
    Then I softly do not see field "GrandChildNumberTest2__c" on table is input field
    Then I softly see field "GrandChildNumberTest3__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511225 @511232 @511218 @needtocheck @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Read Only Column Json- Queue
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- Queue|
  |3.0- Data Table Enhanced- SPI- Read Only Column Json- Queue|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active             | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names   | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names   | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names   | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Read Only Column JSON |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName             | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active             | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names   | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names   | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names   | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Read Only Column JSON |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Read Only Column JSON |                                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Read Only Column JSON |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Read Only Column JSON |                                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Read Only Column JSON |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Read Only Column JSON |                                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "6" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on "Edit" icon for "Permanent Parent Record" inside table
    Then I softly see field "ParentNumberTest__c" on table is input field
    Then I softly see field "ParentNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I click on "Edit" icon for "Permanent Child Record" inside table
    Then I softly see field "ChildNumberTest__c" on table is input field
    Then I softly see field "ChildNumberTest1__c" on table is input field
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I click on "Edit" icon for "Permanent Grand Child Record" inside table
    Then I softly see field "GrandChildNumberTest__c" on table is input field
    Then I softly see field "GrandChildNumberTest1__c" on table is input field

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | spi3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511233 @511245 @511259 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON- Field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}  |                    | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                             |                    | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                             |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                          | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                     | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJgridOnProgramFieldEqualsTo | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJgridOnProgramFieldEqualsTo | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                             | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                        | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJgridOnProgramFieldNotEqualsTo | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJgridOnProgramFieldNotEqualsTo | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                             | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                        | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJgridOnProgramFieldNotEqualsTo | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJgridOnProgramFieldNotEqualsTo | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                     | NewDisplayFieldNameChild                                      |
      | PM    | RSnumber__c,{SavedValue:ReviewStepsParentGridTable.dfn} | RFChildTextArea__c,{SavedValue:ReviewFormsChildGridTable.dfn} |

  @511235 @511246 @gridcomponent
  Scenario Outline:  3.0- Data Table Enhanced- PM- Hide Column JSON - $User
  | 3.0- Data Table Enhanced- PM- Hide Column JSON - $User|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}  |                    | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                             |                    | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                             |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                  | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>             | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:StepNumber__c}      |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserNotAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:StepNumber__c}      |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserNotAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                    | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>               | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserInAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:StepNumber__c}      |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserInAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                          | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                     | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserContainsAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserContainsAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"

    Examples:
      | Users | NewDisplayFieldName                                     | NewDisplayFieldNameChild                                      |
      | PM    | RSnumber__c,{SavedValue:ReviewStepsParentGridTable.dfn} | RFChildTextArea__c,{SavedValue:ReviewFormsChildGridTable.dfn} |

  @511236 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - User Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}  |                    | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                             |                    | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                                             |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                  | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>             | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserNotAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserNotAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                    | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>               | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserInAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserInAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                          | ProgramReviewStepTemplates      |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                     | ProgramReviewStepPanelTemplates |                           |                                 |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserContainsAgencyId | ProgramReviewStepTemplates      | Name                      | {SavedValue:RSnumber__c}        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJDollarUserContainsAgencyId | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c} |
    When I click on button "resetIcon" in flex table with id "---program:-:reviewStepTableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    Then I softly do not see "RSnumber" in flex table header "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"

    Examples:
      | Users | NewDisplayFieldName                                     | NewDisplayFieldNameChild                                      |
      | PM    | RSnumber__c,{SavedValue:ReviewStepsParentGridTable.dfn} | RFChildTextArea__c,{SavedValue:ReviewFormsChildGridTable.dfn} |

  @511237 @511250 @511265 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - Profile
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Profile|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Profile|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                              | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                       | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                      | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                 | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                            | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonParentTableProfileIn        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonParentTableProfileNotIn     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonChildTableProfileIn         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonChildTableProfileNotIn      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonGrandChildTableProfileIn    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonGrandChildTableProfileNotIn | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511279 @511291 @511306 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Hide Column JSON - Profile
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - Profile|
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - Profile|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                              | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                             | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                        | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                   | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonParentTableProfileInForSPI3        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonParentTableProfileNotInForSPI3     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                   | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                   | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonChildTableProfileInForSPI3         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonChildTableProfileNotInForSPI3      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonGrandChildTableProfileInForSPI3    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonGrandChildTableProfileNotInForSPI3 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                                   | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                                   | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511238 @511251 @511266 @511238_1 @511251_1 @511266_1 @gridcomponent
  Scenario Outline:3.0- Data Table Enhanced- PM- Hide Column JSON - Context
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Context|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Context|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                  | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                 | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                            | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                       | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HETActionLevelButtonForInContextEdit | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInEditforParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                       | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                       | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextEditforChild              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInEditforChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextEditforGrandChild         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInEditforGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511238 @511251 @511266 @511238_2 @511251_2 @511266_2 @gridcomponent
  Scenario Outline:3.0- Data Table Enhanced- PM- Hide Column JSON - Context
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Context|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Context|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                               | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                              | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                         | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                    | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextViewforParent          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInViewforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextViewforChild           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInViewforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextViewforGrandChild      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInViewforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511307 @511292 @511280 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Hide Column JSON - Context
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - Context|
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - Context|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                               | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                              | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                         | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                    | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextViewforParent          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInViewforParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextViewforChild           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInViewforChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextViewforGrandChild      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInViewforGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511262 @gridcomponent
  Scenario Outline:  3.0- Data Table Enhanced- PM- Hide Column JSON - $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                           | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                          | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                     | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextViewforParent      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJContextNotInViewforParent | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HCJDollarUserAgencyId         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HCJDollarUserNotAgencyId      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HCJDollarUserAgencyId         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HCJDollarUserNotAgencyId      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511264 @511236 @511247 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - User Type
  |3.0- Data Table Enhanced- PM- Hide Column JSON - User Type|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - User Type|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                 | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                           | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                      | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HETActionLevelButtonForInt                          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HETActionLevelButtonForIntNotIn                     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HETActionLevelViewForUserTypeInternalChild          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HETActionLevelViewForUserTypeInternalChildNotIn     | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonGrandChildTableUsertTyprInternal      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnJsonGrandChildTableUsertTyprInternalNotIn | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511267 @511252 @511239 @511267_1 @511252_1 @511239_1 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - User App
  |3.0- Data Table Enhanced- PM- Hide Column JSON - User App|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - User App|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                      | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                     | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                           | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppInStateAsGrantorParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppNotInStateAsGrantorParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppInStateAsGrantorChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppNotInStateAsGrantorChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppInStateAsGrantorGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppNotInStateAsGrantorGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511267 @511252 @511239 @511267_2 @511252_2 @511239_2 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - User App
  |3.0- Data Table Enhanced- PM- Hide Column JSON - User App|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - User App|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                      | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                     | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                           | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppNotInStateAsGranteeParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppInStateAsGranteeParent        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppNotInStateAsGranteeChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppInStateAsGranteeChild         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppNotInStateAsGranteeGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:ROCJUserAppInStateAsGranteeGrandChild    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                        | NewDisplayFieldNameChild                                                | NewDisplayFieldNameGrandChild                                                          |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511269 @511255 @511241 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - Combination
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Combination|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Combination|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                    | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                   | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                              | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                         | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationwithAndParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationwithAndParent     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationwithAndChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationwithAndChild      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationwithAndGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationwithAndGrandChild | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511272 @511258 @511244 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - 2Groups (Combination of 2 Scenarios)
  |3.0- Data Table Enhanced- PM- Hide Column JSON - 2Groups (Combination of 2 Scenarios)|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - 2Groups(Combination of 2 Scenarios)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                   | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                  | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                             | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                        | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor2GroupsAndParentForPM         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor2GroupsAndParentForPMEdit     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor2GroupsAndChildForPM          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor2GroupsAndChildForPMEdit      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor2GroupsAndGrandChildForPM     | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor2GroupsAndGrandChildForPMEdit | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511257 @511242 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - 3Groups (Combination of 3 Scenarios)
  |3.0- Data Table Enhanced- PM- Hide Column JSON - 3Groups(Combination of 3 Scenarios)|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - 3Groups(Combination of 3 Scenarios)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                   | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                  | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                             | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                        | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor3GroupsAndParentForPM         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor3GroupsAndParentForPMEdit     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor3GroupsAndChildForPM          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor3GroupsAndChildForPMEdit      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor3GroupsAndGrandChildForPM     | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombinationFor3GroupsAndGrandChildForPMEdit | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                                        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | PM    | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511303 @511288 @511277 @gridcomponent
  Scenario Outline:  3.0- Data Table Enhanced- SPI- Hide Column JSON - $User
  | 3.0- Data Table Enhanced- SPI- Hide Column JSON - $User|
  | 3.0- Data Table Enhanced- SPI- Hide Column JSON - $User|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                    | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                   | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                              | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                         | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserParentInDollar        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserParentNotInDollar     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserChildInDollar         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserChildNotInDollar      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserGrandChildInDollar    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserGrandChildNotInDollar | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "6" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511304 @511293 @511281 @511290 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Hide Column JSON - User Type
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - User App|
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - User App|
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - User Type|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                     | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                    | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                               | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                          | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserParentInUserApp        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserParentNotInUserApp     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserChildInUserApp         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserChildNotInUserApp      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserGrandChildInUserApp    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnSpiUserGrandChildNotInUserApp | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511296 @511241 @511311 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Hide Column JSON - Combination
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Combination|
  |3.0- Data Table Enhanced- PM- Hide Column JSON - Combination|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                 | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                           | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                      | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombination2ParentSPI     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombination2ChildSPI      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnCombination2GrandChildSPI | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511270 @511297 @511314 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- PM- Hide Column JSON - 3Groups (Combination of 3 Scenarios)
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - 3Groups(Combination of 3 Scenarios)|
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - 3Groups(Combination of 3 Scenarios)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                        | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                 | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                           | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                      | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserParentCombinationFor3Groups     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserChildCombinationFor3Groups      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserGrandChildCombinationFor3Groups | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511315 @511299 @511286 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Hide Column JSON - 2Groups(Combination of 2 Scenarios)
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - 2Groups(Combination of 2 Scenarios)|
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - 2Groups(Combination of 2 Scenarios)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                  | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                 | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                            | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                       | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserParentCombinationFor2Groups      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserParentCombinationFor2Groups2     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserChildCombinationFor2Groups       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserChildCombinationFor2Groups2      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserGrandChildCombinationFor2Groups  | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserGrandChildCombinationFor2Groups2 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @511287 @511301 @511276 @gridcomponent
  Scenario Outline: 3.0- Data Table Enhanced- SPI- Hide Column JSON - Field
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - Field|
  |3.0- Data Table Enhanced- SPI- Hide Column JSON - Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Column JSON    |                                       |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active           | true                                                                  | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                                                 | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>                                            | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild>                                       | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserParentCombinationFor2Groups      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserParentCombinationFor2Groups2     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest1__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest2__c}     |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest3__c}     |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserChildCombinationFor2Groups       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}       |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserChildCombinationFor2Groups2      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest1__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest2__c}      |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest3__c}      |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserGrandChildCombinationFor2Groups  | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}  |
      | Flex Table List              | Hide Column JSON    | govgrants_config:HideColumnForSPIUserGrandChildCombinationFor2Groups2 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest1__c} |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest2__c} |
      | Flex Table List              | Hide Column JSON    |                                                                       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest3__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I get current URL
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildNumberTest1" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                  | NewDisplayFieldNameChild                                                                                        | NewDisplayFieldNameGrandChild                                                                                                            |
      | SPI3  | ParentNumberTest__c,ParentNumberTest1__c,ParentNumberTest2__c,ParentNumberTest3__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildNumberTest1__c,ChildNumberTest2__c,ChildNumberTest3__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildNumberTest1__c,GrandChildNumberTest2__c,GrandChildNumberTest3__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @520663 @520665 @520669 @FlexiPage
  Scenario: 3.0- Flexi Page- Admin/PM- To Verify all Header Overview Fields Functioning correctly on Flexi Page
  |3.0- Flexi Page- Admin/PM- To Verify Step Progress Bar Functioning correctly on Flexi Page (Headeroverview, FlexLayout, TAB)|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    #520665 positive enable header instuction
    Then I softly see "The program construct of grants and awards that are managed throughout" shown as page instruction text
    Then I see Step Progress bar showing status
      | Created                |
      | Submitted for Approval |
      | Approved               |
    When I click on "Next Step" in step progress bar
    Then I see Step Progress bar showing status
      | Submitted for Approval |
      | Approved               |
      | Active                 |
    Then I see "Next Step" button on progress bar
    When I click on "Next Step" in step progress bar
    Then I see Step Progress bar showing status
      | Approved |
      | Active   |
      | Closed   |
    Then I see "Previous Step" button on progress bar
    When I click on "Previous Step" in step progress bar
    Then I see Step Progress bar showing status
      | Submitted for Approval |
      | Approved               |
      | Active                 |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit, Description is required in the Overview tab under the Description section. |
    Then I see error message displayed on the Header Overview along with a close action

  @520665 @520663 @FlexiPage
  Scenario: 3.0- Flexi Page- Admin/PM- To Verify all headerOverview Fields Functioning correctly on Flexi Page
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
       #520665 negative disable header instuction
    Then I softly do not see "Run the automation suite to execute all relevant test cases. Carefully review the results below to confirm system behavior matches the expected outcome." shown as page instruction text
    #520663 checked
    Then I see Step Progress bar showing status
      | Created |
      | Active  |
      | Closed  |

  @520919 @520922 @FlexiPage
  Scenario: 3.0- Flexi Page- SPI- To Verify all headerOverview Fields Functioning correctly on Flexi Page
  |3.0- Flexi Page- SPI- To Verify all headerOverview Fields Functioning correctly on Flexi Page|
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    When I click on "View" icon for "Submitted to Grantor" inside table
   #520919
    Then I see Step Progress bar showing status
      | Created   |
      | Submitted |
      | Accepted  |
    Then I see "Next Step" button on progress bar
    When I click on "Next Step" in step progress bar
    Then I see Step Progress bar showing status
      | Submitted                |
      | Accepted                 |
      | Converted to Application |
    Then I see "Previous Step" button on progress bar
    When I click on "Previous Step" in step progress bar
    Then I see Step Progress bar showing status
      | Created   |
      | Submitted |
      | Accepted  |
    #520922
    Then I softly do not see "Run the automation suite to execute all relevant test cases. Carefully review the results below to confirm system behavior matches the expected outcome." shown as page instruction text

  @520923 @FlexiPage
  Scenario:3.0- Flexi Page- SPI- To Verify Step Progress Bar Functioning correctly on Flexi Page (Headeroverview, FlexLayout, TAB)
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
    Then I softly do not see "Run the automation suite to execute all relevant test cases. Carefully review the results below to confirm system behavior matches the expected outcome." shown as page instruction text
    Then I do not see "Next Step" button on progress bar
    Then I do not see "Previous Step" button on progress bar
    Then I see Step Progress bar showing status
      | Created                  |
      | Accepted                 |
      | Converted to Application |

  @520924 @FlexiPage
  Scenario: 3.0- Flexi Page- SPI- To Verify Flex layout page messages Functioning correctly on Flexi Page ( FlexLayout, TAB )
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
    And I wait for "5" seconds
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Enter a Project Description.                                                                                                                         |
      | Overview Tab - Enter the Project Goals.                                                                                                                             |
      | Overview Tab - Enter a Project Beneficiary.                                                                                                                         |
      | Overview Tab - Associate at least one active key contact with the pre-application.                                                                                  |
      | Budget Tab - Budgeted Amount must be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section on the Budget tab. |
      | Overview Tab - Enter an Acknowledgement before submitting this Pre-Application.                                                                                     |
      | Budget Tab - Enter a Justification for project cost.                                                                                                                |
      | Budget Tab - Enter budget details for the first budget period before submitting the Pre-Application to the Grantor.                                                 |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                                   |

  @displayallfieldsongrid
  Scenario: all display fields on grid
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.all}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.all}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.all} | TestAutomationFlexTable3 |                           |                            |

  @549975 @549977
  Scenario Outline: LWC : E-Grid Functionality : Admin : To verify that user should be able to expand collapse the Parent-Child-Grand Child tables
  |LWC : E-Grid Functionality : PM : To verify that user should be able to expand collapse the Parent-Child-Grand Child tables|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | TestAutomationFlexTable3 |                           |                            |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    When I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly see "Eligibility Sub Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @549978
  Scenario: LWC : E-Grid Functionality : SPI : To verify that user should be able to expand collapse the Parent-Child-Grand Child tables
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly see "Eligibility Sub Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

  @549979 @549980
  Scenario Outline: LWC : E-Grid Functionality : Admin : To verify that Reset functionality should work properly on Parent-Child-Grand Child tables
  |LWC : E-Grid Functionality : PM : To verify that Reset functionality should work properly on Parent-Child-Grand Child tables |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | TestAutomationFlexTable3 |                           |                            |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    When I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly see "Eligibility Sub Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Sub Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @549981
  Scenario: LWC : E-Grid Functionality : SPI : To verify that Reset functionality should work properly on Parent-Child-Grand Child tables
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly see "Eligibility Sub Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Sub Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

  @549982 @549983
  Scenario Outline: LWC : E-Grid Functionality : Admin : To verify that Export functionality should work properly for Parent-Child-Grand Child tables
  |LWC : E-Grid Functionality : PM : To verify that Export functionality should work properly for Parent-Child-Grand Child tables |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table            | Enable Export (PDF)       | true              |                    | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (XLS / CSV) | true              |                    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Export (PDF)       | true          | TestAutomationFlexTable1 | Name                      |                            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true          | TestAutomationFlexTable1 | Name                      |                            |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    When I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "2" seconds
    When I click on "Menu" button inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Download as PDF" button is displayed
    Then I softly see "Download as CSV" button is displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @549984
  Scenario: LWC : E-Grid Functionality : SPI : To verify that Export functionality should work properly for Parent-Child-Grand Child tables
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    When I click on "Menu" button inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Download as PDF" button is displayed
    Then I softly see "Download as CSV" button is displayed

  @549944 @549944_1
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Information
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2  |
      | Flex Table            | Header              |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Header              |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Header              |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:6  |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:8  |
      | Flex Table            | Header Instruction  |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Header Instruction  |                                       |                    | ApiGeneratedId:10 |
      | Flex Table            | Header Instruction  |                                       |                    | ApiGeneratedId:11 |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:12 |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:13 |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:14 |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:15 |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:16 |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:17 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Header              | TestAutomationFlexTable1        | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Header              | TestAutomationFlexTable2        | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Header              | TestAutomationFlexTable3        | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Header Help Text    | Parent Header Help Text         | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Header Help Text    | Child Header Help Text          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Header Help Text    | GrandChild Header Help Text     | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Header Instruction  | Parent Header Instruction       | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Header Instruction  | Child Header Instruction        | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Header Instruction  | Grand Child Header Instruction  | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Order By            | ParentNumberTest__c             | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable1 | Name                      |                            |
      | Flex Table:General    | Order By            | ChildNumberTest__c              | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable2 | Name                      |                            |
      | Flex Table:General    | Order By            | GrandChildNumberTest__c         | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable3 | Name                      |                            |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    #parent #Header
    Then I softly see "TestAutomationFlexTable1" page block displayed
   #Header Instruction
    Then I see "Parent Header Instruction" shown as header instruction text in modal
    Then I see column "ParentNumberTest__c" value is in "Ascending" order
    And I wait for "3" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child #Header
    Then I softly see "TestAutomationFlexTable2" page block displayed
   #Header Instruction
    Then I see "Child Header Instruction" shown as header instruction text in modal
    Then I see column "ChildNumberTest__c" value is in "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #Grand Child #Header
    Then I softly see "TestAutomationFlexTable3" page block displayed
    Then I see column "GrandChildNumberTest__c" value is in "Ascending" order
   #Header Instruction
    Then I see "Grand Child Header Instruction" shown as header instruction text in modal

    Examples:
      | Users | NewDisplayFieldName                                   | NewDisplayFieldNameChild                            | NewDisplayFieldNameGrandChild                                 |
      | PM    | ParentNumberTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549944 @549944_2
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Information
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:3 |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:4 |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Header Help Text    | Parent Header Help Text         | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Header Help Text    | Child Header Help Text          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Header Help Text    | GrandChild Header Help Text     | TestAutomationFlexTable3 |                           |                            |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    #Header Help Text
    When I hovering mouse on help text icon inside page block detail "TestAutomationFlexTable1"
    Then I softly see "Parent Header Help Text" shown as help text
    And I wait for "3" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    When I hovering mouse on help text icon inside page block detail "TestAutomationFlexTable2"
    #Header Help Text
    Then I softly see "Child Header Help Text" shown as help text
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    When I hovering mouse on help text icon inside page block detail "TestAutomationFlexTable3"
    #Header Help Text
    Then I softly see "GrandChild Header Help Text" shown as help text

    Examples:
      | Users | NewDisplayFieldName               | NewDisplayFieldNameChild         | NewDisplayFieldNameGrandChild         |
      | PM    | {SavedValue:ParentFlexTable1.dfn} | {SavedValue:ChildFlexTable2.dfn} | {SavedValue:GrandChildFlexTable3.dfn} |

  @549944 @549944_3
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Information
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:3 |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:4 |
      | Flex Table            | Header Help Text    |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Show Link as Text   | false                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Show Link as Text   | false                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Show Link as Text   | false                                 |                    | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                               |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                               |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                               |
      | Flex Table:General    | Header Help Text    | Parent Header Help Text         | TestAutomationFlexTable1 |                           |                               |
      | Flex Table:General    | Header Help Text    | Child Header Help Text          | TestAutomationFlexTable2 |                           |                               |
      | Flex Table:General    | Header Help Text    | GrandChild Header Help Text     | TestAutomationFlexTable3 |                           |                               |
      | Flex Table List       | Show Link as Text   | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}     |
      | Flex Table List       | Show Link as Text   | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}      |
      | Flex Table List       | Show Link as Text   | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I do not see hyperlink at column value "www.google.com" inside "---flexgrid:-:TestAutomationFlexGrid1---" table
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I do not see hyperlink at column value "www.google.com" inside "---flexgrid:-:TestAutomationFlexGrid1---" table
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I do not see hyperlink at column value "www.google.com" inside "---flexgrid:-:TestAutomationFlexGrid3---" table

    Examples:
      | Users | NewDisplayFieldName                            | NewDisplayFieldNameChild                     | NewDisplayFieldNameGrandChild                          |
      | PM    | ParentUrl__c,{SavedValue:ParentFlexTable1.dfn} | ChildUrl__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildUrl__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @549945 @549945_1 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Field Label Override | FLO Parent                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List              | Field Label Override | FLO Child                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List              | Field Label Override | FLO Grand Child                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List              | Help Text            | Automation help text            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    Then I softly see "FLO Parent" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO Child" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see Help icon i is displayed beside the "ChildFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO Grand Child" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see Help icon i is displayed beside the "GrandChildFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                    | NewDisplayFieldNameChild                             | NewDisplayFieldNameGrandChild                                  |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentFormulaTest__c | {SavedValue:ChildFlexTable2.dfn},ChildFormulaTest__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildFormulaTest__c |

  @549945 @549945_2 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active                        | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names              | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names              | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names              | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                        | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active                        | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Field Label Override (Rich Text) | FLO Parent                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List              | Field Label Override (Rich Text) | FLO Child                       | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List              | Field Label Override (Rich Text) | FLO Grand Child                 | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "FLO Parent" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO Child" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO Grand Child" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                    | NewDisplayFieldNameChild                             | NewDisplayFieldNameGrandChild                                  |
      | PM    | {SavedValue:ParentFlexTable1.dfn},ParentFormulaTest__c | {SavedValue:ChildFlexTable2.dfn},ChildFormulaTest__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildFormulaTest__c |
