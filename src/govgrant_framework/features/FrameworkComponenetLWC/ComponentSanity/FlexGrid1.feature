@ComponentSanity @flexgrid @GridComponentSanity @flexgrid2 @ComponentSanity1

Feature: Component Sanity Testing 1. FlexGrid --Parent, Child , Grandchild Table 2. Flexi page
  In this feature file, we use the following tags for component-wise execution: @gridcomponent @FlexiPage

  @549995 @549995_5 @gridlessthanorequalto @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- SPI- Numeric Data Type Fields (Number, Currency & Percent) - Flex Table Detail Config
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentNumberTest | less than or equal to | 232323 |
    Then I softly see value "" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentCurrencyTest | less than or equal to | 232323 |
    Then I softly see value "" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | Parent Percentage Test | less than or equal to | 232323 |
    Then I softly see value "" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
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
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549945 @549945_3 @flexgridSubTotalOverallTotalAndFormula @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- PM- Standard & Formula Data Type Fields- Flex Table Detail Config
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
      | configurationCategory        | fieldName            | fieldNewValue                                                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block:Page Block Detail | Is Active            | true                                                              | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}      |
      | Flex Table:General           | Display Field Names  | {SavedValue:ParentFlexTable1.dfn},ParentFormulaTest__c            | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General           | Display Field Names  | {SavedValue:ChildFlexTable2.dfn},ChildFormulaTestNum__c           | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General           | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn},GrandChildFormulaTestNum__c | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List              | Enable Row Grouping  | true                                                              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Enable Sub Total     | true                                                              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Enable Row Grouping  | true                                                              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Enable Sub Total     | true                                                              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Enable Row Grouping  | true                                                              | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Enable Sub Total     | true                                                              | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Formula              |                                                                   | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Formula              |                                                                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Formula              |                                                                   | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Sub Total Label      | Lable Test                                                        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Sub Total Label      | Lable Test                                                        | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Sub Total Label      | Lable Test                                                        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Hide Grouping Column | true                                                              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Hide Grouping Column | true                                                              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Hide Grouping Column | true                                                              | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly do not see "ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Lable Test-ParentFormulaTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #child
    Then I softly do not see "ChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid2---"
    Then I softly see "Lable Test-ChildFormulaTestNum :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
#grandChild
    Then I softly do not see "GrandChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid3---"
    Then I softly see "Lable Test-GrandChildFormulaTestNum :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users |
      | PM    |

  @549991 @549991_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- SOQL config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Grid             | Required Fields     |                                       |                    | ApiGeneratedId:4 |
      | Flex Grid             | Required Fields     |                                       |                    | ApiGeneratedId:5 |
      | Flex Grid             | Required Fields     |                                       |                    | ApiGeneratedId:6 |
      | Flex Grid             | Default Page Size   | 5                                     |                    | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size   | 5                                     |                    | ApiGeneratedId:8 |
      | Flex Grid             | Default Page Size   | 5                                     |                    | ApiGeneratedId:9 |

    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Grid:General            | Required Fields     | ParentNumberTest1__c            | TestAutomationFlexTable1 | Name                      |                                     |
      | Flex Grid:General            | Required Fields     | ChildNumberTest1__c             | TestAutomationFlexTable2 | Name                      |                                     |
      | Flex Grid:General            | Required Fields     | GrandChildNumberTest1__c        | TestAutomationFlexTable3 | Name                      |                                     |
      | Flex Grid:General            | Default Page Size   | 5                               | TestAutomationFlexTable1 | Name                      |                                     |
      | Flex Grid:General            | Default Page Size   | 5                               | TestAutomationFlexTable2 | Name                      |                                     |
      | Flex Grid:General            | Default Page Size   | 5                               | TestAutomationFlexTable3 | Name                      |                                     |

    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I see table contains "Showing 1 to 5 of" inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details :
      | Please complete all field(s) marked in red. |
