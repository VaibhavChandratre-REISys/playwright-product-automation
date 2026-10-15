@DetailsConfigParent-Component @regression-LWC @DetailsConfigParentLWC @flexgrid @FlexGrid
Business Need: Details config Parent Component Scenarios
  Test all Details config Parent Component Scenarios
  As a configuration manager I make different configurational changes in SendEmailLWC component and will validate them.

  @314387 @314388 @314390 @314391 @314393 @314394 @314396 @314397 @314469 @314470 @314472 @314473
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Text field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Text field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Long Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Long Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Rich Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Rich Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Number field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Number field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Currency field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Currency field, which have been provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                                                                                                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                                                                                                                                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | {flexgrid:ParentFlexTable1.dfn},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override | FLO ParentText                                                                                                                                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override | FLO ParentTextArea                                                                                                                                    | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override | FLO ParentLongTextArea                                                                                                                                | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override | FLO ParentRichTextArea                                                                                                                                | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override | FLO ParentNumberTest                                                                                                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override | FLO ParentCurrencyTest                                                                                                                                | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "FLO ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users |
      | PM    |

  @314389 @314392 @314395 @314398 @314471 @314474
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Text field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Long Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Rich Text area field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Number field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Currency field, which have been provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                   | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>  | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override | FLO ParentText         | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override | FLO ParentTextArea     | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override | FLO ParentLongTextArea | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override | FLO ParentRichTextArea | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override | FLO ParentNumberTest   | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override | FLO ParentCurrencyTest | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I see "FLO ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see "FLO ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see "FLO ParentLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see "FLO ParentRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see "FLO ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see "FLO ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                                                   |
      | SPI3  | {flexgrid:ParentFlexTable1.dfn},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |


  @314478 @314479 @314481 @314482 @314489 @314490 @314492 @314493
  Scenario Outline:LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Date field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Date field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Date/Time field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Date/Time field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Percentage field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Percentage field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Formula field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Formula field, which have been provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                     | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>    | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override | FLO ParentDate           | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override | FLO ParentDateTime       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override | FLO ParentPercentageTest | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override | FLO ParentFormulaTest    | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "FLO ParentDate" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentDateTime" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                          |
      | PM    | {flexgrid:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c |

  @314480 @314483 @314491 @314494
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Date field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Date/Time field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Percentage field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Formula field, which have been provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                     | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>    | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override | FLO ParentDate           | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override | FLO ParentDateTime       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override | FLO ParentPercentageTest | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override | FLO ParentFormulaTest    | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "FLO ParentDate" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentDateTime" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                          |
      | SPI3  | {flexgrid:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c |

  @314497 @314500 @314503
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Lookup field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Picklist field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Checkbox field, which have been provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                              |
      | Flex Table List              | Field Label Override | FLO ParentLookup      | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}   |
      | Flex Table List              | Field Label Override | FLO ParentPicklist    | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c} |
      | Flex Table List              | Field Label Override | FLO ParentCheckbox    | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "FLO ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                 |
      | SPI3  | {flexgrid:ParentFlexTable1.dfn},ParentLookup__c,ParentPicklist__c,ParentCheckbox__c |

  @314523 @314526 @314529 @314532 @314535
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Standard field, which have been provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Multi-select Picklist field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Email field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Phone field, which have been provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a URL field, which have been provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                          | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>         | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override | FLO Eligibility Category Name | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                   |
      | Flex Table List              | Field Label Override | FLO Test_Multi_Picklist       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override | FLO ParentEmail               | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Field Label Override | FLO ParentPhone               | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Field Label Override | FLO ParentUrl                 | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "FLO Eligibility Category Name" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO Test_Multi_Picklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO ParentUrl" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                    |
      | SPI3  | {flexgrid:ParentFlexTable1.dfn},Name,Test_Multi_Picklist__c,ParentEmail__c,ParentPhone__c,ParentUrl__c |

  @314551 @314552 @314554 @314555 @314557 @314558 @314560 @314561 @314585 @314586 @314588 @314589
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Text field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Text field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Long Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Long Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Rich Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Rich Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Number field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Number field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Currency field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Currency field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                                                   |
      | PM    | {flexgrid:ParentFlexTable1.dfn},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314553 @314556 @314559 @314562 @314587 @314590
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Text field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Long Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Rich Text Area field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Number field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Currency field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                                                   |
      | SPI3  | {flexgrid:ParentFlexTable1.dfn},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314591 @314592 @314594 @314595 @314603 @314604 @314606 @314607
  Scenario Outline:LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Date field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Date field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Date/Time field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Date/Time field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Percentage field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Percentage field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Formula field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Formula field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "ParentDate" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentDateTime" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Parent Percentage Test" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                          |
      | PM    | {flexgrid:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c |

  @314593 @314596 @314605 @314608
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Date field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Date/Time field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Percentage field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Formula field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "ParentDate" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentDateTime" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Parent Percentage Test" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                          |
      | SPI3  | {flexgrid:ParentFlexTable1.dfn},ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c |

  @314609 @314610 @314656 @314657 @314659 @314660
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Lookup field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Lookup field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Picklist field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Picklist field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Checkbox field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Checkbox field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I softly see "ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                 |
      | PM    | {flexgrid:ParentFlexTable1.dfn},ParentLookup__c,ParentPicklist__c,ParentCheckbox__c |

  @314611 @314658 @314661
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Lookup field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Picklist field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Checkbox field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                 |
      | SPI3  | {flexgrid:ParentFlexTable1.dfn},ParentLookup__c,ParentPicklist__c,ParentCheckbox__c |

  @314686 @314687 @314689 @314689 @314690 @314692 @314693 @314695 @314696 @314698
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Standard field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Standard field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Multi-select picklist field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Multi-select picklist field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Email field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Email field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a Phone field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a Phone field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see column name of a URL field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see column name of a URL field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "Eligibility Category Name" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Test Multi Picklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentUrl" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                            |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},Name,Test_Multi_Picklist__c,ParentEmail__c,ParentPhone__c,ParentUrl__c |

  @314688 @314691 @314694 @314697 @314700
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Standard field from "Field label" at object level, when its not provided in "Field Label Override" config
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Multi-select picklist field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a Email field from "Field label" at object level, when its not provided in "Field Label Override" config|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to see column name of a URL field from "Field label" at object level, when its not provided in "Field Label Override" config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "Eligibility Category Name" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Test Multi Picklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentEmail" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPhone" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentUrl" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                            |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},Name,Test_Multi_Picklist__c,ParentEmail__c,ParentPhone__c,ParentUrl__c |

  @314701 @314702 @314704 @314705 @314707 @314708 @314710 @314711 @314713 @314714 @314716 @314717
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter characters only in "Field Label Override" config, and it get displayed as a column name of respective field
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter characters only in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter digits only in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter digits only in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter alphanumeric values in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter alphanumeric values in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter alphanumeric values with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter alphanumeric values with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter characters with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter characters with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter digits with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter digits with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override | ChARactorRsZXM        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override | 1234567890            | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override | Override2024          | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override | !@#$%^&*              | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override | FLO!@#$%^&*           | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override | 123456@#$%^&*         | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "ChARactorRsZXM" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "1234567890" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Override2024" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "!@#$%^&*" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO!@#$%^&*" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "123456@#$%^&*" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                                                           |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314703 @314706 @314709 @314712 @314715 @314718
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter characters only in "Field Label Override" config, and it get displayed as a column name of respective field
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter digits only in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter alphanumeric values in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter characters with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter digits with sp.characters in "Field Label Override" config, and it get displayed as a column name of respective field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override | ChARactorRsZXM        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override | 1234567890            | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override | Override2024          | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override | !@#$%^&*              | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override | FLO!@#$%^&*           | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override | 123456@#$%^&*         | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see "ChARactorRsZXM" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "1234567890" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Override2024" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "!@#$%^&*" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "FLO!@#$%^&*" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "123456@#$%^&*" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                                                           |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314724 @314725 @314727 @314728 @314730 @314731 @314733 @314734 @314737 @314738 @314740
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Text field/column name/label, when user provided help text in config for respective column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Text field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Long Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Long Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Rich Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Rich Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Number field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Number field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Currency field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Currency field/column name/label, when user provided help text in config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see Help icon i is displayed beside the "ParentText__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentTextArea__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentLongTextArea__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentRichTextArea__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentNumberTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentCurrencyTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                                                           |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314726 @314729 @314732 @314735 @314739 @314741 @314742
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Text field/column name/label, when user provided help text in config for respective column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Long Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Rich Text area field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Number field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Currency field/column name/label, when user provided help text in config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see Help icon i is displayed beside the "ParentText__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentTextArea__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentLongTextArea__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentRichTextArea__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentNumberTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentCurrencyTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                                                           |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314743 @314744 @314746 @314747 @314762 @314763 @314765 @314766 @314768 @314769 @314771 @314772
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Date field/column name/label, when user provided help text in config for respective column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Date field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Date/time field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Date/time field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Percentage field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Percentage field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Formula field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Lookup field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Lookup field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Picklist field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Picklist field/column name/label, when user provided help text in config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}       |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see Help icon i is displayed beside the "ParentDate__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentDateTime__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentPercentageTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "parentlookup__r" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentPicklist__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                                                    |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c,ParentLookup__c,ParentPicklist__c |

  @314745 @314748 @314764 @314767 @314770 @314773
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Date field/column name/label, when user provided help text in config for respective column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Date/time field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Percentage field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Formula field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Lookup field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Picklist field/column name/label, when user provided help text in config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see Help icon i is displayed beside the "ParentDate__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentDateTime__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentPercentageTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentFormulaTest__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "parentlookup__r" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentPicklist__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldName                                                                                                                                    |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c,ParentLookup__c,ParentPicklist__c |

  @314774 @314775 @314777 @314780 @314781 @314783 @314784 @314786 @314787 @314789 @314790 @314792 @314793 @314799 @314800
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Checkbox field/column name/label, when user provided help text in config for respective column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Checkbox field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Standard field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Standard field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Email field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Email field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides Phone field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides Phone field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that Help icon get displayed besides URL field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that Help icon get displayed besides URL field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}      |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}              |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}      |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I softly see Help icon i is displayed beside the "Name" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentCheckbox__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentEmail__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentPhone__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentUrl__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldName                                                                                       |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},Name,ParentCheckbox__c,ParentEmail__c,ParentPhone__c,ParentUrl__c |

  @314776 @314782 @314785 @314788 @314791 @314794
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Checkbox field/column name/label, when user provided help text in config for respective column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Standard field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Multi-select picklist field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Email field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides Phone field/column name/label, when user provided help text in config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that Help icon get displayed besides URL field/column name/label, when user provided help text in config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}      |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}              |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}      |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    Then I softly see Help icon i is displayed beside the "Name" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentCheckbox__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentEmail__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentPhone__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see Help icon i is displayed beside the "ParentUrl__c" column inside table id "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldName                                                                                       |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},Name,ParentCheckbox__c,ParentEmail__c,ParentPhone__c,ParentUrl__c |

  @314799 @314800 @314802 @314803 @314805 @314806
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text Area column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text Area column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Long Text Area column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Long Text Area column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentText__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentTextArea__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentLongTextArea__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentRichTextArea__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentNumberTest__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCurrencyTest__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                                     |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314808 @314809 @314816 @314817
  Scenario Outline:   LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Rich Text Area column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Rich Text Area column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Number column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Number column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentText__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentRichTextArea__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentNumberTest__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCurrencyTest__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                                                                                           |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314801 @314804 @314807
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Text Area column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Long Text Area column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentText__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentTextArea__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentLongTextArea__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                           |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentText__c,ParentTextArea__c,ParentLongTextArea__c |

  @314810 @314818
  Scenario Outline:   LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Rich Text Area column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Number column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId          |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0  |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:7  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9  |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:10 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:11 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:12 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:13 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentRichTextArea__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentNumberTest__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCurrencyTest__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                                     |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c |

  @314819 @314820 @314822 @314823
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Currency column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Currency column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Date column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Date column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCurrencyTest__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentDate__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                                                   |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentCurrencyTest__c,ParentDate__c,ParentDateTime__c,ParentPercentageTest__c |

  @314825 @314826 @314873 @314874
  Scenario Outline:   LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Date/Time column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Date/Time column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Percentage column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Percentage column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentDateTime__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPercentageTest__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                               |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentDateTime__c,ParentPercentageTest__c |


  @314824 @314824
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Currency column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Date column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCurrencyTest__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentDate__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                                                   |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentCurrencyTest__c,ParentDate__c,ParentDateTime__c,ParentPercentageTest__c |

  @314827 @314875
  Scenario Outline:
  LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Date/Time column/field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentDateTime__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPercentageTest__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                               |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentDateTime__c,ParentPercentageTest__c |

  @314876 @314877 @314879 @314880
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Formula column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Formula column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Lookup column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Lookup column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                        |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}      |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}      |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}    |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentFormulaTest__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "parentlookup"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPicklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCheckbox__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                                              |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentFormulaTest__c,ParentLookup__c,ParentPicklist__c,ParentCheckbox__c |

  @314883 @314884 @314886 @314887
  Scenario Outline:
  LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Picklist column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Picklist column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Checkbox column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Checkbox column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPicklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCheckbox__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                         |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentPicklist__c,ParentCheckbox__c |

  @314878 @314881
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Formula column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Lookup column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                        |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}      |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}      |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}    |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPicklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCheckbox__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                          |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentFormulaTest__c,ParentLookup__c |

  @314885 @314888
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Picklist column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Checkbox column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                              |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPicklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentCheckbox__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                         |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},ParentPicklist__c,ParentCheckbox__c |

  @314889 @314890 @314892 @314893
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Reference column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Reference column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Standard column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Standard column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                        |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                 |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                 |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}      |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Name"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Name"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                               |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},Name,Name |

  @314895 @314896 @314898 @314899
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Multi-select picklist column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Multi-select picklist column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Email column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Email column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Test_Multi_Picklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                      |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentPicklist__c,ParentEmail__c |

  @314891 @314894 @314897 @314900
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Reference column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Standard column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Multi-select picklist column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Email column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}   |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}        |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Name"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Name"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Test_Multi_Picklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "Automation help text" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                |
      | SPI3  | {flexgrid:ParentFlexTable1.forhelptext},Name,Name,ParentPicklist__c,ParentEmail__c |

  @314901 @314902 @314904 @314905 @314977 @314978 @314980 @314981
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Phone column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Phone column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that on hovering over Help icon, Help text provided from config get displayed of respective URL column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that on hovering over Help icon, Help text provided from config get displayed of respective URL column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter only characters in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter only characters in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter only digits in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter only digits in a help text config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Help Text            | 8888888888            | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPhone__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentUrl__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Test_Multi_Picklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "8888888888" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                                  |
      | PM    | {flexgrid:ParentFlexTable1.forhelptext},ParentPhone__c,ParentUrl__c,ParentPicklist__c,ParentEmail__c |

  @314903 @314906
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective Phone column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that on hovering over Help icon, Help text provided from config get displayed of respective URL column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Help Text            | 8888888888            | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Test_Multi_Picklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "8888888888" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                         |
      | SPI3  | ParentPhone__c,ParentUrl__c,{flexgrid:ParentFlexTable1.dfn} |

  @314979 @314982
  Scenario Outline:LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter only characters in a help text config for respective column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter only digits in a help text config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:9 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
      | Flex Table List              | Help Text            | Automation help text  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Help Text            | 8888888888            | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}         |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "Test_Multi_Picklist__c"
    Then I softly see "Automation help text" shown as help text
    And I refresh the page
    And click on vertical Collapse button
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "8888888888" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                              |
      | SPI3  | ParentPicklist__c,ParentEmail__c,{flexgrid:ParentFlexTable1.dfn} |

  @314983 @314984 @314986 @314987 @314989 @314990 @314992 @314993
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter only alphanumeric values in a help text config for respective column/field
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter only alphanumeric values in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter Characters with sp.characters values in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter Characters with sp.characters values in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter Digits with sp.characters values in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to enter Digits with sp.characters values in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to enter alphanumeric with sp.characters values in a help text config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                            |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
      | Flex Table List              | Help Text            | 88AA77zz33HH          | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Help Text            | P@ssw0rd!2024         | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
      | Flex Table List              | Help Text            | 0!12@34#56            | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPhone__c"
    Then I softly see "88AA77zz33HH" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentUrl__c"
    Then I softly see "P@ssw0rd!2024" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "0!12@34#56" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                |
      | PM    | ParentPhone__c,ParentUrl__c,ParentEmail__c,{flexgrid:ParentFlexTable1.forhelptext} |

  @314985 @314988 @314991
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter only alphanumeric values in a help text config for respective column/field
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter Characters with sp.characters values in a help text config for respective column/field|
  |LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter Digits with sp.characters values in a help text config for respective column/field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                            |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
      | Flex Table List              | Help Text            | 88AA77zz33HH          | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Help Text            | P@ssw0rd!2024         | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
      | Flex Table List              | Help Text            | A1b@34#               | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPhone__c"
    Then I softly see "88AA77zz33HH" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentUrl__c"
    Then I softly see "P@ssw0rd!2024" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "A1b@34#" shown as help text
    Examples:
      | Users | NewDisplayFieldName                                                                |
      | SPI3  | ParentPhone__c,ParentUrl__c,ParentEmail__c,{flexgrid:ParentFlexTable1.forhelptext} |

  @314995 @314996 @314998 @314999
  Scenario: abc
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see and select value from dropdown, for the Picklist field, when user selected Render type - "Select dropdown"|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see and select value by autosuggest, for the Picklist field, when user selected Render type - "Autosuggest"|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see and select value by autosuggest, for the Picklist field, when user selected Render type - "Autosuggest"|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    Then I see only the following ordered options in dropdown field "ProgramRole__c" :
      | Step 1 | Step 2 | Step 3 | Step 4 | NA |

  @315004 @315005 @315007 @315008 @315010 @315011 @315013 @315014 @315019 @315020
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Text field
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Text field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Text Area field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Text Area field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Long Text Area field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Long Text Area field|
  |  LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Rich Text Area field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Rich Text Area field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Formula field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Formula field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                      | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:2 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:3 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:4 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:5 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block:Page Block Detail | Is Active           | true                  | ServiceAreaGrantor         | Name                      | PB-13951                             |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                      |
      | Flex Table List              | Show Link as Text   | true                  | ProgramReviewStepTemplates | Name                      | {flexgrid:ApplicationAssignment__c}  |
      | Flex Table List              | Show Link as Text   | true                  | ProgramReviewStepTemplates | Name                      | {flexgrid:AutTestName__c}            |
      | Flex Table List              | Show Link as Text   | true                  | ProgramReviewStepTemplates | Name                      | {flexgrid:Justification__c}          |
      | Flex Table List              | Show Link as Text   | true                  | ProgramReviewStepTemplates | Name                      | {flexgrid:ReviewStepsDescription__c} |
      | Flex Table List              | Show Link as Text   | true                  | ProgramReviewStepTemplates | Name                      | {flexgrid:RoleCode__c}               |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | X_Application Assignment | AutTestName      | Justification     | Step Order | Description   | Step Name | Step Weight (%) |
      | www.google.com           | www.facebook.com | www.instagram.com | 4          | www.yahoo.com | Test Auto | 0               |
    Then I softly see value "www.google.com" for title "X_Application Assignment" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "www.facebook.com" for title "AutTestName" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "www.instagram.com" for title "Justification" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "www.yahoo.com" for title "Description" inside table "---program:-:reviewStepTableId---"
    Then I softly do not see hyperlink at column value "www.google.com" inside "---program:-:reviewStepTableId---" table
    Then I softly do not see hyperlink at column value "www.facebook.com" inside "---program:-:reviewStepTableId---" table
    Then I softly do not see hyperlink at column value "www.instagram.com" inside "---program:-:reviewStepTableId---" table
    Then I softly do not see hyperlink at column value "www.yahoo.com" inside "---program:-:reviewStepTableId---" table
    Then I softly do not see hyperlink at column value "TestAutomationOrganization" inside "---program:-:reviewStepTableId---" table

    Examples:
      | Users | NewDisplayFieldName                                                                                            |
      | PM    | ApplicationAssignment__c,AutTestName__c,Justification__c,RoleCode__c,{flexgrid:ReviewStepsParentGridTable.dfn} |

  @314994
  Scenario Outline: LWC-E-grid-DetailsConfig_SPI_To verify that user is able to enter alphanumeric with sp.characters values in a help text config for respective column/field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:5 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:6 |
      | Flex Table List       | Help Text            |                                 |                    | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                            |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
      | Flex Table List              | Help Text            | 88AA77zz33HH          | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Help Text            | P@ssw0rd!2024         | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
      | Flex Table List              | Help Text            | 0!12@34#56            | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentPhone__c"
    Then I softly see "88AA77zz33HH" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentUrl__c"
    Then I softly see "P@ssw0rd!2024" shown as help text
    And I refresh the page
    When I hovering mouse on page block help text icon inside table "---flexgrid:-:TestAutomationFlexGrid1---" with tooltip id "ParentEmail__c"
    Then I softly see "0!12@34#56" shown as help text

    Examples:
      | Users | NewDisplayFieldName                                                                |
      | SPI3  | ParentPhone__c,ParentUrl__c,ParentEmail__c,{flexgrid:ParentFlexTable1.forhelptext} |

  @315022 @315023 @315028 @315029 @315034 @315035 @315037 @315038
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Lookup field
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Lookup field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Picklist field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see plain text instead of Link/field/column, when "Show link as a Text" config is enabled for Picklist field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Text field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Text field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Text Area field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Text Area field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                      | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:2 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:3 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:4 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:5 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail | Is Active           | true                  | ServiceAreaGrantor         | Name                      | PB-13951                    |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                             |
      | Flex Table List              | Show Link as Text   | true                  | ProgramReviewStepTemplates | Name                      | {flexgrid:Organization__c}  |
      | Flex Table List              | Show Link as Text   | true                  | ProgramReviewStepTemplates | Name                      | {flexgrid:Status__c}        |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:RecallComment__c} |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:AutTestName__c}   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | X_Agency            | Status      | X_Recall Comment  | AutTestName   | Step Order | Description   | Step Name | Step Weight (%) | # of Panels |
      | Department of State | In Progress | www.instagram.com | www.yahoo.com | 4          | www.yahoo.com | Test Auto | 1               | 1           |
    Then I softly do not see hyperlink at column value "Department of State" inside "---program:-:reviewStepTableId---" table
    Then I softly do not see hyperlink at column value "In Progress" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "www.instagram.com" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "www.yahoo.com" inside "---program:-:reviewStepTableId---" table

    Examples:
      | Users | NewDisplayFieldName                                                                                 |
      | PM    | Organization__c,Status__c,RecallComment__c,AutTestName__c,{flexgrid:ReviewStepsParentGridTable.dfn} |

  @315040 @315041 @315043 @315044 @315054 @315055 @315057 @315058
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Long Text Area field
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Long Text Area field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Rich Text Area field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Rich Text Area field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Formula field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Formula field|
  |LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Lookup field|
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Lookup field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                      | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:2 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:3 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:4 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:5 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block:Page Block Detail | Is Active           | true                  | ServiceAreaGrantor         | Name                      | PB-13951                             |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                      |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:Justification__c}          |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:ReviewStepsDescription__c} |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:RoleCode__c}               |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:AutTestName__c}            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Justification  | B_Role Code | AutTestName   | Step Order | Description   | Step Name | Step Weight (%) | # of Panels |
      | www.google.com |             | www.yahoo.com | 4          | www.yahoo.com | Test Auto | 1               | 1           |
    Then I softly see hyperlink at column value "www.google.com" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "TestAutomationOrganization" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "www.instagram.com" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "www.yahoo.com" inside "---program:-:reviewStepTableId---" table

    Examples:
      | Users | NewDisplayFieldName                                                                   |
      | PM    | Justification__c,RoleCode__c,AutTestName__c,{flexgrid:ReviewStepsParentGridTable.dfn} |

  @315063 @315064
  Scenario Outline: LWC-E-grid-DetailsConfig_Admin_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Picklist field
  |LWC-E-grid-DetailsConfig_PM_To verify that user is able to see Hyperlink for the respective Link/field/column, when "Show link as a Text" config is disabled for Picklist field|

    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField | filterId         |
      | Page Block            | Is Active           | true                                      | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:2 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:3 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:4 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:5 |
      | Flex Table List       | Show Link as Text   | false                                     |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block:Page Block Detail | Is Active           | true                  | ServiceAreaGrantor         | Name                      | PB-13951                             |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                      |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:LinkPicklist__c}           |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:ReviewStepsDescription__c} |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:RoleCode__c}               |
      | Flex Table List              | Show Link as Text   | false                 | ProgramReviewStepTemplates | Name                      | {flexgrid:AutTestName__c}            |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | LinkPicklist    | B_Role Code | AutTestName   | Step Order | Description   | Step Name | Step Weight (%) | # of Panels |
      | www.example.com |             | www.yahoo.com | 4          | www.yahoo.com | Test Auto | 1               | 1           |
    Then I softly see hyperlink at column value "www.google.com" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "TestAutomationOrganization" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "www.instagram.com" inside "---program:-:reviewStepTableId---" table
    Then I softly see hyperlink at column value "www.yahoo.com" inside "---program:-:reviewStepTableId---" table

    Examples:
      | Users | NewDisplayFieldName                                                                  |
      | PM    | LinkPicklist__c,RoleCode__c,AutTestName__c,{flexgrid:ReviewStepsParentGridTable.dfn} |
