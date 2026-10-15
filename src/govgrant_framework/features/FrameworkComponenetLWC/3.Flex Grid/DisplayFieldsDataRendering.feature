@DisplayFieldsDataRendaring-Component @regression-LWC @DisplayFieldsDataRendaringLWC @flexgrid @FlexGrid
Business Need: Display fields and Data Rendering Component Scenarios
  Test all Display fields and Data Rendering Scenarios
  As a configuration manager I make different configurational changes in SendEmailLWC component and will validate them.

  @307684 @307685 @307687 @307689 @307691 @307695 @307766 @307767 @307773 @307774 @307775 @307776
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render text (data type) field in parent table
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render text area (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render long text area (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'rich text area' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'number' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'currency' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'text' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'text area' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'long text area' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'rich text area' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'number' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'currency' (data type) field in parent table|
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
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNames> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
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
      | Users | NewDisplayFieldNames                                                                                                                                  |
      | PM    | ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c,{flexgrid:ParentFlexTable1.dfn} |

  @307699 @307702 @307703 @307705 @307708 @307710 @307777 @307778 @307779 @307780 @307781 @307782
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'Date' (data type) field in parent table
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'Date/time' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'percentage' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'formula' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render' lookup' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'picklist '(data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'Date' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'Date/time' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'percentage' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'formula' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render' lookup' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'picklist '(data type) field in parent table|
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
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}       |
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
    Then I softly see "ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                                            |
      | PM    | ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c,ParentLookup__c,ParentPicklist__c,{flexgrid:ParentFlexTable1.dfn} |

  @307712 @307714 @307716 @307783 @307785 @307784
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'checkbox' (data type) field in parent table
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'reference' (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render 'Standard field' in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render checkbox (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render Standard field in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render 'reference' (data type) field in parent table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:AwardTypeReferancefield} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Eligibility Category Name" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Award Type" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                            |
      | PM    | ParentCheckbox__c,Name,Program__r.AwardType__c,{flexgrid:ParentFlexTable1.dfn} |

  @307786 @307787 @307971 @307972 @307974 @308038
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render Multi-select Picklist field in parent table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render Multi-select Picklist field in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that value of number field display in configured length (18,0) in parent table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that value of number field display in configured length (18,0) in parent table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that value of currency field display in configured length (18, 0) in parent table|
  | LWC-E-grid-Parent_Displayfields_PM_To verify that value of currency field display in configured length (18, 0) in parent table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest2__c}   |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c}  |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see "Test Multi Picklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest2" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                               |
      | PM    | Test_Multi_Picklist__c,ParentNumberTest2__c,ParentCurrencyTest__c,{flexgrid:ParentFlexTable1.dfn} |

  @307791 @307792 @307812 @307813 @307814 @307815 @307973
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render text (data type) field in parent table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render text area (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render long text area (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render rich text area (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render number (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render currency (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that value of number field display in configured length (18, 0) in parent table|
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
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldNames> | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentText__c}         |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                        | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "ParentText" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentLongTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentRichTextArea" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentNumberTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"

    Examples:
      | Users | NewDisplayFieldNames                                                                                                                                  |
      | SPI3  | ParentText__c,ParentTextArea__c,ParentLongTextArea__c,ParentRichTextArea__c,ParentNumberTest__c,ParentCurrencyTest__c,{flexgrid:ParentFlexTable1.dfn} |

  @307816 @307817 @307818 @307819 @307820 @307821
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render Date (data type) field in parent table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render Date/time (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render percentage (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render formula (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render lookup (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render picklist (data type) field in parent table|
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
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}           |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c}    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}         |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    Then I softly see "ParentDate" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentDateTime" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPercentageTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentFormulaTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentLookup" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentPicklist" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                                            |
      | SPI3  | ParentDate__c,ParentDateTime__c,ParentPercentageTest__c,ParentFormulaTest__c,ParentLookup__c,ParentPicklist__c,{flexgrid:ParentFlexTable1.dfn} |

  @307822 @307823 @307824 @307825 @308041
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render checkbox (data type) field in parent table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render reference (data type) field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render Standard field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render Multi-select Picklist field in parent table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that value of currency field display in configured length (18, 0) in parent table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                            | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn} |                    | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                 |                    | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}       |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                    |
      | Flex Table List              | Field Label Override |                       | TestAutomationFlexTable1 | Name                      | {flexgrid:AwardTypeReferancefield} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I pause execution for "3" seconds
    Then I softly see "ParentCheckbox" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Eligibility Category Name" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "Award Type" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see "ParentCurrencyTest" in flex table header "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                  |
      | SPI3  | ParentCheckbox__c,Name,Program__r.AwardType__c,ParentCurrencyTest__c,{flexgrid:ParentFlexTable1.dfn} |

  @308772 @308773 @308783 @308784 @308786 @308787 @308806 @308807
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of text field (for example "test") in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of text field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of text area field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of text area field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of long text area field (for example "test long text...") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of long text area field (for example "test long text...") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of rich text area field (for example "test rich text...") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of rich text area field (for example "test rich text...") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentTextArea__c}     |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLongTextArea__c} |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentRichTextArea__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "---flexgrid:-:TestAutomationFlexGrid1---" by clicking "New" :
      | ParentTextArea      | ParentLongTextArea      | ParentRichTextArea      | Category Name        | Category Number | Category Description      |
      | ParentTextArea test | ParentLongTextArea test | ParentRichTextArea test | Test Category test 2 | 1               | Category Description test |
    Then I softly see value "ParentTextArea test" for title "ParentTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "ParentLongTextArea test" for title "ParentLongTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "ParentRichTextArea test" for title "ParentRichTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Category Description test" for title "Category Description" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName             |
      | PM    | {flexgrid:ParentFlexTable1.all} |

  @308810 @308811 @308813 @308814 @308817 @308818 @308821 @308822
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Number field (for example "123") in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Number field (for example "123") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Currency field (for example "$123.00") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Currency field (for example "$123.00") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Date field (for example "29/03/2023") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Date field (for example "29/03/2023") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Date/time field in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Date/time field in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}         |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}     |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "$10" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "9/25/2024" for title "ParentDate" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "9/25/2024, 03:57 PM" for title "ParentDateTime" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                       |
      | PM    | ParentNumberTest__c,ParentCurrencyTest__c,ParentDate__c,ParentDateTime__c,{flexgrid:ParentFlexTable1.dfn} |

  @308812 @308815 @308819 @308823
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Number field (for example "123") in a table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Currency field (for example "$123.00") in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Date field (for example "29/03/2023") in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Date/time field in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                         |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                  |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c}   |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCurrencyTest__c} |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDate__c}         |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentDateTime__c}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "$10" for title "ParentCurrencyTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "9/25/2024" for title "ParentDate" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "9/25/2024, 06:57 PM" for title "ParentDateTime" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                       |
      | SPI3  | ParentNumberTest__c,ParentCurrencyTest__c,ParentDate__c,ParentDateTime__c,{flexgrid:ParentFlexTable1.dfn} |

  @308825 @308826 @308829 @308830 @308832 @308833 @308837 @308838
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Percentage field (for example "50%") in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Percentage field (for example "50%") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Formula(text) field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Formula(text) field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of lookup field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of lookup field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of picklist field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of picklist field (for example "test") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                        |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c} |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}      |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}    |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10.00" for title "ParentFormulaTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Cat-0300" for title "ParentLookup" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "ParentPL10" for title "ParentPicklist" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                                            |
      | PM    | ParentPercentageTest__c,ParentFormulaTest__c,ParentLookup__c,ParentPicklist__c,{flexgrid:ParentFlexTable1.dfn} |

  @308825 @3088261
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Percentage field (for example "50%") in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Percentage field (for example "50%") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10%" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                     |
      | PM    | ParentPercentageTest__c,{flexgrid:ParentFlexTable1.dfn} |

  @308827 @308831 @308839
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Percentage field (for example "50%") in a table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Formula(text) field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of picklist field (for example "test") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                           |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                    |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPercentageTest__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10%" for title "Parent Percentage Test" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                     |
      | SPI3  | ParentPercentageTest__c,{flexgrid:ParentFlexTable1.dfn} |

  @308831 @308839
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Formula(text) field (for example "test") in a table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of picklist field (for example "test") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                        |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                 |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentFormulaTest__c} |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentLookup__c}      |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPicklist__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10.00" for title "ParentFormulaTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Cat-0300" for title "ParentLookup" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "ParentPL10" for title "ParentPicklist" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                    |
      | SPI3  | ParentFormulaTest__c,ParentLookup__c,ParentPicklist__c,{flexgrid:ParentFlexTable1.dfn} |

  @308851 @308852 @308870 @308871 @308878 @308879 @308882 @308883
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of checkbox field (for example "true/false" i.e. tickmark/cross) in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of checkbox field (for example "true/false") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of reference field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of reference field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of standard field (for example "EGMS Id") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of standard field (for example "EGMS Id") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Multi-select picklist field (for example "test1;test2") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Multi-select picklist field (for example "test1;test2") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                   |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}      |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "Cat-0001" for title "Eligibility Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "True" for title "ParentCheckbox" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Option 1" for title "Test Multi Picklist" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                           |
      | PM    | ParentCheckbox__c,Test_Multi_Picklist__c,Name,{flexgrid:ParentFlexTable1.dfn} |

  @308853 @308872 @308880 @308884
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of checkbox field (for example "true/false") in a table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of reference field (for example "test") in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of standard field (for example "EGMS Id") in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Multi-select picklist field (for example "test1;test2") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                          |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                   |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Name}                   |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentCheckbox__c}      |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Multi_Picklist__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "Cat-0001" for title "Eligibility Category Name" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "True" for title "ParentCheckbox" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Option 1" for title "Test Multi Picklist" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                           |
      | SPI3  | ParentCheckbox__c,Test_Multi_Picklist__c,Name,{flexgrid:ParentFlexTable1.dfn} |

  @308894 @308895 @308911 @308912 @308914 @308915 @308917 @308918 @308926 @308927 @308930 @308931
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render Email (data type) field in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render Email (data type) field in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render Phone (data type) field in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render Phone (data type) field in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render URL (data type) field in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render URL (data type) field in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of URL field (for example "www.google.com") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of URL field (for example "www.google.com") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Email field (for example "test@gmail.com") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Email field (for example "test@gmail.com") in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see data of Phone field (for example "9876543210") in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see data of Phone field (for example "9876543210") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                            |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "(101) 010-1010" for title "ParentPhone" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "www.google.com" for title "Test Multi Picklist" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                        |
      | PM    | ParentEmail__c,ParentPhone__c,ParentUrl__c,{flexgrid:ParentFlexTable1.dfn} |

  @308913 @308916 @308919 @308928 @308932
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render Phone (data type) field in a table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render URL (data type) field in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Email field (for example "test@gmail.com") in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of Phone field (for example "9876543210") in a table|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to see data of URL field (for example "www.google.com") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                            |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentEmail__c}  |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentPhone__c}  |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentUrl__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "parentemail@yopmail.com" for title "ParentEmail" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "(101) 010-1010" for title "ParentPhone" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "www.google.com" for title "Test Multi Picklist" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                        |
      | SPI3  | ParentEmail__c,ParentPhone__c,ParentUrl__c,{flexgrid:ParentFlexTable1.dfn} |

  @308943 @308944 @309028 @309029 @309043 @309044
  Scenario Outline:LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to render Standard lookup (data type) field in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to render Standard lookup (data type) field in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that value of number field display in configured length (16,2) in parent table (for example, 100.02)|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that value of number field display in configured length (16,2) in parent table (for example, 100.02)|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that value of Currency field display in configured length (16,2) in parent table (for example, $100.02)|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that value of Currency field display in configured length (16,2) in parent table (for example, $100.02)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Lookup__c}      |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c} |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Currency__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "$10.00" for title "Test Currency" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Lookup" for title "Test Lookup" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                 |
      | PM    | Test_Lookup__c,ParentNumberTest__c,Test_Currency__c,{flexgrid:ParentFlexTable1.dfn} |


  @308945 @309030 @309045
  Scenario Outline: LWC-E-grid-Parent_Displayfields_SPI_To verify that user is able to render Standard lookup (data type) field in a table
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that value of number field display in configured length (16,2) in parent table (for example, 100.02)|
  |LWC-E-grid-Parent_Displayfields_SPI_To verify that value of Currency field display in configured length (16,2) in parent table (for example, $100.02)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | coreComponentField | filterId         |
      | Page Block            | Is Active            | true                                              | ServiceAreaGrantor | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ParentFlexTable1.dfn}                   |                    | ApiGeneratedId:1 |
      | Flex Table            | Filter Criteria      | Category_Number__c >0 and Category_Number__c < 50 |                    | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                                   |                    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail | Is Active            | true                                             | ServiceAreaGrantor       | Name                      | PB-13951                       |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                            | TestAutomationFlexTable1 |                           |                                |
      | Flex Table:General           | Filter Criteria      | Category_Number__c >0 and Category_Number__c <50 | TestAutomationFlexTable1 |                           |                                |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Lookup__c}      |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:ParentNumberTest__c} |
      | Flex Table List              | Field Label Override |                                                  | TestAutomationFlexTable1 | Name                      | {flexgrid:Test_Currency__c}    |
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    When I pause execution for "5" seconds
    And I perform quick search for "Test Category 1" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    Then I softly see value "10" for title "ParentNumberTest" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "$10.00" for title "Test Currency" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Lookup" for title "Test Lookup" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Examples:
      | Users | NewDisplayFieldName                                                                 |
      | SPI3  | Test_Lookup__c,ParentNumberTest__c,Test_Currency__c,{flexgrid:ParentFlexTable1.dfn} |

  @309048 @309049 @309101 @309102
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see Negative data of Number field (for example -123) in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see Negative data of Number field (for example -123) in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see whole text entered in Long text area field, in respective long text area column in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see whole text entered in Long text area field, in respective long text area column in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                  | Grantor State Program      | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Justification                       | RSnumber | Step Order | Description                         | Step Name | Step Weight (%) |
      | {flexgrid:char10000forLongTextArea} | -550     | 4          | {flexgrid:char10000forLongTextArea} | StepTest  | 0               |
    Then I softly see value "(550.00)" for title "RSnumber" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "{flexgrid:char10000forLongTextArea}" for title "Justification" inside table "---program:-:reviewStepTableId---"
    Examples:
      | Users | NewDisplayFieldName                                                    |
      | PM    | Justification__c,RSnumber__c,{flexgrid:ReviewStepsParentGridTable.dfn} |

  @309104 @309105
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see whole text entered in Rich text area field, in respective rich text area column in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see whole text entered in Rich text area field, in respective rich text area column in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                  | Grantor State Program      | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Description                         | Step Name | Step Weight (%) |
      | 4          | {flexgrid:char10000forLongTextArea} | StepTest  | 0               |
    Then I softly see value "{flexgrid:char10000forLongTextArea}" for title "Description" inside table "---program:-:reviewStepTableId---"
    Examples:
      | Users | NewDisplayFieldName                       |
      | PM    | {flexgrid:ReviewStepsParentGridTable.dfn} |

  @309122 @309123 @309125 @309126
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see whole text entered in text area field, in respective text area column in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see whole text entered in text area field, in respective text area column in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see whole text entered in text field, in respective text column in a table|
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see whole text entered in text field, in respective text column in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active            | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                  | Grantor State Program      | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                  |
      | Flex Table List              | Field Label Override |                       | ProgramReviewStepTemplates | Name                      | {flexgrid:AutTestName__c}        |
      | Flex Table List              | Field Label Override |                       | ProgramReviewStepTemplates | Name                      | {flexgrid:RecallComment__c}      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Description      | AutTestName        | X_Recall Comment   | Step Order | Step Name | Step Weight (%) |
      | test Description | {flexgrid:char255} | {flexgrid:char255} | 4          | StepTest  | 0               |
    Then I softly see value "{flexgrid:char255}" for title "AutTestName" inside table "---program:-:reviewStepTableId---"
    Examples:
      | Users | NewDisplayFieldName                                                       |
      | PM    | AutTestName__c,RecallComment__c,{flexgrid:ReviewStepsParentGridTable.dfn} |

  @309133 @309134 @309139 @309140
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see alphanumeric values with sp.charcters, in respective text column in a table
  | LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see alphanumeric values with sp.charcters, in respective text column in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see maximum/highest number data of currency field (for example $100,000,000,000,000,000.00) in a table|
  |LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see maximum/highest number data of currency field (for example $100,000,000,000,000,000.00) in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active            | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | Grantor State Program      | Name                      | {flexgrid:StepReviewPageBlockId}   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                    |
      | Flex Table List              | Field Label Override |                       | ProgramReviewStepTemplates | Name                      | {flexgrid:RecallComment__c}        |
      | Flex Table List              | Field Label Override |                       | ProgramReviewStepTemplates | Name                      | {flexgrid:RSParentCurrencyTest__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | X_Recall Comment             | RSParentCurrencyTest | Step Order | Description                  | Step Name | Step Weight (%) |
      | {flexgrid:AlphanumericValue} | 1234512345123456     | 4          | {flexgrid:AlphanumericValue} | StepTest  | 0               |
    #309133 #309134
    Then I softly see value "{flexgrid:AlphanumericValue}" for title "X_Recall Comment" inside table "---program:-:reviewStepTableId---"
    #309136 #309137
    Then I softly see value "$1,234,512,345,123,456.00" for title "RSParentCurrencyTest" inside table "---program:-:reviewStepTableId---"
    Examples:
      | Users | NewDisplayFieldName                                                                |
      | PM    | RecallComment__c,RSParentCurrencyTest__c,{flexgrid:ReviewStepsParentGridTable.dfn} |

  @309136 @309137
  Scenario Outline: LWC-E-grid-Parent_Displayfields_Admin_To verify that user is able to see alphanumeric values with sp.charcters, in respective text area column in a table
  |LWC-E-grid-Parent_Displayfields_PM_To verify that user is able to see alphanumeric values with sp.charcters, in respective text area column in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active            | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block:Page Block Detail | Is Active            | true                  | Grantor State Program      | Name                      | {flexgrid:StepReviewPageBlockId}   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName> | ProgramReviewStepTemplates |                           |                                    |
      | Flex Table List              | Field Label Override |                       | ProgramReviewStepTemplates | Name                      | {flexgrid:AutTestName__c}          |
      | Flex Table List              | Field Label Override |                       | ProgramReviewStepTemplates | Name                      | {flexgrid:RecallComment__c}        |
      | Flex Table List              | Field Label Override |                       | ProgramReviewStepTemplates | Name                      | {flexgrid:RSParentCurrencyTest__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | AutTestName                  | Step Order | Description                  | Step Name | Step Weight (%) |
      | {flexgrid:AlphanumericValue} | 4          | {flexgrid:AlphanumericValue} | StepTest  | 0               |
    #309136 #309137
    Then I softly see value "{flexgrid:AlphanumericValue}" for title "AutTestName" inside table "---program:-:reviewStepTableId---"
    Examples:
      | Users | NewDisplayFieldName                                      |
      | PM    | AutTestName__c,{flexgrid:ReviewStepsParentGridTable.dfn} |

  @310215 @310216 @310218 @310219 @310221 @310222 @310224 @310225
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render text (data type) field in Child table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render text (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render text area (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render text area (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render long text area (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render long text area (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render Rich text area (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render Rich text area (data type) field in Child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active            | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active            | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFChildTextArea__c}    |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFLongTextArea__c}     |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFRichTextArea__c}     |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see "Form Name" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "RFChildTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "RFLongTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "RFRichTextArea" in flex table header "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                             |
      | PM    | RFChildTextArea__c,RFLongTextArea__c,RFRichTextArea__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310227 @310228 @310230 @310231 @310233 @310234 @310236 @310237
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'number' (data type) field in Child table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'number' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'currency' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'currency' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'Date' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'Date' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'Date/time' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'Date/time' (data type) field in Child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active            | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId}  |
      | Flex Table:General           | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                   |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                   |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFChildNumberTest__c}   |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFChildCurrencyTest__c} |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFChildDate__c}         |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFChildDateTime__c}     |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see "RFChildNumberTest" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "RFChildCurrencyTest" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "RFChildDate" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "RFChildDateTime" in flex table header "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                                                    |
      | PM    | RFChildNumberTest__c,RFChildCurrencyTest__c,RFChildDate__c,RFChildDateTime__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310239 @310240 @310242 @310243 @310245 @310246 @310248 @310249
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'percentage' (data type) field in Child table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'percentage' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'formula' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'formula' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render' lookup' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render' lookup' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'picklist '(data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'picklist '(data type) field in Child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active            | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                           |                       | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block:Page Block Detail | Is Active            | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId}    |
      | Flex Table:General           | Display Field Names  | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                     |
      | Flex Table:General           | Display Field Names  | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                     |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFChildPercentageTest__c} |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFChildCurrencyTest__c}   |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:RFLookupField__c}         |
      | Flex Table List              | Field Label Override |                                           | ProgramReviewStepPanelTemplates | Name                      | {flexgrid:ReviewResponseShared__c}  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see "RFChildPercentageTest" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "Weighted Score" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "Program" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "Review Response Shared" in flex table header "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                                 |
      | PM    | RFChildPercentageTest__c,WeightedScore__c,RFLookupField__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310251 @310252 @310257 @310258 @310260 @310261
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'checkbox' (data type) field in Child table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'checkbox' (data type) field in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render 'Standard field' in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render 'Standard field' in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render Multi-select Picklist field in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render Multi-select Picklist field in Child table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see "Required?" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "Created By ID" in flex table header "---program:-:reviewFormPanelId---"
    Then I softly see "ReviewFormMultiSelectPicklist" in flex table header "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                 |
      | PM    | CreatedBy,ReviewFormMultiSelectPicklist__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310263 @310264 @310266 @310267 @310310 @310311 @310313 @310314 @310333 @310334
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that value of number field display in configured length (18,0) in Child table
  |LWC-E-grid-Child_Displayfields_PM_To verify that value of number field display in configured length (18,0) in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that value of currency field display in configured length (18, 0) in Child table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that value of currency field display in configured length (18, 0) in Child table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of text field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of text field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of text area field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of text area field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Currency field (for example "$123.00") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Currency field (for example "$123.00") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFChildCurrencyTest | RFChildTextArea | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | 111222333444555666  | text area       | Form Test | 10              | 100                                       | Check     | Yes                    |
    #310263 #310264
    Then I softly see value "100" for title "Minimum Number of Reviews per Application" inside table "---program:-:reviewFormPanelId---"
    #310266 #310267 #310333 #310334
    Then I softly see value "$111,222,333,444,555,664" for title "RFChildCurrencyTest" inside table "---program:-:reviewFormPanelId---"
   #310310 #310311
    Then I softly see value "Form Test" for title "Form Name" inside table "---program:-:reviewFormPanelId---"
    #310313 #310314
    Then I softly see value "text area" for title "RFChildTextArea" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                |
      | PM    | RFChildCurrencyTest__c,RFChildTextArea__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310316 @310317 @310322 @310323
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of long text area field (for example "test long text...") in a table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of long text area field (for example "test long text...") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of rich text area field (for example "test rich text...") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of rich text area field (for example "test rich text...") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                                                            | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn}                                       | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | RFLongTextArea__c,RFChildNumberTest__c,{flexgrid:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFLongTextArea | RFChildNumberTest | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test           | 100               | Form Test | 10              | 100                                       | Check     | Yes                    |
    #310316 #310317
    Then I softly see value "Test" for title "RFLongTextArea" inside table "---program:-:reviewFormPanelId---"
   #310322 #310323
    Then I softly see value "100" for title "RFChildNumberTest" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users |
      | PM    |

  @310326 @310327 @310479 @310480 @310505 @310506
  Scenario Outline:  LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Number field (for example "123") in a table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Number field (for example "123") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Date field (for example "29/03/2023") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Date field (for example "29/03/2023") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Percentage field (for example "50%") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Percentage field (for example "50%") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFRichTextArea | Form Due Date | RFChildPercentageTest | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test           | 11/23/2028    | 50%                   | Form Test | 10              | 100                                       | Check     | Yes                    |
    And I pause execution for "5" seconds
   #310326 #310327
    Then I softly see value "Test" for title "RFRichTextArea" inside table "---program:-:reviewFormPanelId---"
   #310479 #310480
    Then I softly see value "11/23/2028" for title "Form Due Date" inside table "---program:-:reviewFormPanelId---"
    #310505 #310506
    Then I softly see value "50%" for title "RFChildPercentageTest" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                            |
      | PM    | RFRichTextArea__c,EndDate__c,RFChildPercentageTest__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310482 @310483 @310603 @310610
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Date/time field (for example "29/03/2023") in a table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Date/time field (for example "29/03/2023") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Multi-select picklist field (for example "test1;test2") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Multi-select picklist field (for example "test1;test2") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFChildDateTime        | ReviewFormMultiSelectPicklist | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dec 31, 2024, 02:30 AM | Test3                         | Form Test | 10              | 100                                       | Check     | Yes                    |
    Then I softly see value "Dec 31, 2024, 02:30 AM" for title "RFChildDateTime" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "test1" for title "ReviewFormMultiSelectPicklist" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                          |
      | PM    | RFChildDateTime__c,ReviewFormMultiSelectPicklist__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310512 @310513 @310517 @310518 @310534 @310535 @310585 @310586
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Formula(text) field (for example "test") in a table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Formula(text) field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of lookup field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of lookup field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of picklist field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of picklist field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of checkbox field (for example "true/false" i.e. tickmark/cross) in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of checkbox field (for example "true/false") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    When I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | OrganizationTest        | PicklistTest | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Test With Automation PM | Test1        | Form Test | 10              | 10                                        | Check     | Yes                    |
    And I pause execution for "5" seconds
    Then I softly see value "Pre-Screen Review" for title "Review Step Name" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "Test With Automation PM" for title "OrganizationTest" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "Test1" for title "PicklistTest" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "True" for title "Required?" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                            |
      | PM    | ReviewStepName__c,OrganizationTest__c,PicklistTest__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310590 @310591 @310594 @310595 @310596 @310611 @310613 @310614 @310624 @310625 @310628 @310629
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of reference field (for example "test") in a table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of reference field (for example "test") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of standard field (for example "EGMS Id") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of standard field (for example "EGMS Id") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render Email (data type) field in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render Email (data type) field in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render Phone (data type) field in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render Phone (data type) field in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Email field (for example "test@gmail.com") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Email field (for example "test@gmail.com") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Phone field (for example "9876543210") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Phone field (for example "9876543210") in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    When I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFChildEmail        | RFChildPhone | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | reisyst@yopmail.com | 2342342342   | Form Test | 10              | 10                                        | Check     | Yes                    |
    Then I softly see value "Automation PM" for title "Created By ID" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "reisyst@yopmail.com" for title "RFChildEmail" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "(234) 234-2342" for title "RFChildPhone" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                |
      | PM    | CreatedBy,RFChildEmail__c,RFChildPhone__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310616 @310617 @310632 @310633 @310661 @310662 @310664 @310665 @310684 @310685
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render URL (data type) field in a table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render URL (data type) field in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of URL field (for example "www.google.com") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of URL field (for example "www.google.com") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to render Standard lookup (data type) field in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to render Standard lookup (data type) field in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see data of Standard lookup field (for example "Created By") in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see data of Standard lookup field (for example "Created By") in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that value of number field display in configured length (16,2) in Child table (for example, 100.02)|
  |LWC-E-grid-Child_Displayfields_PM_To verify that value of number field display in configured length (16,2) in Child table (for example, 100.02)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    When I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFChildUrl       | RFChildNumberTest1 | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | www.facebook.com | 100.25             | Form Test | 10              | 10                                        | Check     | Yes                    |
    Then I softly see value "www.facebook.com" for title "RFChildEmail" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "Automation PM" for title "Created By ID" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "100.25" for title "RFChildNumberTest1" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                    |
      | PM    | RFChildUrl__c,CreatedBy,RFChildNumberTest1__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310687 @310688 @310699 @310700 @310730 @310731
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that value of Currency field display in configured length (16,2) in Child table (for example, $100.02)
  |LWC-E-grid-Child_Displayfields_PM_To verify that value of Currency field display in configured length (16,2) in Child table (for example, $100.02)|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see Negative data of Number field (for example -123) in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see Negative data of Number field (for example -123) in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see whole text entered in Long text area field, in respective long text area column in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see whole text entered in Long text area field, in respective long text area column in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    When I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFChildCurrency1 | RFChildNumberTest | RFLongTextArea      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | 425.43           | -123              | {flexgrid:LTA32768} | Form Test | 10              | 10                                        | Check     | Yes                    |
    Then I softly see value "$425.43" for title "RFChildCurrency1" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "(123)" for title "RFChildNumberTest" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "{flexgrid:LTA32768}" for title "RFLongTextArea" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                                                                 |
      | PM    | RFChildCurrency1__c,RFChildNumberTest__c,RFLongTextArea__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310736 @310737
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see whole text entered in Rich text area field, in respective rich text area column in a table
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see whole text entered in Rich text area field, in respective rich text area column in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    When I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFRichTextArea      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | {flexgrid:LTA32768} | Form Test | 10              | 10                                        | Check     | Yes                    |
    Then I softly see value "{flexgrid:LTA32768}" for title "RFRichTextArea" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                        |
      | PM    | RFRichTextArea__c,{flexgrid:ReviewFormsChildGridTable.dfn} |

  @310741 @310742 @310744 @310745
  Scenario Outline: LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see whole text entered in text area field, in respective text area column in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see whole text entered in text area field, in respective text area column in a table|
  |LWC-E-grid-Child_Displayfields_Admin_To verify that user is able to see whole text entered in text field, in respective text column in a table|
  |LWC-E-grid-Child_Displayfields_PM_To verify that user is able to see whole text entered in text field, in respective text column in a table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | coreComponentField    | filterId         |
      | Page Block            | Is Active           | true                                      | Grantor State Program | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} |                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {flexgrid:ReviewFormsChildGridTable.dfn}  |                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block:Page Block Detail | Is Active           | true                                      | Grantor State Program           | Name                      | {flexgrid:StepReviewPageBlockId} |
      | Flex Table:General           | Display Field Names | {flexgrid:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates      |                           |                                  |
      | Flex Table:General           | Display Field Names | <NewDisplayFieldName>                     | ProgramReviewStepPanelTemplates |                           |                                  |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    When I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | RFChildTextArea    | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | {flexgrid:char255} | Form Test | 10              | 10                                        | Check     | Yes                    |
    Then I softly see value "Form Test" for title "Form Name" inside table "---program:-:reviewFormPanelId---"
    Then I softly see value "{flexgrid:char255}" for title "RFChildTextArea" inside table "---program:-:reviewFormPanelId---"
    Examples:
      | Users | NewDisplayFieldName                                         |
      | PM    | RFChildTextArea__c,{flexgrid:ReviewFormsChildGridTable.dfn} |