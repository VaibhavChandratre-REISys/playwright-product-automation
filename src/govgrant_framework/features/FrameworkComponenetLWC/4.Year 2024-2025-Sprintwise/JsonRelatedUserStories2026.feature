@AprilReleaseUserStory1 @Sprint-2026 @JsonRelatedUserStories2026

Feature: Support to hide logic on the basis of user stories requirments
Business Need: In this user story framework will provide support to hide fiels,hide page block, page tab
1.@US-FW-1541


  @US-FW-1541 @FW-1542 @FW-1542_1 @FW-1546
  Scenario Outline:TC - LWC - Layout - PM - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
  |TC - LWC - Layout - PM - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}                          |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}                          |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Phone Number" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Phone Number" inside page block

    Examples:
      | Users | hideLogic                                                   | sheetName                   |
      | PM    | govgrants_config:whileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:whileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:whileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:whileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:whileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:whileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1542 @FW-1542_2 @FW-1546
  Scenario Outline:TC - LWC - Layout - PM - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
  |TC - LWC - Layout - PM - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}                          |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}                          |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly cannot see field "Phone Number" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Phone Number" inside page block

    Examples:
      | Users | hideLogic                                        | sheetName                   |
      | PM    | govgrants_config:whileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:whileOneValueSelectNotIn        | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:whileOneValueSelectEXCLUDES     | OneValueDIRECTLOAN          |


  @US-FW-1541 @FW-1542 @FW-1543_1 @FW-1547
  Scenario Outline: TC - LWC - Layout - PM - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
  |TC - LWC - Layout - PM - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}                      |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}                      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I wait for "10" seconds
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly do not see field "Abbreviation__c" is in disabled mode
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Abbreviation__c" is in disabled mode

    Examples:
      | Users | hideLogic                                                          | sheetName                   |
      | PM    | govgrants_config:disablewhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:disablewhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:disablewhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:disablewhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:disablewhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:disablewhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1543 @FW-1543_2 @FW-1547
  Scenario Outline: TC - LWC - Layout - PM - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
  |TC - LWC - Layout - PM - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}                      |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}                      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Abbreviation__c" is in disabled mode
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "Abbreviation__c" is in disabled mode

    Examples:
      | Users | hideLogic                                               | sheetName                   |
      | PM    | govgrants_config:disablewhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:disablewhileOneValueSelectNotIn        | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:disablewhileOneValueSelectEXCLUDES     | OneValueDIRECTLOAN          |

  @US-FW-1541 @FW-1545 @FW-1545_1
  Scenario Outline:TC - LWC - Layout - PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only        | false             | Grantor State Program | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Read Only        | false         | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Atomation Test" into field "Audits__c"
    Then I softly see field "Audits__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "Audits__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                                        | sheetName                   |
      | PM    | govgrants_config:blankwhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:blankwhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:blankwhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:blankwhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:blankwhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:blankwhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1545 @FW-1545_2
  Scenario Outline:TC - LWC - Layout - PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only        | false             | Grantor State Program | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Read Only        | false         | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Atomation Test" into field "Audits__c"
    Then I softly see field "Audits__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "Audits__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                             | sheetName                   |
      | PM    | govgrants_config:blankwhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1545 @FW-1545_3
  Scenario Outline:TC - LWC - Layout - PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only        | false             | Grantor State Program | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Read Only        | false         | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Atomation Test" into field "Audits__c"
    Then I softly see field "Audits__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Audits__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                         | sheetName          |
      | PM    | govgrants_config:blankwhileOneValueSelectNotIn    | OneValueDIRECTLOAN |
      | PM    | govgrants_config:blankwhileOneValueSelectEXCLUDES | OneValueDIRECTLOAN |

  @US-FW-1541 @FW-1545 @FW-1545_4
  Scenario Outline:TC - LWC - Layout - PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only        | false             | Grantor State Program | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
      | Page Block Config:Page Block Rule Detail | Read Only        | false         | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}                      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Atomation Test" into field "Audits__c"
    Then I softly see field "Audits__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Audits__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                      | sheetName          |
      | PM    | govgrants_config:blankwhileOneValueSelectNotIn | OneValueDIRECTLOAN |

  @US-FW-1541 @FW-1548 @FW-1548_1
  Scenario Outline: TC - LWC - Layout - PM - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Phone Number" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Phone Number" inside page block

    Examples:
      | Users | hideLogic                                                   | sheetName         |
      | PM    | govgrants_config:whileOneValueSelectIn                      | TypeOfAssiLastTwo |
      | PM    | govgrants_config:whileThreeValueSelectIncludes              | TypeOfAssiLastTwo |
      | PM    | govgrants_config:whileThreeValueSelectEqualToCommaseparated | TypeOfAssiLastTwo |
      | PM    | govgrants_config:whileThreeValueSelectSemicolonseparated    | TypeOfAssiLastTwo |
      | PM    | govgrants_config:whileThreeValueSelectMixeddelimiters       | TypeOfAssiLastTwo |

  @US-FW-1541 @FW-1548 @FW-1548_1
  Scenario Outline: TC - LWC - Layout - PM - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Phone Number" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Phone Number" inside page block

    Examples:
      | Users | hideLogic                                     | sheetName                   |
      | PM    | govgrants_config:whileThreeValueSelectEqualTo | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1548 @FW-1548_2
  Scenario Outline: TC - LWC - Layout - PM - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Authorization" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Authorization" inside page block

    Examples:
      | Users | hideLogic                                        | sheetName                   |
      | PM    | govgrants_config:whileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:whileOneValueSelectNotIn        | TypeOfAssiLastTwo           |
      | PM    | govgrants_config:whileOneValueSelectEXCLUDES     | TypeOfAssiLastTwo           |

  @US-FW-1541 @FW-1549 @FW-1549_1
  Scenario Outline:TC - LWC - Layout - PM - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true              | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization}                 |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Authorization" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Authorization" inside page block

    Examples:
      | Users | hideLogic                                                           | sheetName                   |
      | PM    | govgrants_config:INCLUDESwhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:INCLUDESwhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:INCLUDESwhileThreeValueSelectEqualToCommaseparated | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:INCLUDESwhileThreeValueSelectSemicolonseparated    | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:INCLUDESwhileThreeValueSelectMixeddelimiters       | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:INCLUDESwhileThreeValueSelectIncludes              | OneValueDIRECTLOAN          |

  @US-FW-1541 @FW-1550 @FW-1551 @FW-1553 @FW-1550_1 @FW-1551_1
  Scenario Outline: TC - LWC - Layout - PM - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.
  |TC - LWC - Layout - PM - To verify that, user should be able to see Hide field when single matching value selected|
  |TC - LWC - Layout - PM - To verify that, user should not be able to see the field when ANY matching value exists among the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:ResearchProgram__c}                          |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:ResearchProgram__c}                          |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "X_Research Program" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "X_Research Program" inside page block

    Examples:
      | Users | hideLogic                                                                     | sheetName                   |
      | PM    | govgrants_config:ResearchProgram__cwhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:ResearchProgram__cwhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:ResearchProgram__cwhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:ResearchProgram__cwhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:ResearchProgram__cwhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:ResearchProgram__cwhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1550 @FW-1551 @FW-1553 @FW-1550_2 @FW-1551_2 @FW-1553_2
  Scenario Outline: TC - LWC - Layout - PM - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.
  |TC - LWC - Layout - PM - To verify that, user should be able to see Hide field when single matching value selected|
  |TC - LWC - Layout - PM - To verify that, user should not be able to see the field when ANY matching value exists among the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program | Name                      | {SavedValue:CreateProgramPageLayoutTypesOfAssistance__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program | Name                      | {SavedValue:ResearchProgram__c}                          |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program | Name                      | {SavedValue:ResearchProgram__c}                          |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly cannot see field "X_Research Program" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "X_Research Program" inside page block

    Examples:
      | Users | hideLogic                                                          | sheetName                   |
      | PM    | govgrants_config:ResearchProgram__cwhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:ResearchProgram__cwhileOneValueSelectNotIn        | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:ResearchProgram__cwhileOneValueSelectEXCLUDES     | OneValueDIRECTLOAN          |

  @US-FW-1541 @FW-1581_1
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | fale              | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program        | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program        | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program        | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "X_Related Progams" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "X_Related Progams" inside page block

    Examples:
      | Users | hideLogic                                                                    | sheetName                   |
      | PM    | govgrants_config:RelatedProgams__cwhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cwhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:RelatedProgams__cwhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cwhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cwhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cwhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1581_2
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see field "X_Related Progams" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "X_Related Progams" inside page block

    Examples:
      | Users | hideLogic                                                         | sheetName                   |
      | PM    | govgrants_config:RelatedProgams__cwhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cwhileOneValueSelectNotIn        | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:RelatedProgams__cwhileOneValueSelectEXCLUDES     | OneValueDIRECTLOAN          |

  @US-FW-1541 @FW-1582
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see field "RelatedProgams__c" is in disabled mode
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "RelatedProgams__c" is in disabled mode

    Examples:
      | Users | hideLogic                                                                           | sheetName                   |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-15822
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalRelatedProgams__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "RelatedProgams__c" is in disabled mode
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "RelatedProgams__c" is in disabled mode

    Examples:
      | Users | hideLogic                                                                | sheetName                   |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileOneValueSelectNotIn        | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:RelatedProgams__cdisablewhileOneValueSelectEXCLUDES     | OneValueDIRECTLOAN          |

  @US-FW-1541 @FW-15833
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
  |TC - LWC - Modal - PM - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalFederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalFederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I enter value "Atomation Test" into field "FederalProgramTitle__c"
    Then I softly see field "FederalProgramTitle__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "FederalProgramTitle__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                                                              | sheetName                   |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1583
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalFederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalFederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I enter value "Atomation Test" into field "FederalProgramTitle__c"
    Then I softly see field "FederalProgramTitle__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "FederalProgramTitle__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                                               | sheetName          |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileOneValueSelectNotIn    | OneValueDIRECTLOAN |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileOneValueSelectEXCLUDES | OneValueDIRECTLOAN |

  @US-FW-1541 @FW-1583a
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalFederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalFederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I enter value "Atomation Test" into field "FederalProgramTitle__c"
    Then I softly see field "FederalProgramTitle__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "FederalProgramTitle__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                                                   | sheetName                   |
      | PM    | govgrants_config:FederalProgramTitle__cblankwhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-15833 @FW-1584 @FW-1586 @FW-1585 @FW-1587 @picklistvaluedatatype-US-FW-1541 @FW-1588
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.
  |TC - LWC - Modal - PM - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.|
  |TC - LWC - Modal - PM - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.|
  |TC - LWC - Modal - PM - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  | TC - LWC - Modal - PM - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}          |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}          |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalAlternativeIncomeType__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalAlternativeIncomeType__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "Alternative Income Type" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Alternative Income Type" inside page block

    Examples:
      | Users | hideLogic                                                                           | sheetName                   |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1584 @FW-1584_2 @picklistvaluedatatype-US-FW-1541 @FW-1589
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.
  |TC - LWC - Modal - PM - To verify that, user should be able to see Hide field when single matching value selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}          |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}          |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalAlternativeIncomeType__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalAlternativeIncomeType__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see field "Alternative Income Type" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Alternative Income Type" inside page block

    Examples:
      | Users | hideLogic                                                                | sheetName                   |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileOneValueSelectNotIn        | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:AlternativeIncomeType__cwhileOneValueSelectEXCLUDES     | OneValueDIRECTLOAN          |

  @US-FW-1541 @FW-1590
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should not be able to see the field when ALL configured values selected in the multi-select picklist matches the condition defined in Hide Fields JSON.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}     |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:ModalTest_Description__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:ModalTest_Description__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see field "Test Description" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Test Description" inside page block

    Examples:
      | Users | hideLogic                                                           | sheetName                   |
      | PM    | govgrants_config:Test_Description__cwhileThreeValueSelectNotEqualTo | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:Test_Description__cwhileOneValueSelectNotIn        | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:Test_Description__cwhileOneValueSelectEXCLUDES     | OneValueDIRECTLOAN          |

  @US-FW-1541 @FW-1591
  Scenario Outline: TC - LWC - Modal - PM - To verify that, user should not be able to see the field when ANY matching value exists among the multi-select picklist matches the condition defined in Hide Fields JSON.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField           | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor State Program Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor State Program Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor State Program Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor State Program Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}      |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor State Program Create | Name                      | {SavedValue:TypesOfAssistance__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "Test Description" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Test Description" inside page block

    Examples:
      | Users | hideLogic                                                                      | sheetName                   |
      | PM    | govgrants_config:Test_Description__cwhileThreeValueSelectEqualTo               | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:Test_Description__cwhileOneValueSelectIn                      | OneValueDIRECTLOAN          |
      | PM    | govgrants_config:Test_Description__cwhileThreeValueSelectIncludes              | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:Test_Description__cwhileThreeValueSelectEqualToCommaseparated | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:Test_Description__cwhileThreeValueSelectSemicolonseparated    | ThreeValueSelectTypesOfAssi |
      | PM    | govgrants_config:Test_Description__cwhileThreeValueSelectMixeddelimiters       | ThreeValueSelectTypesOfAssi |

  @US-FW-1541 @FW-1593 @FW-1594
  Scenario Outline: TC - LWC - Modal - SPI - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
  |TC - LWC - Modal - SPI - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor Application Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalAuthorizedRepresentativeTitle__c}  |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalAuthorizedRepresentativeTitle__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    Then I softly see field "Authorized Representative Title" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Authorized Representative Title" inside page block

    Examples:
      | Users | hideLogic                                                  | sheetName                       |
      | SPI3  | govgrants_config:whileFourValueSelectEqualTo               | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:whileOneValueSelectInSPI                  | AppliSectionsforRevision1values |
      | SPI3  | govgrants_config:whileFourValueSelectEqualToCommaseparated | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:whileFourValueSelectSemicolonseparated    | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:whileFourValueSelectMixeddelimiters       | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:whileFourValueSelectIncludes              | AppliSectionsforRevision1values |

  @US-FW-1541 @FW-1593 @FW-1594
  Scenario Outline: TC - LWC - Modal - SPI - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
  |TC - LWC - Modal - SPI - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor Application Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalAuthorizedRepresentativeTitle__c}  |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalAuthorizedRepresentativeTitle__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    Then I softly cannot see field "Authorized Representative Title" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Authorized Representative Title" inside page block

    Examples:
      | Users | hideLogic                                       | sheetName                       |
      | SPI3  | govgrants_config:whileFourValueSelectNotEqualTo | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:whileOneValueSelectNotInMOdal  | AppliSectionsforRevision1values |
      | SPI3  | govgrants_config:whileOneValueSelectEXCLUDESSPI | AppliSectionsforRevision1values |

  @US-FW-1541 @FW-1595
  Scenario Outline: TC - LWC - Modal - SPI - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor Application Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalAuthorizedRepresentativeTitle__c}  |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalAuthorizedRepresentativeTitle__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    Then I softly see field "AuthorizedRepresentativeTitle__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "AuthorizedRepresentativeTitle__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                                                         | sheetName                       |
      | SPI3  | govgrants_config:blankAuthorizedRepresentativeTitle__cwhileFourValueSelectEqualTo | AppliSectionsforRevision4values |