#    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
#    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
#    And I expand nested table containing column value "Permanent Parent Record"
#    Then I see table contains "Showing 1 to 5 of" inside table id "---flexgrid:-:TestAutomationFlexTable2---"
#    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
#    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
#    Then I softly see the following messages in the page details :
#      | Please complete all field(s) marked in red. |
#    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
#    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
#    And I expand nested table containing column value "Permanent Parent Record"
#    And I expand nested table containing column value "Permanent Child Record"
#    Then I see table contains "Showing 1 to" inside table id "---flexgrid:-:TestAutomationFlexTable2---"
#    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
#    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
#    Then I softly see the following messages in the page details :
#      | Please complete all field(s) marked in red. |

    Examples:
      | Users | NewDisplayFieldName                                    | NewDisplayFieldNameChild                             | NewDisplayFieldNameGrandChild                                  |
      | SPI3  | ParentNumberTest1__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest1__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest1__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549991 @549991_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- SOQL config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Grid             | Required Fields     |                                       |                    | ApiGeneratedId:4 |
      | Flex Grid             | Required Fields     |                                       |                    | ApiGeneratedId:5 |
      | Flex Grid             | Required Fields     |                                       |                    | ApiGeneratedId:6 |
      | Flex Grid             | Default Page Size   | 5                                     |                    | ApiGeneratedId:7 |
      | Flex Grid             | Default Page Size   | 5                                     |                    | ApiGeneratedId:8 |
      | Flex Grid             | Default Page Size   | 5                                     |                    | ApiGeneratedId:9 |

    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Grid:General            | Required Fields     | ParentNumberTest1__c            | TestAutomationFlexTable1 | Name                      |                                     |
      | Flex Grid:General            | Required Fields     | ChildNumberTest1__c             | TestAutomationFlexTable2 | Name                      |                                     |
      | Flex Grid:General            | Required Fields     | GrandChildNumberTest1__c        | TestAutomationFlexTable3 | Name                      |                                     |
      | Flex Grid:General            | Default Page Size   | 5                               | TestAutomationFlexTable1 | Name                      |                                     |
      | Flex Grid:General            | Default Page Size   | 5                               | TestAutomationFlexTable2 | Name                      |                                     |
      | Flex Grid:General            | Default Page Size   | 5                               | TestAutomationFlexTable3 | Name                      |                                     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I see table contains "Showing 1 to 5 of" inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details :
      | Please complete all field(s) marked in red. |
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I see table contains "Showing 1 to 5 of" inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details :
      | Please complete all field(s) marked in red. |
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    Then I see table contains "Showing 1 to" inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details :
      | Please complete all field(s) marked in red. |

    Examples:
      | Users | NewDisplayFieldName                                    | NewDisplayFieldNameChild                             | NewDisplayFieldNameGrandChild                                  |
      | SPI3  | ParentNumberTest1__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest1__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest1__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @549991  @549991_3
  Scenario Outline:3.0- FlexGrid Enhanced- SPI- SOQL config
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
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
      | SPI3  | ParentNumberTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549992 @549992_1
  Scenario: 3.0- FlexGrid Enhanced- SPI- User Interface Behavior Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | filterId          |
      | Flex Grid             | Enable Quick Search        | true              | ApiGeneratedId:0  |
      | Flex Grid             | Enable Pagination          | true              | ApiGeneratedId:1  |
      | Flex Grid             | Enable Total Records Count | true              | ApiGeneratedId:2  |
      | Flex Grid             | Enable Filter              | true              | ApiGeneratedId:3  |
      | Flex Grid             | Enable Auto Index          | true              | ApiGeneratedId:4  |
      | Flex Grid             | Enable Quick Search        | true              | ApiGeneratedId:5  |
      | Flex Grid             | Enable Pagination          | true              | ApiGeneratedId:6  |
      | Flex Grid             | Enable Total Records Count | true              | ApiGeneratedId:7  |
      | Flex Grid             | Enable Filter              | true              | ApiGeneratedId:8  |
      | Flex Grid             | Enable Auto Index          | true              | ApiGeneratedId:9  |
      | Flex Grid             | Enable Quick Search        | true              | ApiGeneratedId:10 |
      | Flex Grid             | Enable Pagination          | true              | ApiGeneratedId:11 |
      | Flex Grid             | Enable Total Records Count | true              | ApiGeneratedId:12 |
      | Flex Grid             | Enable Filter              | true              | ApiGeneratedId:13 |
      | Flex Grid             | Enable Auto Index          | true              | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Quick Search        | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Pagination          | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Total Records Count | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Filter              | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Auto Index          | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Quick Search        | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Pagination          | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Total Records Count | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Filter              | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Auto Index          | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Quick Search        | true          | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Enable Pagination          | true          | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Enable Total Records Count | true          | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Enable Filter              | true          | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Enable Auto Index          | true          | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see Quick Search is displayed in "---flexgrid:-:TestAutomationFlexGrid1---" table
    Then I see table contains "Showing 1 to" inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see Advance Filter box is displayed inside table id "---flexgrid:-:TestAutomationFlexGrid1---" in flex table
    Then I softly see "#" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I expand nested table containing column value "Permanent Parent Record"
    Then I see table contains "Showing 1 to" inside table id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see Quick Search is displayed in "---flexgrid:-:TestAutomationFlexTable2---" table
    Then I softly see Advance Filter box is displayed inside table id "---flexgrid:-:TestAutomationFlexTable2---" in flex table
    Then I softly see "#" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    Then I see table contains "Showing 1 to" inside table id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see Quick Search is displayed in "---flexgrid:-:TestAutomationFlexTable3---" table
    Then I softly see Advance Filter box is displayed inside table id "---flexgrid:-:TestAutomationFlexTable3---" in flex table
    Then I softly see "#" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

  @549994
  Scenario: 3.0- FlexGrid Enhanced- SPI- Export Setting, Record Selection
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Grid             | Enable Record Selection   | true              | ApiGeneratedId:0 |
      | Flex Grid             | Enable Export (PDF)       | true              | ApiGeneratedId:1 |
      | Flex Grid             | Enable Export (XLS / CSV) | true              | ApiGeneratedId:2 |
      | Flex Grid             | Enable Record Selection   | true              | ApiGeneratedId:3 |
      | Flex Grid             | Enable Export (PDF)       | true              | ApiGeneratedId:4 |
      | Flex Grid             | Enable Export (XLS / CSV) | true              | ApiGeneratedId:5 |
      | Flex Grid             | Enable Record Selection   | true              | ApiGeneratedId:6 |
      | Flex Grid             | Enable Export (PDF)       | true              | ApiGeneratedId:7 |
      | Flex Grid             | Enable Export (XLS / CSV) | true              | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Record Selection   | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Export (PDF)       | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true          | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Record Selection   | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Export (PDF)       | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true          | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Record Selection   | true          | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Enable Export (PDF)       | true          | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true          | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see record selection is displayed for tableId "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see record selection is displayed for tableId "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly see record selection is displayed for tableId "---flexgrid:-:TestAutomationFlexTable3---"

  @549995 @549995_1 @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Numeric Data Type Fields (Number, Currency & Percent) - Flex Table Detail Config
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
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:12 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}      |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List              | Field Label Override | FLO ParentNumberTest            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List              | Field Label Override | FLO ParentCurrencyTest          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List              | Field Label Override | FLO ParentPercentageTest        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table List              | Field Label Override | FLO ChildNumberTest             | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List              | Field Label Override | FLO ChildCurrencyTest           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List              | Field Label Override | FLO ChildPercentageTest         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table List              | Field Label Override | FLO GrandChildNumberTest        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List              | Field Label Override | FLO GrandChildCurrencyTest      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List              | Field Label Override | FLO GrandChildPercentageTest    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "FLO ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549995 @549995_2 @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Numeric Data Type Fields (Number, Currency & Percent) - Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active                        | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names              | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names              | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names              | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:12 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                        | fieldNewValue                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block:Page Block Detail | Is Active                        | true                               | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}      |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldName>              | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameChild>         | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameGrandChild>    | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentNumberTest         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentCurrencyTest       | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentPercentageTest     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildNumberTest          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildCurrencyTest        | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildPercentageTest      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildNumberTest     | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildCurrencyTest   | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildPercentageTest | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "Rich Text ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Rich Text ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Rich Text ParentPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "Rich Text ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "Rich Text ChildCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "Rich Text ChildPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "Rich Text GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "Rich Text GrandChildCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "Rich Text GrandChildPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549995 @549995_3 @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Numeric Data Type Fields (Number, Currency & Percent) - Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:16 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:17 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:18 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:19 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:20 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:21 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}      |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentNumberTest__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCurrencyTest__c}       |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPercentageTest__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildNumberTest__c}          |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCurrencyTest__c}        |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPercentageTest__c}      |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildNumberTest__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCurrencyTest__c}   |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPercentageTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "ParentNumberTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCurrencyTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPercentage Test :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentPercentage Test" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "ChildNumberTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ChildCurrencyTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Child Percentage Test :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "Child Percentage Test" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Child Record" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "GrandChildNumberTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "GrandChildCurrencyTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "GrandChildPercentageTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "GrandChildNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                 | NewDisplayFieldNameChild                                                                        | NewDisplayFieldNameGrandChild                                                                                       |
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549996 @549996_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Lookup, Picklist Data Type Fields- Flex Table Detail Config
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
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO ParentLookup                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Field Label Override | FLO ParentPicklist              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Field Label Override | FLO ChildLookup                 | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Field Label Override | FLO ChildPicklist               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Field Label Override | FLO GrandChildLookup            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Field Label Override | FLO GrandChildPicklist          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "FLO ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO ChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildPicklist" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO GrandChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildPicklist" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                 | NewDisplayFieldNameChild                                         | NewDisplayFieldNameGrandChild                                                   |
      | SPI3  | ParentLookup__c,ParentPicklist__c,{SavedValue:ParentFlexTable1.dfn} | ChildLookup__c,ChildPicklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildLookup__c,GrandChildPicklist__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549996 @549996_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Lookup, Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active                        | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names              | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names              | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names              | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                        | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active                        | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentLookup          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentPicklist        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildLookup           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildPicklist         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildLookup      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildPicklist    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "Rich Text ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Rich Text ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "Rich Text ChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "Rich Text ChildPicklist" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "Rich Text GrandChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "Rich Text GrandChildPicklist" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                 | NewDisplayFieldNameChild                                         | NewDisplayFieldNameGrandChild                                                   |
      | SPI3  | ParentLookup__c,ParentPicklist__c,{SavedValue:ParentFlexTable1.dfn} | ChildLookup__c,ChildPicklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildLookup__c,GrandChildPicklist__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549996 @549996_3
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Lookup, Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "ParentLookup :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPicklist :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "ChildLookup :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildPicklist :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildPicklist" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "GrandChildLookup :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildPicklist :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildLookup" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildPicklist" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                 | NewDisplayFieldNameChild                                         | NewDisplayFieldNameGrandChild                                                   |
      | SPI3  | ParentLookup__c,ParentPicklist__c,{SavedValue:ParentFlexTable1.dfn} | ChildLookup__c,ChildPicklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildLookup__c,GrandChildPicklist__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549996 @549996_4
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Lookup, Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:16 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:17 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:18 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:19 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:20 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:21 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:22 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:23 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:24 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:25 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:26 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:27 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}        |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}         |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}    |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly do not see "Lable Test-ParentPicklist :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Lable Test-ParentPicklist :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly do not see "Lable Test-ChildLookup :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "Lable Test-ChildPicklist :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly do not see "Lable Test-GrandChildLookup :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "Lable Test-GrandChildPicklist :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                 | NewDisplayFieldNameChild                                         | NewDisplayFieldNameGrandChild                                                   |
      | SPI3  | ParentLookup__c,ParentPicklist__c,{SavedValue:ParentFlexTable1.dfn} | ChildLookup__c,ChildPicklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildLookup__c,GrandChildPicklist__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @549996 @549996_5
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Lookup, Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:6  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:8  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:10 |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                     | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>                | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild>           | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table:General    | Order By            | ParentLookup__c,ParentPicklist__c         | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                       | TestAutomationFlexTable1 | Name                      |                                    |
      | Flex Table:General    | Order By            | ChildLookup__c,ChildPicklist__c           | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                       | TestAutomationFlexTable2 | Name                      |                                    |
      | Flex Table:General    | Order By            | GrandChildLookup__c,GrandChildPicklist__c | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                       | TestAutomationFlexTable3 | Name                      |                                    |
      | Flex Table List       | Disable sort order  | true                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLookup__c}       |
      | Flex Table List       | Disable sort order  | true                                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPicklist__c}     |
      | Flex Table List       | Disable sort order  | true                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLookup__c}        |
      | Flex Table List       | Disable sort order  | true                                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPicklist__c}      |
      | Flex Table List       | Disable sort order  | true                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLookup__c}   |
      | Flex Table List       | Disable sort order  | true                                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPicklist__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly do not see the column "ParentLookup" sorted in "Ascending" order
    Then I softly do not see the column "ParentPicklist" sorted in "Ascending" order
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly do not see the column "ChildLookup" sorted in "Ascending" order
    Then I softly do not see the column "ChildPicklist" sorted in "Ascending" order
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly do not see the column "GrandChildLookup" sorted in "Ascending" order
    Then I softly do not see the column "GrandChildPicklist" sorted in "Ascending" order

    Examples:
      | Users | NewDisplayFieldName                                                 | NewDisplayFieldNameChild                                         | NewDisplayFieldNameGrandChild                                                   |
      | SPI3  | ParentLookup__c,ParentPicklist__c,{SavedValue:ParentFlexTable1.dfn} | ChildLookup__c,ChildPicklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildLookup__c,GrandChildPicklist__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549997 @549997_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Email, URL & Reference Data Type Fields- Flex Table Detail Config
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
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO ParentUrl                   | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Field Label Override | FLO ParentEmail                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Field Label Override | FLO ChildUrl                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Field Label Override | FLO ChildEmail                  | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Field Label Override | FLO GrandChildUrl               | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Field Label Override | FLO GrandChildEmail             | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "FLO ParentUrl" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO ChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO GrandChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | SPI3  | ParentUrl__c,ParentEmail__c,{SavedValue:ParentFlexTable1.dfn} | ChildUrl__c,ChildEmail__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildUrl__c,GrandChildEmail__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549997 @549997_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Email, URL & Reference Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active                        | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names              | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names              | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names              | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                        | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active                        | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentUrl             | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentEmail           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildUrl              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildEmail            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildUrl         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildEmail       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "Rich Text ParentUrl" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Rich Text ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "Rich Text ChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "Rich Text ChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "Rich Text GrandChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "Rich Text GrandChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | SPI3  | ParentUrl__c,ParentEmail__c,{SavedValue:ParentFlexTable1.dfn} | ChildUrl__c,ChildEmail__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildUrl__c,GrandChildEmail__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549997 @549997_3
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Email, URL & Reference Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "ParentUrl :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentUrl" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "ChildUrl :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "GrandChildUrl :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildUrl" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildEmail" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | SPI3  | ParentUrl__c,ParentEmail__c,{SavedValue:ParentFlexTable1.dfn} | ChildUrl__c,ChildEmail__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildUrl__c,GrandChildEmail__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549997 @549997_4
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Email, URL & Reference Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:16 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:17 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:18 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:19 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:20 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:21 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:22 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:23 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:24 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:25 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:26 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:27 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}           |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}            |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}       |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly do not see "Lable Test-ParentEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Lable Test-ParentEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly do not see "Lable Test-ChildUrl :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "Lable Test-ChildEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly do not see "Lable Test-GrandChildUrl :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "Lable Test-GrandChildEmail :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | SPI3  | ParentUrl__c,ParentEmail__c,{SavedValue:ParentFlexTable1.dfn} | ChildUrl__c,ChildEmail__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildUrl__c,GrandChildEmail__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @549997 @549997_5
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Email, URL & Reference Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:6  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:8  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:10 |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>               | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>          | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild>     | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table:General    | Order By            | ParentUrl__c,ParentEmail__c         | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General    | Sort Direction      | ASC                                 | TestAutomationFlexTable1 | Name                      |                                 |
      | Flex Table:General    | Order By            | ChildUrl__c,ChildEmail__c           | TestAutomationFlexTable2 |                           |                                 |
      | Flex Table:General    | Sort Direction      | ASC                                 | TestAutomationFlexTable2 | Name                      |                                 |
      | Flex Table:General    | Order By            | GrandChildUrl__c,GrandChildEmail__c | TestAutomationFlexTable3 |                           |                                 |
      | Flex Table:General    | Sort Direction      | ASC                                 | TestAutomationFlexTable3 | Name                      |                                 |
      | Flex Table List       | Disable sort order  | true                                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentUrl__c}       |
      | Flex Table List       | Disable sort order  | true                                | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentEmail__c}     |
      | Flex Table List       | Disable sort order  | true                                | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildUrl__c}        |
      | Flex Table List       | Disable sort order  | true                                | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildEmail__c}      |
      | Flex Table List       | Disable sort order  | true                                | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildUrl__c}   |
      | Flex Table List       | Disable sort order  | true                                | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildEmail__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see the column "ParentUrl" sorted in "Ascending" order
    Then I softly see the column "ParentEmail" sorted in "Ascending" order
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see the column "ChildUrl" sorted in "Ascending" order
    Then I softly see the column "ChildEmail" sorted in "Ascending" order
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see the column "GrandChildUrl" sorted in "Ascending" order
    Then I softly see the column "GrandChildEmail" sorted in "Ascending" order

    Examples:
      | Users | NewDisplayFieldName                                           | NewDisplayFieldNameChild                                   | NewDisplayFieldNameGrandChild                                             |
      | SPI3  | ParentUrl__c,ParentEmail__c,{SavedValue:ParentFlexTable1.dfn} | ChildUrl__c,ChildEmail__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildUrl__c,GrandChildEmail__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549998 @549998_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Standard & Formula Data Type Fields- Flex Table Detail Config
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
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Field Label Override | FLO ParentFormulaTest           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List              | Field Label Override | FLO ParentName                  | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}            |
      | Flex Table List              | Field Label Override | FLO ChildFormulaTest            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List              | Field Label Override | FLO ChildName                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}             |
      | Flex Table List              | Field Label Override | FLO GrandChildFormulaTest       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
      | Flex Table List              | Field Label Override | FLO GrandChildName              | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "FLO ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentName" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO ChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildName" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO GrandChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildName" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                         | NewDisplayFieldNameChild                                  | NewDisplayFieldNameGrandChild                                       |
      | SPI3  | Name,ParentFormulaTest__c,{SavedValue:ParentFlexTable1.dfn} | Name,ChildFormulaTest__c,{SavedValue:ChildFlexTable2.dfn} | Name,GrandChildFormulaTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549998 @549998_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active                        | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names              | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names              | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names              | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                        | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active                        | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentFormulaTest     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentName            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}            |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildFormulaTest      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildName             | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}             |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildFormulaTest | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildName        | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "Rich Text ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Rich Text ParentName" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "Rich Text ChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "Rich Text ChildName" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "Rich Text GrandChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "Rich Text GrandChildName" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                         | NewDisplayFieldNameChild                                  | NewDisplayFieldNameGrandChild                                       |
      | SPI3  | Name,ParentFormulaTest__c,{SavedValue:ParentFlexTable1.dfn} | Name,ChildFormulaTest__c,{SavedValue:ChildFlexTable2.dfn} | Name,GrandChildFormulaTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549998 @549998_3
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}            |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}            |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}             |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}             |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}        |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "ParentFormulaTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentName :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentName" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "ChildFormulaTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildName :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildName" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "GrandChildFormulaTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildName :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildName" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                         | NewDisplayFieldNameChild                                  | NewDisplayFieldNameGrandChild                                       |
      | SPI3  | Name,ParentFormulaTest__c,{SavedValue:ParentFlexTable1.dfn} | Name,ChildFormulaTest__c,{SavedValue:ChildFlexTable2.dfn} | Name,GrandChildFormulaTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549998 @549998_4
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:16 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:17 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:18 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:19 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:20 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:21 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:22 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:23 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:24 |
      | Flex Table List       | Enable Sub Total     | false                                 |                    | ApiGeneratedId:25 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:26 |
      | Flex Table List       | Sub Total Label      |                                       |                    | ApiGeneratedId:27 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}      |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}               |
      | Flex Table List              | Hide Grouping Column | false                           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Hide Grouping Column | false                           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}               |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}               |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}        |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}               |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}                |
      | Flex Table List              | Hide Grouping Column | false                           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Hide Grouping Column | false                           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}                |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}                |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTestNum__c}      |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}                |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}           |
      | Flex Table List              | Hide Grouping Column | false                           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Hide Grouping Column | false                           | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}           |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Enable Sub Total     | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}           |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTestNum__c} |
      | Flex Table List              | Sub Total Label      | Lable Test                      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}           |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "Lable Test-ParentFormulaTest :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Lable Test-Eligibility Category Name :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "Lable Test-ChildFormulaTestNum :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "Lable Test-Eligibility Question Name :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "Lable Test-Eligibility Sub Question Name :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "Lable Test-GrandChildFormulaTestNum :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                         | NewDisplayFieldNameChild                                     | NewDisplayFieldNameGrandChild                                          |
      | SPI3  | Name,ParentFormulaTest__c,{SavedValue:ParentFlexTable1.dfn} | Name,ChildFormulaTestNum__c,{SavedValue:ChildFlexTable2.dfn} | Name,GrandChildFormulaTestNum__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @549998 @549998_5
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Standard & Formula Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:6  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:8  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:10 |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table:General    | Order By            | ParentFormulaTest__c,Name       | TestAutomationFlexTable1 |                           |                                       |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable1 | Name                      |                                       |
      | Flex Table:General    | Order By            | ChildFormulaTest__c,Name        | TestAutomationFlexTable2 |                           |                                       |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable2 | Name                      |                                       |
      | Flex Table:General    | Order By            | Name,GrandChildFormulaTest__c,  | TestAutomationFlexTable3 |                           |                                       |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable3 | Name                      |                                       |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentFormulaTest__c}     |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentName__c}            |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildFormulaTest__c}      |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildName__c}             |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildFormulaTest__c} |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildName__c}        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    Then I softly do not see the column "ParentFormulaTest" sorted in "Ascending" order
    Then I softly do not see the column "ParentName" sorted in "Ascending" order
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly do not see the column "ChildFormulaTest" sorted in "Ascending" order
    Then I softly do not see the column "ChildName" sorted in "Ascending" order
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly do not see the column "GrandChildFormulaTest" sorted in "Ascending" order
    Then I softly do not see the column "GrandChildName" sorted in "Ascending" order

    Examples:
      | Users | NewDisplayFieldName                                         | NewDisplayFieldNameChild                                  | NewDisplayFieldNameGrandChild                                       |
      | SPI3  | Name,ParentFormulaTest__c,{SavedValue:ParentFlexTable1.dfn} | Name,ChildFormulaTest__c,{SavedValue:ChildFlexTable2.dfn} | Name,GrandChildFormulaTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549999 @549999_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Information
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    #parent #Header
    Then I softly see "TestAutomationFlexTable1" page block displayed
   #Header Instruction
    Then I see "Parent Header Instruction" shown as header instruction text in modal
    Then I softly see the column "ParentNumberTest" sorted in "Ascending" order
    And I wait for "3" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child #Header
    Then I softly see "TestAutomationFlexTable2" page block displayed
   #Header Instruction
    Then I see "Child Header Instruction" shown as header instruction text in modal
    Then I softly see the column "ChildNumberTest" sorted in "Ascending" order
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #Grand Child #Header
    Then I softly see "TestAutomationFlexTable3" page block displayed
    Then I softly see the column "GrandChildNumberTest" sorted in "Ascending" order
    #Header Instruction
    Then I see "Grand Child Header Instruction" shown as header instruction text in modal

    Examples:
      | Users | NewDisplayFieldName                                   | NewDisplayFieldNameChild                            | NewDisplayFieldNameGrandChild                                 |
      | SPI3  | ParentNumberTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @549999 @549999_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Information
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | {SavedValue:ParentFlexTable1.dfn} | {SavedValue:ChildFlexTable2.dfn} | {SavedValue:GrandChildFlexTable3.dfn} |

  @549999 @549999_3
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Information
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | ParentUrl__c,{SavedValue:ParentFlexTable1.dfn} | ChildUrl__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildUrl__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550000 @550000_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Multi-Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}        |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                            |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                            |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                            |
      | Flex Table List              | Field Label Override | FLO Test Multi Picklist         | TestAutomationFlexTable1 | Name                      | {SavedValue:Test_Multi_Picklist__c}        |
      | Flex Table List              | Field Label Override | FLO Test Multi Picklist         | TestAutomationFlexTable2 | Name                      | {SavedValue:Test_Multi_select_Picklist__c} |
      | Flex Table List              | Field Label Override | FLO GrandChildMultiselect       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildMultiselect__c}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "FLO Test Multi Picklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO Test Multi Picklist" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO GrandChildMultiselect" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                      | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                  |
      | SPI3  | Test_Multi_Picklist__c,{SavedValue:ParentFlexTable1.dfn} | Test_Multi_select_Picklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildMultiselect__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550000 @550000_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Multi-Picklist Data Type Fields- Flex Table Detail Config
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
      | configurationCategory        | fieldName                        | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block:Page Block Detail | Is Active                        | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser}        |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                            |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                            |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                            |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text Test Multi Picklist   | TestAutomationFlexTable1 | Name                      | {SavedValue:Test_Multi_Picklist__c}        |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text Test Multi Picklist   | TestAutomationFlexTable2 | Name                      | {SavedValue:Test_Multi_select_Picklist__c} |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildMultiselect | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildMultiselect__c}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "Rich Text Test Multi Picklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "Rich Text Test Multi Picklist" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "Rich Text GrandChildMultiselect" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                      | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                  |
      | SPI3  | Test_Multi_Picklist__c,{SavedValue:ParentFlexTable1.dfn} | Test_Multi_select_Picklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildMultiselect__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @550000 @550000_5
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Multi-Picklist Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:6  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:8  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:10 |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                            |
      | Flex Table:General    | Order By            | Test_Multi_Picklist__c          | TestAutomationFlexTable1 |                           |                                            |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable1 | Name                      |                                            |
      | Flex Table:General    | Order By            | Test_Multi_select_Picklist__c   | TestAutomationFlexTable2 |                           |                                            |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable2 | Name                      |                                            |
      | Flex Table:General    | Order By            | GrandChildMultiselect__c        | TestAutomationFlexTable3 |                           |                                            |
      | Flex Table:General    | Sort Direction      | ASC                             | TestAutomationFlexTable3 | Name                      |                                            |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:Test_Multi_Picklist__c}        |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:Test_Multi_select_Picklist__c} |
      | Flex Table List       | Disable sort order  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildMultiselect__c}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see the column "Test Multi Picklist" sorted in "Ascending" order
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see the column "Test Multi Picklist" sorted in "Ascending" order
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see the column "GrandChildMultiselect" sorted in "Ascending" order

    Examples:
      | Users | NewDisplayFieldName                                      | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                  |
      | SPI3  | Test_Multi_Picklist__c,{SavedValue:ParentFlexTable1.dfn} | Test_Multi_select_Picklist__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildMultiselect__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550001 @550001_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Checkbox, Phone Data Type Fields- Flex Table Detail Config
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
      | Flex Table List       | Field Label Override |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override | FLO ParentPhone                 | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Field Label Override | FLO ParentCheckbox              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}      |
      | Flex Table List              | Field Label Override | FLO ChildPhone                  | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}          |
      | Flex Table List              | Field Label Override | FLO ChildCheckbox               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCheckbox__c}       |
      | Flex Table List              | Field Label Override | FLO GrandChildPhone             | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}     |
      | Flex Table List              | Field Label Override | FLO GrandChildCheckbox          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCheckbox__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "FLO ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO ChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO GrandChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                | NewDisplayFieldNameChild                                        | NewDisplayFieldNameGrandChild                                                  |
      | SPI3  | ParentCheckbox__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildCheckbox__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildCheckbox__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550001 @550001_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Checkbox, Phone Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                     | coreComponentField | filterId         |
      | Page Block            | Is Active                        | true                                  | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names              | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names              | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names              | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:7 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:8 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName                        | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active                        | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names              | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentPhone           | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ParentCheckbox        | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}      |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildPhone            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}          |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text ChildCheckbox         | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCheckbox__c}       |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildPhone       | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}     |
      | Flex Table List              | Field Label Override (Rich Text) | Rich Text GrandChildCheckbox    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCheckbox__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "Rich Text ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Rich Text ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "Rich Text ChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "Rich Text ChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "Rich Text GrandChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "Rich Text GrandChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                | NewDisplayFieldNameChild                                        | NewDisplayFieldNameGrandChild                                                  |
      | SPI3  | ParentCheckbox__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildCheckbox__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildCheckbox__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550001 @550001_3 @Bug-552193
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Checkbox, Phone Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                                  | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:3  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:13 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:15 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}      |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}         |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}      |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}          |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCheckbox__c}       |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}          |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCheckbox__c}       |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}     |
      | Flex Table List              | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCheckbox__c}  |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}     |
      | Flex Table List              | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCheckbox__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "ParentPhone :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCheckbox :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "ChildPhone :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildCheckbox :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "GrandChildPhone :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildCheckbox :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildPhone" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Examples:
      | Users | NewDisplayFieldName                                                | NewDisplayFieldNameChild                                        | NewDisplayFieldNameGrandChild                                                  |
      | SPI3  | ParentCheckbox__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildCheckbox__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildCheckbox__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550001 @550001_4
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Checkbox, Phone Data Type Fields- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:6  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:8  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:9  |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:10 |
      | Flex Table            | Disable sort order  |                                       |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                    | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>               | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild>          | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table:General    | Order By            | ParentPhone__c,ParentCheckbox__c         | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                      | TestAutomationFlexTable1 | Name                      |                                    |
      | Flex Table:General    | Order By            | ChildPhone__c,ChildCheckbox__c           | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                      | TestAutomationFlexTable2 | Name                      |                                    |
      | Flex Table:General    | Order By            | GrandChildCheckbox__c,GrandChildPhone__c | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                      | TestAutomationFlexTable3 | Name                      |                                    |
      | Flex Table List       | Disable sort order  | true                                     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentPhone__c}        |
      | Flex Table List       | Disable sort order  | true                                     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentCheckbox__c}     |
      | Flex Table List       | Disable sort order  | true                                     | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildPhone__c}         |
      | Flex Table List       | Disable sort order  | true                                     | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildCheckbox__c}      |
      | Flex Table List       | Disable sort order  | true                                     | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildPhone__c}    |
      | Flex Table List       | Disable sort order  | true                                     | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildCheckbox__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    Then I softly see the column "ParentPhone" sorted in "Ascending" order
    Then I softly see the column "ParentCheckbox" sorted in "Ascending" order
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see the column "ChildPhone" sorted in "Ascending" order
    Then I softly see the column "ChildCheckbox" sorted in "Ascending" order
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see the column "GrandChildPhone" sorted in "Ascending" order
    Then I softly see the column "GrandChildCheckbox" sorted in "Ascending" order

    Examples:
      | Users | NewDisplayFieldName                                                | NewDisplayFieldNameChild                                        | NewDisplayFieldNameGrandChild                                                  |
      | SPI3  | ParentCheckbox__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildCheckbox__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildCheckbox__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550008 @flexgrid @gridcomponent
  Scenario Outline:  3.0- FlexGrid Enhanced- SPI- Actions- Delete
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | Users | NewDisplayFieldName                                     | NewDisplayFieldNameChild                              | NewDisplayFieldNameGrandChild                                   |
      | SPI3  | ParentCurrencyTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildCurrencyTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildCurrencyTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550006
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Actions- Edit
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
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable1 | Name                      | Edit                                |
      | Flex Table Action            | Refresh Behavior    | Refresh the entire page         | TestAutomationFlexTable1 | Name                      | Edit                                |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable2 | Name                      | Edit                                |
      | Flex Table Action            | Refresh Behavior    | Refresh the entire page         | TestAutomationFlexTable2 | Name                      | Edit                                |
      | Flex Table Action            | Location            | Row                             | TestAutomationFlexTable3 | Name                      | Edit                                |
      | Flex Table Action            | Refresh Behavior    | Refresh the entire page         | TestAutomationFlexTable3 | Name                      | Edit                                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    #Parent grid
    When I enter the following values into flex table with id "---flexgrid:-:TestAutomationFlexGrid1---" by clicking "New" :
      | Category Name        | Category Number | Category Description           |
      | delete parent record | 11              | delete Refresh the entire page |
    When I perform quick search for "delete parent record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "delete parent record"
    When I enter the following values into flex table with id "---flexgrid:-:TestAutomationFlexTable2---" by clicking "New" :
      | Eligibility Question Name | ChildCurrencyTest |
      | delete child record       | 33                |
    And I click on "Edit" icon for "delete child record" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---" without waiting for record
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see entire page is refreshing
    When I perform quick search for "delete parent record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I edit the following rows inline in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---" by clicking "Edit" :
      | Category Name        | Category Number | Category Description |
      | delete parent record | 1000            | editable records     |
    When I perform quick search for "delete parent record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I see the following rows under the following headers in table with id "---flexgrid:-:TestAutomationFlexGrid1---" :
      | Category Name        | Category Number | Category Description |
      | delete parent record | 1000            | editable records     |
    Examples:
      | Users | NewDisplayFieldName                                     | NewDisplayFieldNameChild                              | NewDisplayFieldNameGrandChild                                   |
      | SPI3  | ParentCurrencyTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildCurrencyTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildCurrencyTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550006 @550008 @550006actions @550007
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Actions- Edit
  |3.0- FlexGrid Enhanced- SPI- Actions- Delete|
  | 3.0- FlexGrid Enhanced  - SPI- Actions- View|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | filterId          |
      | Page Block            | Is Active            | true                                  | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      | ApiGeneratedId:2  |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} | ApiGeneratedId:3  |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:4  |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:5  |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:6  |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:7  |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:8  |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:9  |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:10 |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:11 |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:12 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                                                           | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                                          | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>                                     | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild>                                | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HETActionLevelButtonForSPIProf                | TestAutomationFlexTable1 | Name                      | Edit                                |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HideColumnJsonChildTableProfileInForSPI3      | TestAutomationFlexTable2 | Name                      | Edit                                |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HideColumnJsonGrandChildTableProfileInForSPI3 | TestAutomationFlexTable3 | Name                      | Edit                                |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HETActionLevelButtonForSPIProf                | TestAutomationFlexTable1 | Name                      | Delete                              |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HideColumnJsonChildTableProfileInForSPI3      | TestAutomationFlexTable2 | Name                      | Delete                              |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HideColumnJsonGrandChildTableProfileInForSPI3 | TestAutomationFlexTable3 | Name                      | Delete                              |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HETActionLevelButtonForSPIProf                | TestAutomationFlexTable1 | Name                      | View                                |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HideColumnJsonChildTableProfileInForSPI3      | TestAutomationFlexTable2 | Name                      | View                                |
      | Flex Table Action            | Hide Expression JSON | govgrants_config:HideColumnJsonGrandChildTableProfileInForSPI3 | TestAutomationFlexTable3 | Name                      | View                                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    #Parent grid
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly cannot see row level action button "Edit" against "Permanent Parent Record" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly cannot see row level action button "Delete" against "Permanent Parent Record" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly cannot see row level action button "View" against "Permanent Parent Record" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly cannot see row level action button "Edit" against "Permanent Child Record" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly cannot see row level action button "Delete" against "Permanent Child Record" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly cannot see row level action button "View" against "Permanent Child Record" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    Then I softly cannot see row level action button "Edit" against "Permanent Grand Child Record" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly cannot see row level action button "Delete" against "Permanent Grand Child Record" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly cannot see row level action button "View" against "Permanent Grand Child Record" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName               | NewDisplayFieldNameChild         | NewDisplayFieldNameGrandChild         |
      | SPI3  | {SavedValue:ParentFlexTable1.dfn} | {SavedValue:ChildFlexTable2.dfn} | {SavedValue:GrandChildFlexTable3.dfn} |

  @550002 @flexgrid @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI-  Date and Date & Time Data Type Fields- Flex Table Detail Config
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | {SavedValue:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c | {SavedValue:ChildFlexTable2.dfn},ChildDate__c,ChildDateTime__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildDate__c,GrandChildDateTime__c |

  @550003 @550003_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)- Flex Table Detail Config
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
      | Flex Table List       | Field Label Override | FLO ParentText                  | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}             |
      | Flex Table List       | Field Label Override | FLO ParentTextArea              | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentTextArea__c}         |
      | Flex Table List       | Field Label Override | FLO ParentLongTextArea          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLongTextArea__c}     |
      | Flex Table List       | Field Label Override | FLO ParentRichTextArea          | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentRichTextArea__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                        |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                        |
      | Flex Table List       | Field Label Override | FLO ChildText                   | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}              |
      | Flex Table List       | Field Label Override | FLO ChildTextArea               | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildTextArea__c}          |
      | Flex Table List       | Field Label Override | FLO ChildLongTextArea           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLongTextArea__c}      |
      | Flex Table List       | Field Label Override | FLO ChildRichTextArea           | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildRichTextArea__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                        |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                        |
      | Flex Table List       | Field Label Override | FLO GrandChildText              | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}         |
      | Flex Table List       | Field Label Override | FLO GrandChildTextArea          | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildTextArea__c}     |
      | Flex Table List       | Field Label Override | FLO GrandChildLongTextArea      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLongTextArea__c} |
      | Flex Table List       | Field Label Override | FLO GrandChildRichTextArea      | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildRichTextArea__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    Then I softly see "FLO ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLO ChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLO ChildLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ChildRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLO GrandChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLO GrandChildRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                           | NewDisplayFieldNameChild                                                                                 | NewDisplayFieldNameGrandChild                                                                                                     |
      | SPI3  | ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,{SavedValue:ParentFlexTable1.dfn} | ChildText__c,ChildTextArea__c,ChildLongTextArea__c,ChildRichTextArea__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,GrandChildTextArea__c,GrandChildLongTextArea__c,GrandChildRichTextArea__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550003 @550003_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names              | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter                    | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Display Field Names              | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:6  |
      | Flex Table            | Enable Filter                    | true                                  |                    | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:10 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:11 |
      | Flex Table            | Display Field Names              | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:12 |
      | Flex Table            | Enable Filter                    | true                                  |                    | ApiGeneratedId:13 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:14 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:15 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:16 |
      | Flex Table List       | Field Label Override (Rich Text) |                                       |                    | ApiGeneratedId:17 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue                       | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Flex Table:General    | Display Field Names              | <NewDisplayFieldName>               | TestAutomationFlexTable1 |                           |                                        |
      | Flex Table:General    | Enable Filter                    | true                                | TestAutomationFlexTable1 |                           |                                        |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ParentText             | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}             |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ParentTextArea         | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentTextArea__c}         |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ParentLongTextArea     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentLongTextArea__c}     |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ParentRichTextArea     | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentRichTextArea__c}     |
      | Flex Table:General    | Display Field Names              | <NewDisplayFieldNameChild>          | TestAutomationFlexTable2 |                           |                                        |
      | Flex Table:General    | Enable Filter                    | true                                | TestAutomationFlexTable2 |                           |                                        |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ChildText              | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}              |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ChildTextArea          | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildTextArea__c}          |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ChildLongTextArea      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildLongTextArea__c}      |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text ChildRichTextArea      | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildRichTextArea__c}      |
      | Flex Table:General    | Display Field Names              | <NewDisplayFieldNameGrandChild>     | TestAutomationFlexTable3 |                           |                                        |
      | Flex Table:General    | Enable Filter                    | true                                | TestAutomationFlexTable3 |                           |                                        |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text GrandChildText         | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}         |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text GrandChildTextArea     | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildTextArea__c}     |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text GrandChildLongTextArea | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildLongTextArea__c} |
      | Flex Table List       | Field Label Override (Rich Text) | FLORich Text GrandChildRichTextArea | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildRichTextArea__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    Then I softly see "FLORich Text ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLORich Text ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLORich Text ParentLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLORich Text ParentRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see "FLORich Text ChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLORich Text ChildTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "FLORich Text ChildLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLORich Text ChildRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see "FLORich Text GrandChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLORich Text GrandChildTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLORich Text GrandChildLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "FLORich Text GrandChildRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                           | NewDisplayFieldNameChild                                                                                 | NewDisplayFieldNameGrandChild                                                                                                     |
      | SPI3  | ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,{SavedValue:ParentFlexTable1.dfn} | ChildText__c,ChildTextArea__c,ChildLongTextArea__c,ChildRichTextArea__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,GrandChildTextArea__c,GrandChildLongTextArea__c,GrandChildRichTextArea__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550003 @550003_3
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:5  |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:6  |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:7  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:12 |
      | Flex Table            | Enable Filter        | true                                  |                    | ApiGeneratedId:13 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:14 |
      | Flex Table List       | Enable Row Grouping  | false                                 |                    | ApiGeneratedId:15 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:16 |
      | Flex Table List       | Hide Grouping Column | false                                 |                    | ApiGeneratedId:17 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List       | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}         |
      | Flex Table List       | Enable Row Grouping  | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentTextArea__c}     |
      | Flex Table List       | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}         |
      | Flex Table List       | Hide Grouping Column | true                            | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentTextArea__c}     |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table List       | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}          |
      | Flex Table List       | Enable Row Grouping  | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildTextArea__c}      |
      | Flex Table List       | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}          |
      | Flex Table List       | Hide Grouping Column | true                            | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildTextArea__c}      |
      | Flex Table:General    | Display Field Names  | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table:General    | Enable Filter        | true                            | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table List       | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}     |
      | Flex Table List       | Enable Row Grouping  | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildTextArea__c} |
      | Flex Table List       | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}     |
      | Flex Table List       | Hide Grouping Column | true                            | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildTextArea__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    Then I softly do not see "ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentText :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentTextArea :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly do not see "ChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly do not see "ChildTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildText :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    Then I softly see "ChildTextArea :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable2---"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly do not see "GrandChildText" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly do not see "GrandChildTextArea" in flex table header "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildText :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"
    Then I softly see "GrandChildTextArea :" inside rows of enhanced grid id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                               | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                                 |
      | SPI3  | ParentText__c,ParentTextArea__c,{SavedValue:ParentFlexTable1.dfn} | ChildText__c,ChildTextArea__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,GrandChildTextArea__c,{SavedValue:GrandChildFlexTable3.dfn} |


  @550003 @550003_4
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Text Data Type Fields (Text, Text Area, Long Text Area & Rich Text Area)- Flex Table Detail Config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:3  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:4  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:5  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:6  |
      | Flex Table            | Order By            |                                       |                    | ApiGeneratedId:7  |
      | Flex Table            | Sort Direction      |                                       |                    | ApiGeneratedId:8  |
      | Flex Table            | Disable sort order  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table            | Disable sort order  | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table            | Disable sort order  | false                                 |                    | ApiGeneratedId:11 |
      | Flex Table            | Disable sort order  | false                                 |                    | ApiGeneratedId:9  |
      | Flex Table            | Disable sort order  | false                                 |                    | ApiGeneratedId:10 |
      | Flex Table            | Disable sort order  | false                                 |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>                   | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>              | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild>         | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table:General    | Order By            | ParentText__c,ParentTextArea__c         | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                     | TestAutomationFlexTable1 | Name                      |                                    |
      | Flex Table:General    | Order By            | ChildText__c,ChildTextArea__c           | TestAutomationFlexTable2 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                     | TestAutomationFlexTable2 | Name                      |                                    |
      | Flex Table:General    | Order By            | GrandChildText__c,GrandChildTextArea__c | TestAutomationFlexTable3 |                           |                                    |
      | Flex Table:General    | Sort Direction      | ASC                                     | TestAutomationFlexTable3 | Name                      |                                    |
      | Flex Table List       | Disable sort order  | true                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentText__c}         |
      | Flex Table List       | Disable sort order  | true                                    | TestAutomationFlexTable1 | Name                      | {SavedValue:ParentTextArea__c}     |
      | Flex Table List       | Disable sort order  | true                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildText__c}          |
      | Flex Table List       | Disable sort order  | true                                    | TestAutomationFlexTable2 | Name                      | {SavedValue:ChildTextArea__c}      |
      | Flex Table List       | Disable sort order  | true                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildText__c}     |
      | Flex Table List       | Disable sort order  | true                                    | TestAutomationFlexTable3 | Name                      | {SavedValue:GrandChildTextArea__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    Then I softly see the column "ParentText" sorted in "Ascending" order
    Then I softly see the column "ParentTextArea" sorted in "Ascending" order
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    Then I softly see the column "ChildText" sorted in "Ascending" order
    Then I softly see the column "ChildTextArea" sorted in "Ascending" order
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly see the column "GrandChildText" sorted in "Ascending" order
    Then I softly see the column "GrandChildTextArea" sorted in "Ascending" order

    Examples:
      | Users | NewDisplayFieldName                                               | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                                 |
      | SPI3  | ParentText__c,ParentTextArea__c,{SavedValue:ParentFlexTable1.dfn} | ChildText__c,ChildTextArea__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,GrandChildTextArea__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550009
  Scenario Outline:  3.0- FlexGrid Enhanced- SPI- Advance Filter- Text Data Types (Text, Text Area, Long Text Area & Rich Text Area)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId          |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0  |
      | Flex Table            | Enable Filter       | true                                  |                    | ApiGeneratedId:1  |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:6  |
      | Flex Table            | Enable Filter       | true                                  |                    | ApiGeneratedId:7  |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:12 |
      | Flex Table            | Enable Filter       | true                                  |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Enable Filter       | true                            | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Enable Filter       | true                            | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Enable Filter       | true                            | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,{SavedValue:ParentFlexTable1.dfn} | ChildText__c,ChildTextArea__c,ChildLongTextArea__c,ChildRichTextArea__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,GrandChildTextArea__c,GrandChildLongTextArea__c,GrandChildRichTextArea__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550010 @550010_1 @gridcontains @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Advance Filter- Email, URL, Phone, Formula (Text) & Reference data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentEmail | contains | parentemail |
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    When I click on button "Clear" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentPhone | contains | 987 |
    Then I softly see value "(987) 654-3210" for title "ParentPhone" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
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
      | Users | NewDisplayFieldName                                                          | NewDisplayFieldNameChild                                                 | NewDisplayFieldNameGrandChild                                                                |
      | SPI3  | ParentEmail__c,ParentUrl__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550010 @550010_2 @gridcontains @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Advance Filter- Email, URL, Phone, Formula (Text) & Reference data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentPhone | does not contains | 111111111111111111 |
    Then I softly see value "(987) 654-3210" for title "ParentPhone" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
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
      | Users | NewDisplayFieldName                                                          | NewDisplayFieldNameChild                                                 | NewDisplayFieldNameGrandChild                                                                |
      | SPI3  | ParentEmail__c,ParentUrl__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550010 @550010_3 @gridstartswith @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Advance Filter- Email, URL, Phone, Formula (Text) & Reference data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
    And I click on advance filter of table id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
    And I enter advance filter values inside id "---flexgrid:-:TestAutomationFlexGrid1---" for LWC
      | ParentPhone | does not contains | 1111111 |
    Then I softly see value "(987) 654-3210" for title "ParentPhone" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
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
      | Users | NewDisplayFieldName                                                          | NewDisplayFieldNameChild                                                 | NewDisplayFieldNameGrandChild                                                                |
      | SPI3  | ParentEmail__c,ParentUrl__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550010 @550010_4 @gridendswith @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Advance Filter- Email, URL, Phone, Formula (Text) & Reference data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | Users | NewDisplayFieldName                                                          | NewDisplayFieldNameChild                                                 | NewDisplayFieldNameGrandChild                                                                |
      | SPI3  | ParentEmail__c,ParentUrl__c,ParentPhone__c,{SavedValue:ParentFlexTable1.dfn} | ChildEmail__c,ChildUrl__c,ChildPhone__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildEmail__c,GrandChildUrl__c,GrandChildPhone__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550011 @flexgrid @gridcomponent
  Scenario Outline:3.0- FlexGrid Enhanced- SPI- Advance Filter- Date and Date & Time data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
    And I perform quick search for "1/1/2026, 12:30 PM" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "ChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "2026" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026" for title "ChildDate" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "1/1/2026, 09:30" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "ChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable2---"
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
    And I perform quick search for "1/1/2026, 12:30 PM" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "GrandChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "2026" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026" for title "GrandChildDate" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026, 09:30" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "GrandChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026Test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026, 09:30 Test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "#$202#6%#" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                               | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                                 |
      | SPI3  | {SavedValue:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c | {SavedValue:ChildFlexTable2.dfn},ChildDate__c,ChildDateTime__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildDate__c,GrandChildDateTime__c |

  @550013 @550013_1 @gridequalsto @gridcomponent
  Scenario Outline:   3.0- FlexGrid Enhanced- SPI- Advance Filter- Numeric Data Types (Number, Currency & Percent)
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550013 @550013_2 @gridlessthan @gridcomponent
  Scenario Outline:   3.0- FlexGrid Enhanced- SPI- Advance Filter- Numeric Data Types (Number, Currency & Percent)
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550013 @550013_3 @gridgreaterthan @gridcomponent
  Scenario Outline:   3.0- FlexGrid Enhanced- SPI- Advance Filter- Numeric Data Types (Number, Currency & Percent)
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550013 @550013_4 @gridgreaterthanorequalto @gridcomponent
  Scenario Outline:   3.0- FlexGrid Enhanced- SPI- Advance Filter- Numeric Data Types (Number, Currency & Percent)
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550013 @550013_5 @gridlessthanorequalto @gridcomponent
  Scenario Outline:   3.0- FlexGrid Enhanced- SPI- Advance Filter- Numeric Data Types (Number, Currency & Percent)
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentPercentageTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildNumberTest__c,ChildCurrencyTest__c,ChildPercentageTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildNumberTest__c,GrandChildCurrencyTest__c,GrandChildPercentageTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550014 @flexgrid @gridcomponent
  Scenario Outline:3.0- FlexGrid Enhanced- SPI-  Quick Search Scenarios-  Date and Date & Time data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
    And I perform quick search for "1/1/2026, 12:30 PM" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "ChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "2026" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026" for title "ChildDate" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "1/1/2026, 09:30" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "ChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable2---"
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
    And I perform quick search for "1/1/2026, 12:30 PM" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "GrandChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "2026" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026" for title "GrandChildDate" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026, 09:30" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "1/1/2026, 12:30 PM" for title "GrandChildDateTime" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026Test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "1/1/2026, 09:30 Test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "#$202#6%#" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                               | NewDisplayFieldNameChild                                       | NewDisplayFieldNameGrandChild                                                 |
      | SPI3  | {SavedValue:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c | {SavedValue:ChildFlexTable2.dfn},ChildDate__c,ChildDateTime__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildDate__c,GrandChildDateTime__c |

  @550016 @gridcomponent
  Scenario Outline: 3.0- FlexGrid  Enhanced- SPI-  Quick Search Scenarios- Checkbox, Email, URL data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | {SavedValue:ParentFlexTable1.dfn},ParentCheckbox__c,ParentEmail__c,ParentUrl__c | {SavedValue:ChildFlexTable2.dfn},ChildCheckbox__c,ChildUrl__c,ChildEmail__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildCheckbox__c,GrandChildUrl__c,GrandChildEmail__c |

  @550005 @550005_1
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Actions- New
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | filterId         |
      | Page Block            | Is Active           | true                                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | ApiGeneratedId:3 |
      | Flex Table Action     | Location            | Top                                   | ApiGeneratedId:4 |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid                      | ApiGeneratedId:5 |
      | Flex Table Action     | Location            | Top                                   | ApiGeneratedId:6 |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid                      | ApiGeneratedId:7 |
      | Flex Table Action     | Location            | Top                                   | ApiGeneratedId:8 |
      | Flex Table Action     | Refresh Behavior    | Refresh the grid                      | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active           | true                            | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>           | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameChild>      | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldNameGrandChild> | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table Action            | Location            | Top                             | TestAutomationFlexTable1 | Name                      | New                                 |
      | Flex Table Action            | Refresh Behavior    | Refresh the grid                | TestAutomationFlexTable1 | Name                      | New                                 |
      | Flex Table Action            | Location            | Top                             | TestAutomationFlexTable2 | Name                      | New                                 |
      | Flex Table Action            | Refresh Behavior    | Refresh the grid                | TestAutomationFlexTable2 | Name                      | New                                 |
      | Flex Table Action            | Location            | Top                             | TestAutomationFlexTable3 | Name                      | New                                 |
      | Flex Table Action            | Refresh Behavior    | Refresh the grid                | TestAutomationFlexTable3 | Name                      | New                                 |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    #Parent grid
    Then I softly can see top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
   #Child grid table
    Then I softly can see top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Child Record" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly can see top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                     | NewDisplayFieldNameChild                              | NewDisplayFieldNameGrandChild                                   |
      | SPI3  | ParentCurrencyTest__c,{SavedValue:ParentFlexTable1.dfn} | ChildCurrencyTest__c,{SavedValue:ChildFlexTable2.dfn} | GrandChildCurrencyTest__c,{SavedValue:GrandChildFlexTable3.dfn} |

  @550005 @550005_2
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Actions- New
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                     | filterId         |
      | Page Block            | Is Active            | true                                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ParentFlexTable1.dfn}     | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ChildFlexTable2.dfn}      | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names  | {SavedValue:GrandChildFlexTable3.dfn} | ApiGeneratedId:3 |
      | Flex Table Action     | Location             | Top                                   | ApiGeneratedId:4 |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:5 |
      | Flex Table Action     | Location             | Top                                   | ApiGeneratedId:6 |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:7 |
      | Flex Table Action     | Location             | Top                                   | ApiGeneratedId:8 |
      | Flex Table Action     | Hide Expression JSON |                                       | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                               | ServiceAreaGrantor       | Name                      | {SavedValue:gridpageblockforpmuser} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>              | TestAutomationFlexTable1 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameChild>         | TestAutomationFlexTable2 |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNameGrandChild>    | TestAutomationFlexTable3 |                           |                                     |
      | Flex Table Action            | Location             | Top                                | TestAutomationFlexTable1 | Name                      | New                                 |
      | Flex Table Action            | Hide Expression JSON | <Hide Expression JSON Parent>      | TestAutomationFlexTable1 | Name                      | New                                 |
      | Flex Table Action            | Location             | Top                                | TestAutomationFlexTable2 | Name                      | New                                 |
      | Flex Table Action            | Hide Expression JSON | <Hide Expression JSON Child>       | TestAutomationFlexTable2 | Name                      | New                                 |
      | Flex Table Action            | Location             | Top                                | TestAutomationFlexTable3 | Name                      | New                                 |
      | Flex Table Action            | Hide Expression JSON | <Hide Expression JSON Grand Child> | TestAutomationFlexTable3 | Name                      | New                                 |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    #Parent grid
    Then I softly cannot see top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
   #Child grid table
    Then I softly cannot see top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Child Record" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    Then I softly cannot see top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName               | NewDisplayFieldNameChild         | NewDisplayFieldNameGrandChild         | Hide Expression JSON Parent                              | Hide Expression JSON Child                                | Hide Expression JSON Grand Child                               |
      | SPI3  | {SavedValue:ParentFlexTable1.dfn} | {SavedValue:ChildFlexTable2.dfn} | {SavedValue:GrandChildFlexTable3.dfn} | govgrants_config:HETActionLevelButtonForSPIProf          | govgrants_config:HideColumnJsonChildTableProfileInForSPI3 | govgrants_config:HideColumnJsonGrandChildTableProfileInForSPI3 |
      | SPI3  | {SavedValue:ParentFlexTable1.dfn} | {SavedValue:ChildFlexTable2.dfn} | {SavedValue:GrandChildFlexTable3.dfn} | govgrants_config:ROCJUserTypeInApplicantForParentForSPI3 | govgrants_config:ROCJUserTypeInApplicantForChildForSPI3   | govgrants_config:ROCJUserTypeInApplicantForGrandChild          |

  @550018 @gridcomponent
  Scenario Outline: 3.0- FlexGrid  Enhanced- SPI-  Quick Search Scenarios- Numeric Data Type (Number, Currency & Percent)
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    #Parent grid
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
      | SPI3  | {SavedValue:ParentFlexTable1.dfn},ParentNumberTest__c,ParentNumberTest1__c | {SavedValue:ChildFlexTable2.dfn},ChildNumberTest__c,ChildNumberTest1__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildNumberTest__c,GrandChildNumberTest1__c |

  @550017 @gridcomponent
  Scenario Outline: 3.0- FlexGrid  Enhanced- SPI-  Quick Search Scenarios- Picklist, Multiselect Picklist & Lookup field Data Types
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
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
      | SPI3  | {SavedValue:ParentFlexTable1.dfn},ParentPicklist__c,ParentLookup__c | {SavedValue:ChildFlexTable2.dfn},ChildPicklist__c,ChildLookup__c | {SavedValue:GrandChildFlexTable3.dfn},GrandChildPicklist__c,GrandChildLookup__c |

  @550015 @gridcomponent
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- Quick Search Scenarios- Standard, Formula, Reference & all Text (Text, Text Area, Long Text Area & Rich Text Area) data type fields
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
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    #Parent grid table
    And I perform quick search for "ParentTextTestColumnValue" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentTextTestColumnValue" for title "ParentText" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentTextAreaColumnValue" for title "ParentTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentLongTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentLongTextAreaColumnValue" for title "ParentLongTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentLongTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentLongTextAreaColumnValue" for title "ParentRichTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentTextTestColumn" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentTextTestColumnValue" for title "ParentText" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentTextAreaColumn" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentTextAreaColumnValue" for title "ParentTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentLongTextAreaColumn" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentLongTextAreaColumnValue" for title "ParentLongTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "ParentLongTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "ParentLongTextAreaColumnValue" for title "ParentRichTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "dummyParent#$^TextCTest" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "zzzzzz&*" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Automation PM KK" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Autom@#$^" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    #Child grid table
    And I perform quick search for "ChildTextColumnValue" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildTextColumnValue" for title "ChildText" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildTextAreaColumnValue" for title "ChildTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildLongTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildLongTextAreaColumnValue" for title "ChildLongTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildLongTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildLongTextAreaColumnValue" for title "ChildRichTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildTextColumn" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildTextColumnValue" for title "ChildText" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildTextAreaColumn" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildTextAreaColumnValue" for title "ChildTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildLongTextAreaColumn" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildLongTextAreaColumnValue" for title "ChildLongTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "ChildLongTextAreaColumn" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see value "ChildLongTextAreaColumnValue" for title "ChildRichTextArea" inside table "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "dummyParent#$^TextCTest" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "zzzzzz&*" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Automation PM KK" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Autom@#$^" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    #GrandChild grid table
    And I perform quick search for "GrandChildTextColumnValue" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildTextColumnValue" for title "GrandChildText" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildTextAreaColumnValue" for title "GrandChildTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildLongTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildLongTextAreaColumnValue" for title "GrandChildLongTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildRichTextAreaColumnValue" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildRichTextAreaColumnValue" for title "GrandChildRichTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildTextColumn" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildTextColumnValue" for title "GrandChildText" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildTextAreaColumn" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildTextAreaColumnValue" for title "GrandChildTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildLongTextAreaColum" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildLongTextAreaColumnValue" for title "GrandChildLongTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildRichTextAreaColumn" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildRichTextAreaColumnValue" for title "GrandChildRichTextArea" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "GrandChildText" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see value "GrandChildTextColumnValue" for title "GrandChildText" inside table "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "Test@#GrandChildText" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "TESTAutomation" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I perform quick search for "Fake2314op32test" in "---flexgrid:-:TestAutomationFlexTable3---" panel
    Then I softly see "No Records Found" inside flex table with id "---flexgrid:-:TestAutomationFlexTable3---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                     | NewDisplayFieldNameChild                                                                                           | NewDisplayFieldNameGrandChild                                                                                                               |
      | SPI3  | ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,CreatedBy,{SavedValue:ParentFlexTable1.dfn} | ChildText__c,ChildTextArea__c,ChildLongTextArea__c,ChildRichTextArea__c,CreatedBy,{SavedValue:ChildFlexTable2.dfn} | GrandChildText__c,GrandChildTextArea__c,GrandChildLongTextArea__c,GrandChildRichTextArea__c,CreatedBy,{SavedValue:GrandChildFlexTable3.dfn} |