#      | SPI3  | govgrants_config:blankAuthorizedRepresentativeTitle__cwhileOneValueSelectInSPI                  | AppliSectionsforRevision1values |
#      | SPI3  | govgrants_config:blankAuthorizedRepresentativeTitle__cwhileFourValueSelectEqualToCommaseparated | AppliSectionsforRevision4values |
#      | SPI3  | govgrants_config:blankAuthorizedRepresentativeTitle__cwhileFourValueSelectSemicolonseparated    | AppliSectionsforRevision4values |
#      | SPI3  | govgrants_config:blankAuthorizedRepresentativeTitle__cwhileFourValueSelectMixeddelimiters       | AppliSectionsforRevision4values |
#      | SPI3  | govgrants_config:blankAuthorizedRepresentativeTitle__cwhileFourValueSelectIncludes              | AppliSectionsforRevision1values |

  @US-FW-1541 @FW-1596
  Scenario Outline: TC - LWC - Modal - SPI - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor Application Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalSubject__c}                        |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalSubject__c}                        |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I enter value "Atomation Test" into field "Subject__c"
    Then I softly see field "Subject__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "Subject__c" in edit mode contains some text
    Examples:
      | Users | hideLogic                                                      | sheetName                       |
      | SPI3  | govgrants_config:blankSubject__cwhileFourValueSelectNotEqualTo | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:blankSubject__cwhileOneValueSelectNotInMOdal  | NotInAppliSectionsforRevision   |
      | SPI3  | govgrants_config:blankSubject__cwhileOneValueSelectEXCLUDESSPI | NotInAppliSectionsforRevision   |

  @US-FW-1541 @FW-1597 @FW-1598 @FW-1599 @FW-1600 @FW-1601 @FW-1602 @FW-1603
  Scenario Outline: TC - LWC - Modal - SPI - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.
  |TC - LWC - Modal - SPI - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.|
  |TC - LWC - Modal - SPI - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Modal - SPI - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.|
  |TC - LWC - Modal - SPI - To verify that, user should be able to see Hide field when single matching value selected|
  |TC - LWC - Modal - SPI - To verify that, user should not be able to see the field when ALL configured values selected in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Modal - SPI - To verify that, user should not be able to see the field when ANY matching value exists among the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor Application Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor Application Create | Name                      | {SavedValue:ModalApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ModalCoverPageDetail__c}                |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ModalCoverPageDetail__c}                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    Then I softly see field "Application Cover Page" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Application Cover Page" inside page block

    Examples:
      | Users | hideLogic                                                                        | sheetName                       |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectEqualTo               | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileOneValueSelectInSPI                  | AppliSectionsforRevision1values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectEqualToCommaseparated | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectSemicolonseparated    | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectMixeddelimiters       | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectIncludes              | AppliSectionsforRevision1values |

  @US-FW-1541 @FW-1597 @FW-1598 @FW-1599 @FW-1600 @FW-1601 @FW-1602
  Scenario Outline: TC - LWC - Modal - SPI - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.
  |TC - LWC - Modal - SPI - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.|
  |TC - LWC - Modal - SPI - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Modal - SPI - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.|
  |TC - LWC - Modal - SPI - To verify that, user should be able to see Hide field when single matching value selected|
  |TC - LWC - Modal - SPI - To verify that, user should not be able to see the field when ALL configured values selected in the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Grantor Application Create | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Grantor Application Create | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Grantor Application Create | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Grantor Application Create | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Grantor Application Create | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Grantor Application Create | Name                      | {SavedValue:CoverPageDetail__c}                |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Grantor Application Create | Name                      | {SavedValue:CoverPageDetail__c}                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    Then I softly cannot see field "Application Cover Page" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Application Cover Page" inside page block
    Examples:
      | Users | hideLogic                                                             | sheetName                       |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectNotEqualTo | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileOneValueSelectNotIn       | NotInAppliSectionsforRevision   |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileOneValueSelectEXCLUDES    | NotInAppliSectionsforRevision   |

  @US-FW-1541 @FW-1554
  Scenario Outline: TC - LWC - Layout - SPI - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c}                |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c}                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    Then I softly see field "Application Cover Page" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Application Cover Page" inside page block

    Examples:
      | Users | hideLogic                                                                        | sheetName                       |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectEqualTo               | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileOneValueSelectInSPI                  | AppliSectionsforRevision1values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectEqualToCommaseparated | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectSemicolonseparated    | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectMixeddelimiters       | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectIncludes              | AppliSectionsforRevision1values |

  @US-FW-1541 @FW-1555 @FW-1557
  Scenario Outline: TC - LWC - Layout - SPI - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
  |TC - LWC - Layout - SPI - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c}                |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c}                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Application Cover Page" inside page block

    Examples:
      | Users | hideLogic                                                             | sheetName                       |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileFourValueSelectNotEqualTo | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileOneValueSelectNotIn       | NotInAppliSectionsforRevision   |
      | SPI3  | govgrants_config:hideCoverPageDetail__cwhileOneValueSelectEXCLUDES    | NotInAppliSectionsforRevision   |

  @US-FW-1541 @FW-1556 @FW-1560 @FW-1562
  Scenario Outline: TC - LWC - Layout - SPI - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
  |TC - LWC - Layout - SPI - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Layout - SPI - To verify that, user should be able to see Hide field when single matching value selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c}                     |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c}                     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I enter value "Atomation Test" into field "CFDANumber__c"
    Then I softly see field "CFDANumber__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "CFDANumber__c" in edit mode contains some text
    Examples:
      | Users | hideLogic                                                                    | sheetName                       |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectEqualTo               | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileOneValueSelectInSPI                  | AppliSectionsforRevision1values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectEqualToCommaseparated | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectSemicolonseparated    | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectMixeddelimiters       | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectIncludes              | AppliSectionsforRevision1values |

  @US-FW-1541 @FW-1556_2
  Scenario Outline: TC - LWC - Layout - SPI - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c}                     |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c}                     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I enter value "Atomation Test" into field "CFDANumber__c"
    Then I softly see field "CFDANumber__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "CFDANumber__c" in edit mode contains some text
    Examples:
      | Users | hideLogic                                                         | sheetName                       |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectNotEqualTo | AppliSectionsforRevision4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileOneValueSelectNotIn       | NotInAppliSectionsforRevision   |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileOneValueSelectEXCLUDES    | NotInAppliSectionsforRevision   |

  @US-FW-1541 @FW-1558 @FW-1559 @FW-1561
  Scenario Outline: TC - LWC - Layout - SPI - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.
  |TC - LWC - Layout - SPI - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.|
  |TC - LWC - Layout - SPI - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Recipient ApplicationView | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Recipient ApplicationView | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Recipient ApplicationView | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Recipient ApplicationView | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Recipient ApplicationView | Name                      | {SavedValue:ApplicationSectionsForRevision__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c}                     |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Recipient ApplicationView | Name                      | {SavedValue:CFDANumber__c}                     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I enter value "Atomation Test" into field "CFDANumber__c"
    Then I softly see field "CFDANumber__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "CFDANumber__c" in edit mode contains some text
    Examples:
      | Users | hideLogic                                                                    | sheetName                   |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectEqualTo               | UnorderedApplication4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectEqualToCommaseparated | UnorderedApplication4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectSemicolonseparated    | UnorderedApplication4values |
      | SPI3  | govgrants_config:blankCFDANumber__cwhileFourValueSelectMixeddelimiters       | UnorderedApplication4values |

  @US-FW-1541 @FW-1619 @FW-1624
  Scenario Outline:TC - LWC - Forms - SPI - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
  |TC - LWC - Forms - SPI - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}       |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Citizenship" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Citizenship" inside page block

    Examples:
      | Users | hideLogic                                                                    | sheetName  |
      | SPI3  | govgrants_config:hideCitizenship__cwhileFourValueSelectEqualTo               | SAF4Select |
      | SPI3  | govgrants_config:hideCitizenship__cwhileOneValueSelectIn                     | SAF1Select |
      | SPI3  | govgrants_config:hideCitizenship__cwhileFourValueSelectEqualToCommaseparated | SAF4Select |
      | SPI3  | govgrants_config:hideCitizenship__cwhileFourValueSelectSemicolonseparated    | SAF4Select |
      | SPI3  | govgrants_config:hideCitizenship__cwhileFourValueSelectMixeddelimiters       | SAF4Select |
      | SPI3  | govgrants_config:hideCitizenship__cwhileFourValueSelectIncludes              | SAF1Select |

  @US-FW-1541 @FW-1620
  Scenario Outline: TC - LWC - Forms - SPI - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}       |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly cannot see field "Citizenship" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Citizenship" inside page block

    Examples:
      | Users | hideLogic                                                         | sheetName  |
      | SPI3  | govgrants_config:hideCitizenship__cwhileFourValueSelectNotEqualTo | SAF4Select |
      | SPI3  | govgrants_config:hideCitizenship__cwhileOneValueSelectNotIn       | SAF4Select |
      | SPI3  | govgrants_config:hideCitizenship__cwhileOneValueSelectEXCLUDES    | SAF4Select |

  @US-FW-1541 @FW-1621 @FW-1622 @FW-1623
  Scenario Outline: TC - LWC - Forms - SPI- To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
  |TC - LWC - Forms - SPI - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.|
  |TC - LWC - Forms - SPI - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <blankLogic>  | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Atomation Test" into field "ProjectAbstract__c"
    Then I softly see field "ProjectAbstract__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "ProjectAbstract__c" in edit mode contains some text

    Examples:
      | Users | blankLogic                                                                        | sheetName  |
      | SPI3  | govgrants_config:blankProjectAbstract__cwhileFourValueSelectEqualTo               | SAF4Select |
      | SPI3  | govgrants_config:blankProjectAbstract__cwhileOneValueSelectIn                     | SAF1Select |
      | SPI3  | govgrants_config:blankProjectAbstract__cwhileFourValueSelectEqualToCommaseparated | SAF4Select |
      | SPI3  | govgrants_config:blankProjectAbstract__cwhileFourValueSelectSemicolonseparated    | SAF4Select |
      | SPI3  | govgrants_config:blankProjectAbstract__cwhileFourValueSelectMixeddelimiters       | SAF4Select |
      | SPI3  | govgrants_config:blankProjectAbstract__cwhileFourValueSelectIncludes              | SAF1Select |

  @US-FW-1541 @FW-1626 @FW-1627 @FW-1629 @FW-1630
  Scenario Outline: TC - LWC - Forms - SPI - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.
  |TC - LWC - Forms - SPI - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.|
  |TC - LWC - Forms - SPI - To verify that, user should be able to see Hide field when single matching value selected|
  |TC - LWC - Forms - SPI - To verify that, user should not be able to see the field when ALL configured values selected in the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFRace__c}              |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFRace__c}              |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Race" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Race" inside page block

    Examples:
      | Users | hideLogic                                                             | sheetName  |
      | SPI3  | govgrants_config:hideRace__cwhileFourValueSelectEqualTo               | SAF4Select |
      | SPI3  | govgrants_config:hideRace__cwhileOneValueSelectIn                     | SAF1Select |
      | SPI3  | govgrants_config:hideRace__cwhileFourValueSelectEqualToCommaseparated | SAF4Select |
      | SPI3  | govgrants_config:hideRace__cwhileFourValueSelectSemicolonseparated    | SAF4Select |
      | SPI3  | govgrants_config:hideRace__cwhileFourValueSelectMixeddelimiters       | SAF4Select |
      | SPI3  | govgrants_config:hideRace__cwhileFourValueSelectIncludes              | SAF1Select |

  @US-FW-1541 @FW-1626 @FW-1627 @FW-1629 @FW-1630 @FW-1631
  Scenario Outline: TC - LWC - Forms - SPI - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.
  |TC - LWC - Forms - SPI - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.|
  |TC - LWC - Forms - SPI - To verify that, user should be able to see Hide field when single matching value selected|
  |TC - LWC - Forms - SPI - To verify that, user should not be able to see the field when ALL configured values selected in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Forms - SPI - To verify that, user should not be able to see the field when ANY matching value exists among the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | Standard Assurances Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | Standard Assurances Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | Standard Assurances Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | Standard Assurances Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFRace__c}              |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | Standard Assurances Form | Name                      | {SavedValue:SAFRace__c}              |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<Users>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "10" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly cannot see field "Race" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Race" inside page block

    Examples:
      | Users | hideLogic                                                  | sheetName  |
      | SPI3  | govgrants_config:hideRace__cwhileFourValueSelectNotEqualTo | SAF4Select |
      | SPI3  | govgrants_config:hideRace__cwhileOneValueSelectNotIn       | SAF4Select |
      | SPI3  | govgrants_config:hideRace__cwhileOneValueSelectEXCLUDES    | SAF4Select |

  @US-FW-1541 @FW-1608
  Scenario Outline: TC - LWC - Forms - PM - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEFirstName__c}         |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEFirstName__c}         |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "First Name" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "First Name" inside page block
    Examples:
      | Users | hideLogic                                                                  | sheetName  |
      | EXE   | govgrants_config:hideFirstName__cwhileFourValueSelectEqualTo               | SAF4Select |
      | EXE   | govgrants_config:hideFirstName__cwhileOneValueSelectIn                     | SAF1Select |
      | EXE   | govgrants_config:hideFirstName__cwhileFourValueSelectEqualToCommaseparated | SAF4Select |
      | EXE   | govgrants_config:hideFirstName__cwhileFourValueSelectSemicolonseparated    | SAF4Select |
      | EXE   | govgrants_config:hideFirstName__cwhileFourValueSelectMixeddelimiters       | SAF4Select |
      | EXE   | govgrants_config:hideFirstName__cwhileFourValueSelectIncludes              | SAF1Select |

  @US-FW-1541 @FW-1608
  Scenario Outline: TC - LWC - Forms - PM - To verify that, user should be able to hide any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEFirstName__c}         |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEFirstName__c}         |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly cannot see field "First Name" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "First Name" inside page block

    Examples:
      | Users | hideLogic                                                       | sheetName  |
      | SPI3  | govgrants_config:hideFirstName__cwhileFourValueSelectNotEqualTo | SAF4Select |
      | SPI3  | govgrants_config:hideFirstName__cwhileOneValueSelectNotIn       | SAF4Select |
      | SPI3  | govgrants_config:hideFirstName__cwhileOneValueSelectEXCLUDES    | SAF4Select |

  @US-FW-1541 @FW-1609
  Scenario Outline: TC - LWC - Forms - PM - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue  | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true           | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11            | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <disableLogic> | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true           | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11            | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c}   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly do not see field "SvFinancialFormQ25__c" is in disabled mode
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "SvFinancialFormQ25__c" is in disabled mode

    Examples:
      | Users | disableLogic                                                                            | sheetName  |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileFourValueSelectEqualTo               | SAF4Select |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileOneValueSelectIn                     | SAF1Select |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileFourValueSelectEqualToCommaseparated | SAF4Select |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileFourValueSelectSemicolonseparated    | SAF4Select |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileFourValueSelectMixeddelimiters       | SAF4Select |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileFourValueSelectIncludes              | SAF1Select |

  @US-FW-1541 @FW-1609
  Scenario Outline: TC - LWC - Forms - PM - To verify that, user should be able to disable any field on layout based on value selected in a multipicklist.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue  | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true           | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11            | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <disableLogic> | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true           | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11            | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c}   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "SvFinancialFormQ25__c" is in disabled mode
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "SvFinancialFormQ25__c" is in disabled mode

    Examples:
      | Users | disableLogic                                                                 | sheetName  |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileFourValueSelectNotEqualTo | SAF4Select |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileOneValueSelectNotIn       | SAF4Select |
      | EXE   | govgrants_config:disabledSvFinancialFormQ25__cwhileOneValueSelectEXCLUDES    | SAF4Select |

  @US-FW-1541 @FW-1610 @FW-1611
  Scenario Outline: TC - LWC - Forms- PM - To verify that, user should be able to make any field blank on layout based on value selected in a multipicklist.
  |TC - LWC - Forms - PM - To verify that, user should be able to see the field visibility update dynamically whenever values are added to or removed from multi-select picklist.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter value "Atomation Test" into field "ProjectAbstract__c"
    Then I softly see field "ProjectAbstract__c" in edit mode contains some text
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly do not see field "ProjectAbstract__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                                                         | sheetName  |
      | EXE   | govgrants_config:blankProjectAbstract__cwhileFourValueSelectEqualTo               | SAF4Select |
      | EXE   | govgrants_config:blankProjectAbstract__cwhileOneValueSelectIn                     | SAF1Select |
      | EXE   | govgrants_config:blankProjectAbstract__cwhileFourValueSelectEqualToCommaseparated | SAF4Select |
      | EXE   | govgrants_config:blankProjectAbstract__cwhileFourValueSelectSemicolonseparated    | SAF4Select |
      | EXE   | govgrants_config:blankProjectAbstract__cwhileFourValueSelectMixeddelimiters       | SAF4Select |
      | EXE   | govgrants_config:blankProjectAbstract__cwhileFourValueSelectIncludes              | SAF1Select |

  @FW-1612 @FW-1613 @FW-1614 @FW-1616 @FW-1618 @FW-1625 @FW-1628
  Scenario Outline: TC - LWC - Forms - PM - To verify that, user should be able to select values in any order in a multipicklist, and system should correctly evaluate condition and hide field irrespective of selection sequence.
  |TC - LWC - Forms - PM - To verify that, user should be able to see the field, when none of the selected values match values defined in Hide Fields JSON condition.|
  |TC - LWC - Forms - PM - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Forms - PM - To verify that, user should be able to see Hide field when single matching value selected|
  |TC - LWC - Forms - PM - To verify that, user should not be able to see the field when ANY matching value exists among the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Forms - PM - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.|
  |TC - LWC - Forms - PM - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}     |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}     |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly cannot see field "Small Business" inside page block
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly see field "Small Business" inside page block

    Examples:
      | Users | hideLogic                                                                      | sheetName  |
      | EXE   | govgrants_config:hideSmallBusiness__cwhileFourValueSelectEqualTo               | SAF4Select |
      | EXE   | govgrants_config:hideSmallBusiness__cwhileOneValueSelectIn                     | SAF1Select |
      | EXE   | govgrants_config:hideSmallBusiness__cwhileFourValueSelectEqualToCommaseparated | SAF4Select |
      | EXE   | govgrants_config:hideSmallBusiness__cwhileFourValueSelectSemicolonseparated    | SAF4Select |
      | EXE   | govgrants_config:hideSmallBusiness__cwhileFourValueSelectMixeddelimiters       | SAF4Select |
      | EXE   | govgrants_config:hideSmallBusiness__cwhileFourValueSelectIncludes              | SAF1Select |

  @US-FW-1541 @FW-1614 @FW-1615 @FW-1617
  Scenario Outline: TC - LWC - Forms - PM - To verify that, user should not be able to see the field when at least one of the selected values in the multi-select picklist matches the condition defined in Hide Fields JSON.
  |TC - LWC - Forms - PM - To verify that, user should not be able to see field when all selected values in the multi-select picklist match the condition defined in the Hide Fields JSON.|
  |TC - LWC - Forms - PM - To verify that, user should not be able to see the field when ALL configured values selected in the multi-select picklist matches the condition defined in Hide Fields JSON.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -10               | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON |                   | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11               | General Review Form | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Hide Fields JSON | <hideLogic>   | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}     |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXELastName__c}          |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXELastName__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}   |
      | Page Block Config:Page Block Rule Detail | Sort Order       | -11           | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}   |

    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter value "Atomation Test" into field "ProjectAbstract__c"
    Then I softly see field "Small Business" inside page block
    Then I softly see field "ProjectAbstract__c" in edit mode contains some text
    Then I softly do not see field "LastName__c" is in disabled mode
    When I enter "<sheetName>" values from "MultiselectPicklistUserStories.xlsx"
    Then I softly cannot see field "Small Business" inside page block
    Then I softly see field "LastName__c" is in disabled mode
    Then I softly do not see field "ProjectAbstract__c" in edit mode contains some text

    Examples:
      | Users | hideLogic                                    | sheetName  |
      | EXE   | govgrants_config:MultiValueConditionForForms | SAF4Select |

