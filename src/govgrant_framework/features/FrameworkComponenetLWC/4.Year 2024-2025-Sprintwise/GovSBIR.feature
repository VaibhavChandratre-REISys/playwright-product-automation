@Grid-GovSBIR @Sprint-2025 @GovSBIR
Feature: The user must create an Grid-GovSBIR Hide Logic t the LWC Object level.
  After creating the template, the user needs to specify the template name in the Action URL (Long) field within the LWC configuration.
  1.@US-550409
  2.@US-551594
  3.@US-547059

  @550613 @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table column is hidden based on child table values.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDNumberDataType | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn}          | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    Then I softly do not see column header "Step Order" displayed in tableId "---program:-:reviewStepTableId---"

  @550616 @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table column is Read Only based on child table values.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                        | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDNumberDataType | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn}          | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    When I click on "Edit" icon for "Pre-Screen Review" inside table
    Then I softly do not see field "StepNumber__c" on table is input field

  @550617 @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table Hide column is Unhidden based on child table values Changes
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDNumberDataType | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn}          | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    Then I softly do not see "Step Order" in flex table header "---program:-:reviewStepTableId---"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Pre-Screen Review | 55              |
    And I refresh the page
    Then I softly see "Step Order" in flex table header "---program:-:reviewStepTableId---"

  @550618 @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table Read Only column is Editable based on child table values Changes
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                        | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDNumberDataType | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn}          | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    When I click on "Edit" icon for "Pre-Screen Review" inside table
    Then I softly do not see field "StepNumber__c" on table is input field
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Pre-Screen Review | 55              |
    And I refresh the page
    When I click on "Edit" icon for "Pre-Screen Review" inside table
    Then I softly see field "StepNumber__c" on table is input field

  @550621 @AllDataTypes @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table column is hidden based on child table values using all Data Types & Operators.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | URL__c,Email__c,Template__c,AutTestName__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    Then I softly see column header "Email" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "URL" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "Template" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "Step Name" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "AutTestName" displayed in tableId "---program:-:reviewStepTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
     # | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Email_Email__c}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:URL_URL__c}              |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Checkbox_Template__c}    |
      #| Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Text_Name}               |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:TextArea_AutTestName__c} |
      | Flex Table:General    | Display Field Names | URL__c,Email__c,Template__c,AutTestName__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                      |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see column header "Email" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly do not see column header "B_Template" displayed in tableId "---program:-:reviewStepTableId---"
    #Then I softly do not see column header "Step Name" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly do not see column header "AutTestName" displayed in tableId "---program:-:reviewStepTableId---"

  @550621_1 @AllDataTypes @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table column is hidden based on child table values using all Data Types & Operators.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Phone__c,Date_And_Time__c,Currency__c,Organization__c,EndDate__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    Then I softly see column header "Phone" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "Currency" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "Date And Time" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "X_End Date" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly see column header "X_Agency" displayed in tableId "---program:-:reviewStepTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Lookup_Organization__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Currency__c}            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Phone__c}               |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_And_Time__c}       |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_EndDate__c}        |
      | Flex Table:General    | Display Field Names | Phone__c,Date_And_Time__c,Currency__c,Organization__c,EndDate__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                     |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see column header "Phone" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly do not see column header "Currency" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly do not see column header "Date And Time" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly do not see column header "X_End Date" displayed in tableId "---program:-:reviewStepTableId---"
    Then I softly do not see column header "X_Agency" displayed in tableId "---program:-:reviewStepTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |

  @550622 @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table column is Read Only based on child table values using all Data Types & Operators.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | URL__c,Email__c,Template__c,AutTestName__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "SME Review" inside table
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "URL" on table is input field
    Then I softly see field "Template__c" on table is input field
    Then I softly see field "Name" on table is input field
    Then I softly see field "AutTestName__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Email_Email__c}          |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:URL_URL__c}              |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Checkbox_Template__c}    |
     # | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Text_Name}               |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:TextArea_AutTestName__c} |
      | Flex Table:General    | Display Field Names   | URL__c,Email__c,Template__c,AutTestName__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                      |
    And I refresh the page
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "SME Review" inside table
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "URL__c" on table is input field
    Then I softly do not see field "Template__c" on table is input field
   # Then I softly do not see field "Step Name" on table is input field
    Then I softly do not see field "AutTestName__c" on table is input field

  @550622_1 @AllDataTypes @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table column is Read Only based on child table values using all Data Types & Operators.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Phone__c,Date_And_Time__c,Currency__c,Organization__c,EndDate__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "SME Review" inside table
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Currency__c" on table is input field
    Then I softly see field "Date_And_Time__c" on table is input field
    Then I softly see field "EndDate__c" on table is input field
    Then I softly see field "Organization__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                                                | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Lookup_Organization__c} |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Currency__c}            |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Phone__c}               |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_And_Time__c}       |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDAllDataType                                                            | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_EndDate__c}        |
      | Flex Table:General    | Display Field Names   | Phone__c,Date_And_Time__c,Currency__c,Organization__c,EndDate__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                     |
    And I refresh the page
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "SME Review" inside table
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Currency__c" on table is input field
    Then I softly do not see field "Date_And_Time__c" on table is input field
    Then I softly do not see field "EndDate__c" on table is input field
    Then I softly do not see field "Organization__c" on table is input field

  @550619 @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table Hide column is Unhidden based on ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Hide Column JSON    |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                   | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepTableIDNumberDataTypeInverseTrue | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn}                     | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    Then I softly see column header "Step Order" displayed in tableId "---program:-:reviewStepTableId---"

  @550620 @US-550409
  Scenario: LWC : Grid : PM : To verify that the parent table Read Only column is Editable based on ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                           | filterId         |
      | Flex Table List       | Read Only Column Json |                                             | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                   | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepTableIDNumberDataTypeInverseTrue | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewStepsParentGridTable.dfn}                     | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    When I click on "Edit" icon for "Pre-Screen Review" inside table
    Then I softly see field "StepNumber__c" on table is input field

  @550623 @US-550409
  Scenario: LWC : Grid : PM : To verify that the Child table column is hidden based on Grand child table values.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepChildTable  | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                                      |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 0               | 5                                         | Checked   |
    And I pause execution for "4" seconds
    Then I softly do not see column header "Review Response Shared" displayed in tableId "---program:-:reviewFormPanelId---"

  @550624 @US-550409
  Scenario:LWC : Grid : PM : To verify that the Child table column is Read Only based on Grand child table values.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Read Only Column Json |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepChildTable  | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                                      |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 0               | 5                                         | Checked   |
    When I click on "Edit" icon for "5" inside table
    Then I softly do not see field "ReviewResponseShared__c" on table is input field

  @550625 @US-550409
  Scenario: LWC : Grid : PM : To verify that the Child table Hide column is Unhidden based on Grandchild table values Changes.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepChildTable  | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                                      |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 0               | 6                                         | Checked   |
    And I pause execution for "4" seconds
    Then I softly see column header "Review Response Shared" displayed in tableId "---program:-:reviewFormPanelId---"

  @550626 @US-550409
  Scenario: LWC : Grid : PM : To verify that the Child table Read Only column is Editable based on Grand child table values Changes.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                          | filterId           |
      | Flex Table List       | Read Only Column Json |                                            | ApiGenerated  Id:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1   |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepChildTable  | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                                      |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | 0               | 6                                         | Checked   |
    When I click on "Edit" icon for "6" inside table
    Then I softly see field "ReviewResponseShared__c" on table is input field

  @550627 @US-550409
  Scenario:LWC : Grid : PM : To verify that the Child table Hide column is Unhidden based on ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJReviewStepChildTableInverseTrue | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}           | ProgramReviewStepPanelTemplates |                           |                                      |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | 0               | 5                                         | Checked   |
    And I pause execution for "4" seconds
    Then I softly see column header "Review Response Shared" displayed in tableId "---program:-:reviewFormPanelId---"

  @550628 @US-550409
  Scenario: LWC : Grid : PM : To verify that the Child table Read Only column is Editable based on ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Read Only Column Json |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJReviewStepChildTableInverseTrue | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn}           | ProgramReviewStepPanelTemplates |                           |                                      |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | 0               | 5                                         | Checked   |
    When I click on "Edit" icon for "5" inside table
    Then I softly see field "ReviewResponseShared__c" on table is input field

  @550632 @550639 @US-550409
  Scenario: LWC : Grid : SPI : To verify that the parent table column is hidden based on child table values.
  |LWC : Grid : SPI : To verify that the parent table column is hidden based on child table values using all Data Types & Operators.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                    | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},URL__c,FeeFundRequested__c,Email__c,Modified__c,Status__c,Notes__c,Time__c,Phone__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see column header "URL" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Fee Fund Requested" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Email" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Modified" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Status" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Notes" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Time" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Phone" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:6 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:7 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                    | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:URLSPI_URL__c}                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:PicklistSPI_Status__c}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:EmailSPI_Email__c}               |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CheckBoxSPI_Modified__c}         |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CurrencySPI_FeeFundRequested__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:TextAreaSPI_Notes__c}            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Time__c}                     |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPI                                                                             | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Phone__c}                    |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},URL__c,FeeFundRequested__c,Email__c,Modified__c,Status__c,Notes__c,Time__c,Phone__c | EnhanceAppGrantorBudgetPeriods |                           |                                              |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see column header "URL" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly do not see column header "Fee Fund Requested" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly do not see column header "Email" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly do not see column header "Modified" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly do not see column header "Status" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly do not see column header "Notes" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly do not see column header "Time" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"

  @550637 @US-550409
  Scenario: LWC : Grid : SPI : To verify that the parent table Hide column is Unhidden based on ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:6 |
      | Flex Table List       | Hide Column JSON    |                              | ApiGeneratedId:7 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                    | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:URLSPI_URL__c}                   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:PicklistSPI_Status__c}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:EmailSPI_Email__c}               |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CheckBoxSPI_Modified__c}         |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CurrencySPI_FeeFundRequested__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:TextAreaSPI_Notes__c}            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Time__c}                     |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodSPIInverseTrue                                                                  | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Phone__c}                    |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},URL__c,FeeFundRequested__c,Email__c,Modified__c,Status__c,Notes__c,Time__c,Phone__c | EnhanceAppGrantorBudgetPeriods |                           |                                              |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    Then I softly see column header "URL" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Fee Fund Requested" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Email" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Modified" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Status" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Notes" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Time" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see column header "Phone" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"

  @550643 @550655 @US-550409
  Scenario: LWC : Grid : SPI : To verify that the Child table column is hidden based on Grand child table values.
  |LWC : Grid : SPI : To verify that the Child table column is hidden based on Grand child table values using all Data Types & Operators.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Phone__c,Percent__c,ProgramIncomeJustification__c,Description__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see column header "Total Project Cost" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Prcent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Description" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Category Name                     | Non-Cash Match |
      | Administrative and legal expenses | 5              |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:5 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Description__c}                |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:TotalProjectCost__c}                 |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Phone__c,Percent__c,ProgramIncomeJustification__c,Description__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see column header "Total Project Cost" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Prcent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Description" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"

  @550646 @550657 @US-550409
  Scenario: LWC : Grid : SPI : To verify that the Child table column is Read Only based on Grand child table values.
  |LWC : Grid : SPI : To verify that the Child table column is Read Only based on Grand child table values using all Data Types & Operators.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Phone__c,Percent__c,ProgramIncomeJustification__c,Description__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see field "URL__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Percent__c" on table is input field
    Then I softly see field "ProgramIncomeJustification__c" on table is input field
    Then I softly see field "Description__c" on table is input field
    Then I softly see field "TotalProjectCost__c" on table is input field
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Category Name                     | Non-Cash Match |
      | Administrative and legal expenses | 5              |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue             | filterId         |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:2 |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:3 |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:4 |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:5 |
      | Flex Table            | Display Field Names   | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Description__c}                |
      | Flex Table List       | Read Only Column Json | govgrants_config:HECJBudgetPeriodChildTableSPI                                                        | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:TotalProjectCost__c}                 |
      | Flex Table:General    | Display Field Names   | {SavedValue:BudgetCategories},URL__c,Phone__c,Percent__c,ProgramIncomeJustification__c,Description__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see field "URL__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Percent__c" on table is input field
    Then I softly do not see field "ProgramIncomeJustification__c" on table is input field
    Then I softly do not see field "Description__c" on table is input field
    Then I softly do not see field "TotalProjectCost__c" on table is input field

  @550648 @550653 @US-550409
  Scenario: LWC : Grid : SPI : To verify that the Child table Hide column is Unhidden based on Grand child table values Changes ( Invers True ).
  |LWC : Grid : SPI : To verify that the Child table Hide column is Unhidden based on ( Invers True ).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:5 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Description__c}                |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:TotalProjectCost__c}                 |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Phone__c,Percent__c,ProgramIncomeJustification__c,Description__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Category Name                     | Non-Cash Match |
      | Administrative and legal expenses | 5              |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see column header "Total Project Cost" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Percent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Description" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"

  @550650 @US-550409
  Scenario: LWC : Grid : SPI : To verify that the Child table Read Only column is Editable based on Grand child table values Changes ( Invers True ).
  |LWC : Grid : SPI : To verify that the Child table Read Only column is Editable based on ( Invers True ).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:5 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Description__c}                |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HECJBudgetPeriodChildTableSPIInverseTrue                                             | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:TotalProjectCost__c}                 |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Phone__c,Percent__c,ProgramIncomeJustification__c,Description__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Category Name                     | Non-Cash Match |
      | Administrative and legal expenses | 5              |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see field "URL__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Percent__c" on table is input field
    Then I softly see field "ProgramIncomeJustification__c" on table is input field
    Then I softly see field "Description__c" on table is input field
    Then I softly see field "TotalProjectCost__c" on table is input field

  ############################ US-551594 #################################
  @552580 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide the top-level action of child table based on parent child record value.
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HEJReviewStepPanel | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    And I refresh the page
    Then I softly do not see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @552581 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide column of child table based on parent child record value.
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see column header "Review Response Shared" displayed in tableId "---program:-:reviewStepTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJReviewStepPanel        | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                                      |
    And I refresh the page
    Then I softly do not see column header "Review Response Shared" displayed in tableId "---program:-:reviewStepTableId---"

  @552582 @US-551594
  Scenario: LWC: Grid: PM: To verify that read-only column of child table based on parent child record value.
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Edit" icon for "Pre-Screen" inside table
    Then I softly see field "ReviewResponseShared__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Read Only Column Json |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJReviewStepPanel        | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                                      |
    And I refresh the page
    And I pause execution for "6" seconds
    When I click on "Edit" icon for "Pre-Screen" inside table
    Then I softly do not see field "ReviewResponseShared__c" on table is input field

  @552583 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide the top-level action of child table based on parent child record value ( Invers True ).
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HEJReviewStepPanelInverseTrue | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    And I refresh the page
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @552584 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide column of child table based on parent child record value ( Invers True ).
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see column header "Review Response Shared" displayed in tableId "---program:-:reviewStepTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJReviewStepPanelInverseTrue | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}     | ProgramReviewStepPanelTemplates |                           |                                      |
    And I refresh the page
    Then I softly see column header "Review Response Shared" displayed in tableId "---program:-:reviewStepTableId---"

  @552585 @US-551594
  Scenario: LWC : Grid : PM : To verify that read-only column of child table based on parent child record value ( Invers True ).
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Edit" icon for "Pre-Screen" inside table
    Then I softly see field "ReviewResponseShared__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Read Only Column Json |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJReviewStepPanelInverseTrue | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:ReviewResponseShared__c} |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewFormsChildGridTable.dfn}     | ProgramReviewStepPanelTemplates |                           |                                      |
    And I refresh the page
    When I click on "Edit" icon for "Pre-Screen" inside table
    Then I softly see field "ReviewResponseShared__c" on table is input field

  @552586 @US-551594
  Scenario:LWC : Grid : PM : To verify that hide the top-level action of child table based on parent child record value using all Data Types & Operators.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared | Due in Days | TextArea | TestCurrency |
      | Test Name | 50              | 1                                         | Checked   | No                     | 123         | Test     | 123          |
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                          | filterId         |
      | Flex Table Action     | Hide Expression JSON |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HEJReviewStepPanelAllDataTypes                                     | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c | ProgramReviewStepPanelTemplates |                           |                            |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @552587 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide the top-level action of child table based on parent child record value using all Data Types & Operators ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "New" :
      | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared | Due in Days | TextArea | TestCurrency |
      | Test Name | 50              | 1                                         | Checked   | No                     | 123         | Test     | 123          |
    And I pause execution for "5" seconds
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                          | filterId         |
      | Flex Table Action     | Hide Expression JSON |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:HEJReviewStepPanelAllDataTypesInverseTrue                          | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c | ProgramReviewStepPanelTemplates |                           |                            |
    And I refresh the page
    And I wait for "7" seconds
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepChildTableId---"

  @552588 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide the top-level action of Grandchild table based on parent child record value.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see top right button "Test Button" inside flex table "---program:-:programReviewPanel---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Hide Expression JSON |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Expression JSON | govgrants_config:HEJReviewPanelCategories               | ProgramRelatedReviewPanelCategories | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    And I pause execution for "6" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---program:-:programReviewPanel---"

  @552589 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide column of Grandchild table based on parent child record value.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see column header "Header" displayed in tableId "---program:-:programReviewPanel---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Hide Column JSON    |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJReviewPanelCategories               | ProgramRelatedReviewPanelCategories | Name                      | {SavedValue:Header__c}     |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly do not see column header "Header" displayed in tableId "---program:-:programReviewPanel---"

  @552590 @US-551594
  Scenario: LWC : Grid : PM : To verify that read-only column of Grandchild table based on parent child record value.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    When I click on "Edit" icon for "Eligibility" inside table
    When I click on "Edit" icon for "Completeness" inside table
    Then I softly see field "Weight__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Read Only Column Json |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJReviewPanelCategories               | ProgramRelatedReviewPanelCategories | Name                      | {SavedValue:Weight__c}     |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    When I click on "Edit" icon for "Eligibility" inside table
    When I click on "Edit" icon for "Completeness" inside table
    Then I softly do not see field "Weight__c" on table is input field

  @552591 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide the top-level action of Grandchild table based on parent child record value ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see top right button "Test Button" inside flex table "---program:-:programReviewPanel---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Hide Expression JSON |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Expression JSON | govgrants_config:HEJReviewPanelCategoriesInverseTrue    | ProgramRelatedReviewPanelCategories | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    And I pause execution for "6" seconds
    Then I softly see top right button "Test Button" inside flex table "---program:-:programReviewPanel---"

  @552592 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide column of Grandchild table based on parent child record value ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see column header "Header" displayed in tableId "---program:-:programReviewPanel---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Hide Column JSON    |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJReviewPanelCategoriesInverseTrue    | ProgramRelatedReviewPanelCategories | Name                      | {SavedValue:Header__c}     |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see column header "Header" displayed in tableId "---program:-:programReviewPanel---"

  @552593 @US-551594
  Scenario: LWC : Grid : PM : To verify that read-only column of Grandchild table based on parent child record value ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    When I click on "Edit" icon for "Eligibility" inside table
    When I click on "Edit" icon for "Completeness" inside table
    Then I softly see field "Weight__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Read Only Column Json |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                           | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJReviewPanelCategoriesInverseTrue    | ProgramRelatedReviewPanelCategories | Name                      | {SavedValue:Weight__c}     |
      | Flex Table:General    | Display Field Names   | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    When I click on "Edit" icon for "Eligibility" inside table
    When I click on "Edit" icon for "Completeness" inside table
    Then I softly see field "Weight__c" on table is input field

  @552594 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide column of Grandchild table based on parent child record value using all Data Types & Operators.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                   | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c,Currency__c,Checkbox__c,Email__c,URL__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see column header "Header" displayed in tableId "---program:-:programReviewPanel---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Currency | Checkbox | Email           | URL            |
      | 123      | True     | vrush@gmail.com | www.google.com |
    And I pause execution for "4" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Hide Column JSON    |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                   | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJReviewPanelCategoriesAllDataTypes                                           | ProgramRelatedReviewPanelCategories | Name                      | {SavedValue:Header__c}     |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c,Currency__c,Checkbox__c,Email__c,URL__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly do not see column header "Header" displayed in tableId "---program:-:programReviewPanel---"

  @552595 @US-551594
  Scenario: LWC : Grid : PM : To verify that hide column of Grandchild table based on parent child record value using all Data Types & Operators ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                   | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c,Currency__c,Checkbox__c,Email__c,URL__c | ProgramRelatedReviewPanelCategories |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see column header "Header" displayed in tableId "---program:-:programReviewPanel---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Currency | Checkbox | Email           | URL            |
      | 123      | True     | vrush@gmail.com | www.google.com |
    And I pause execution for "4" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table List       | Hide Column JSON    |                                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                   | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJReviewPanelCategoriesAllDataTypesInverseTrue                                | ProgramRelatedReviewPanelCategories | Name                      | {SavedValue:Header__c}     |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Header__c,Currency__c,Checkbox__c,Email__c,URL__c | ProgramRelatedReviewPanelCategories |                           |                            |
    And I refresh the page
    When I click on "Review Form" icon for "Pre-Screen" inside table
    Then I softly see "Review Form" opens in overLay window
    Then I softly see column header "Header" displayed in tableId "---program:-:programReviewPanel---"

  @552596 @US-551594
  Scenario: LWC : Grid : SPI : To verify that hide the top-level action of child table based on parent child record value.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories} | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see top right button "Test Button" inside flex table "---applicationReview:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Category Name                     | Non-Cash Match |
      | Administrative and legal expenses | 5              |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue             | filterId         |
      | Flex Table List       | Hide Expression JSON |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:BudgetCategories} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                      | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Expression JSON | govgrants_config:HEJBudgetCategory | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:BudgetCategories}      | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly do not see top right button "Test Button" inside flex table "---applicationReview:-:budgetPeriodTableId---"

  @552597 @US-551594
  Scenario:LWC : Grid : SPI : To verify that hide column of child table based on parent child record value.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see column header "URL" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJBudgetCategory   | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}  |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly do not see column header "URL" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"

  @552598 @US-551594
  Scenario: LWC : Grid : SPI : To verify that read-only column of child table based on parent child record value.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    Then I softly see field "URL__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue             | filterId         |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:BudgetCategories} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJBudgetCategory   | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}  |
      | Flex Table:General    | Display Field Names   | {SavedValue:BudgetCategories},URL__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    When I click on "Edit" icon for "Architectural and engineering fees" inside table
    Then I softly do not see field "URL__c" on table is input field

  @552599 @US-551594
  Scenario: LWC : Grid : SPI : To verify that hide the top-level action of child table based on parent child record value ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories} | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see top right button "Test Button" inside flex table "---applicationReview:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Category Name                     | Non-Cash Match |
      | Administrative and legal expenses | 5              |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue             | filterId         |
      | Flex Table List       | Hide Expression JSON |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:BudgetCategories} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Expression JSON | govgrants_config:HEJBudgetCategoryInverseTrue | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:BudgetCategories}                 | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see top right button "Test Button" inside flex table "---applicationReview:-:budgetPeriodTableId---"

  @552600 @US-551594
  Scenario: LWC : Grid : SPI : To verify that hide column of child table based on parent child record value ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see column header "URL" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table List       | Hide Column JSON    |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HEJBudgetCategoryInverseTrue | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}  |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c          | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see column header "URL" displayed in tableId "---applicationReview:-:budgetPeriodTableId---"

  @552601 @US-551594
  Scenario: LWC : Grid : SPI : To verify that read-only column of child table based on parent child record value ( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    Then I softly see field "URL__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue             | filterId         |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:BudgetCategories} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJBudgetCategoryInverseTrue | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}  |
      | Flex Table:General    | Display Field Names   | {SavedValue:BudgetCategories},URL__c          | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    When I click on "Edit" icon for "Architectural and engineering fees" inside table
    Then I softly see field "URL__c" on table is input field

  @551602 @US-551594
  Scenario: LWC : Grid : SPI : To verify that read-only column of child table based on parent child record value using all Data Types & Operators.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Category Name                     | Non-Cash Match |
      | Administrative and legal expenses | 5              |
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    Then I softly see field "URL__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue             | filterId         |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:BudgetCategories} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJBudgetCategoryAllDataTypes                            | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}  |
      | Flex Table:General    | Display Field Names   | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    When I click on "Edit" icon for "Architectural and engineering fees" inside table
    Then I softly do not see field "URL__c" on table is input field

  @552603 @US-551594
  Scenario: LWC : Grid : SPI : To verify that read-only column of child table based on parent child record value using all Data Types & Operators.( Invers True ).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    Then I softly see field "URL__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue             | filterId         |
      | Flex Table List       | Read Only Column Json |                               | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:BudgetCategories} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table List       | Read Only Column Json | govgrants_config:HEJBudgetCategoryAllDataTypesInverseTrue | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}  |
      | Flex Table:General    | Display Field Names   | {SavedValue:BudgetCategories},URL__c                      | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    And I refresh the page
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    When I click on "Edit" icon for "Administrative and legal expenses" inside table
    When I click on "Edit" icon for "Architectural and engineering fees" inside table
    Then I softly see field "URL__c" on table is input field

########################### User Story - 547059 #######################
  @547793 @548234 @US-547059
  Scenario: LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then Column in the child table should be hidden from the user.
  |LWC - Grid - PM - To verify that, when the parent record does not meet any defined condition, then all Column for the child grid should remain visible by default.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    Then I softly see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    Then I softly do not see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "TextCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"

  @548237 @548236 @547211 @US-547059
  Scenario: LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then there should be no impact on child/grandchild table data
  |LWC - Grid - PM - To verify that, logic should support both direct parent-child relationships and deeper levels (e.g., parent → child → grandchild) for controlling visibility.|
  |LWC - Grid - PM - To verify that, the hide logic should be worked from the parent table object for column of child table.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    Then I softly see value "Application completeness and correctness review" for title "Description" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Detailed subject matter expert review" for title "Description" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Pre-Screen Review" for title "Step Name" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "SME Review" for title "Step Name" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "0.00%" for title "Step Weight (%)" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "75.00%" for title "Step Weight (%)" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Compliance Review" for title "Form Name" against the value "0.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Fiscal Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Program Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "75.00%" for title "Step Weight (%)" against the value "2" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TestCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                            | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Hide Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    Then I softly do not see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "TestCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Application completeness and correctness review" for title "Description" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Detailed subject matter expert review" for title "Description" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Pre-Screen Review" for title "Step Name" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "SME Review" for title "Step Name" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "0.00%" for title "Step Weight (%)" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "75.00%" for title "Step Weight (%)" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Compliance Review" for title "Form Name" against the value "0.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Fiscal Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Program Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "75.00%" for title "Step Weight (%)" against the value "2" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"

  @548245 @548241 @548247 @547797 @US-547059
  Scenario: LWC - Grid - PM - To verify that, after applying Hide Column JSON using Field left operand on the basis of parent object, then Column in the child table should be hidden from the user.
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then child table layout remains consistent.|
  |LWC - Grid - PM - To verify that, for all datatypes, after applying Hide Column JSON using Field left operand on the basis of parent object, then Column in the child table should be hidden from the user.|
  |LWC - Grid - PM - To verify that, when a parent record updates the values, then the visibility of child actions should update in real-time.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    Then I softly see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TestCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                          | filterId         |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:0 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:2 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:3 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:4 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:5 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:6 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:7 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    Then I softly do not see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | # | Step Order | Step Weight (%) |
      | 2 | 5          | 75.00%          |
    And I refresh the page
    And I pause execution for "6" seconds
    Then I softly see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"

  @548249 @US-547059
  Scenario: LWC - Grid - PM - To verify that, the hide logic should be worked from the parent table object for the Column of child table when we enable the 'Enable Parent Hide Logic' config at the flex table detail
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    Then I softly see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TestCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                          | filterId          |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:1  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    Then I softly do not see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "TestCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"

  @548251 @wip @US-547059
  Scenario: LWC - Grid - PM - To verify that, the hide logic should not be worked from the parent table object for the Column of child table when we disable the 'Enable Parent Hide Logic' config at the flex table detail
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    Then I softly see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TestCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                          | filterId          |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:1  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON         |                                            | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table List       | Enable Parent Hide Logic | false                                                                                                                                     | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    Then I softly see column header "Due in Days" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TextArea" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "TestCurrency" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Form Due Date" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "PercentageTest" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Phone" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "Email" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see column header "URL" displayed in tableId "---flexgrid:-:ProgramReviewStepChildTableId---"

  @548359 @548360 @US-547059
  Scenario: LWC - Grid - PM - To verify that, the Read Only logic should be worked from the parent table object for column of child table.
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then Column in the child table should be Read Only for the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly see field "DueInDays__c" on table is input field
    Then I softly see field "TextArea__c" on table is input field
    Then I softly see field "TestCurrency__c" on table is input field
    Then I softly see field "EndDate__c" on table is input field
    Then I softly see field "PercentageTest__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "URL__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                          | filterId          |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly do not see field "DueInDays__c" on table is input field
    Then I softly do not see field "TextArea__c" on table is input field
    Then I softly do not see field "TestCurrency__c" on table is input field
    Then I softly do not see field "EndDate__c" on table is input field
    Then I softly do not see field "PercentageTest__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "URL__c" on table is input field

  @548362 @548364 @US-547059
  Scenario: LWC - Grid - PM - To verify that, when a parent record updates the values, then the visibility of child actions should update in real-time.
  |LWC - Grid - PM - To verify that, when the parent record does not meet any defined condition, then all Column for the child grid should remain visible by default.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly see field "DueInDays__c" on table is input field
    Then I softly see field "TextArea__c" on table is input field
    Then I softly see field "TestCurrency__c" on table is input field
    Then I softly see field "EndDate__c" on table is input field
    Then I softly see field "PercentageTest__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "URL__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                          | filterId          |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    And I pause execution for "5" seconds
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly do not see field "DueInDays__c" on table is input field
    Then I softly do not see field "TextArea__c" on table is input field
    Then I softly do not see field "TestCurrency__c" on table is input field
    Then I softly do not see field "EndDate__c" on table is input field
    Then I softly do not see field "PercentageTest__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "URL__c" on table is input field
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | # | Step Order | Step Weight (%) |
      | 2 | 5          | 75.00%          |
    And I refresh the page
    And I pause execution for "6" seconds
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly see field "DueInDays__c" on table is input field
    Then I softly see field "TextArea__c" on table is input field
    Then I softly see field "TestCurrency__c" on table is input field
    Then I softly see field "EndDate__c" on table is input field
    Then I softly see field "PercentageTest__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "URL__c" on table is input field

  @548396 @548366 @548411 @548419 @US-547059
  Scenario: LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then child table layout remains consistent.
  |LWC - Grid - PM - To verify that, logic should support both direct parent-child relationships and deeper levels (e.g., parent → child → grandchild) for controlling visibility.|
  |LWC - Grid - PM - To verify that, after applying Read Only Column JSON using Field left operand on the basis of parent object,  then Column in the child table should be Read Only for the user.|
  |LWC - Grid - PM - To verify that, for all datatypes, after applying Read Only Column JSON using Field left operand on the basis of parent object,  then Column in the child table should be Read Only for the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly see field "DueInDays__c" on table is input field
    Then I softly see field "TextArea__c" on table is input field
    Then I softly see field "TestCurrency__c" on table is input field
    Then I softly see field "EndDate__c" on table is input field
    Then I softly see field "PercentageTest__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "URL__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                          | filterId          |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly do not see field "DueInDays__c" on table is input field
    Then I softly do not see field "TextArea__c" on table is input field
    Then I softly do not see field "TestCurrency__c" on table is input field
    Then I softly do not see field "EndDate__c" on table is input field
    Then I softly do not see field "PercentageTest__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "URL__c" on table is input field
    Then I softly see value "Application completeness and correctness review" for title "Description" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Detailed subject matter expert review" for title "Description" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Pre-Screen Review" for title "Step Name" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "SME Review" for title "Step Name" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "0.00%" for title "Step Weight (%)" against the value "1" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "75.00%" for title "Step Weight (%)" against the value "2" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Compliance Review" for title "Form Name" against the value "0.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Fiscal Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Program Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "75.00%" for title "Step Weight (%)" against the value "2" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"

  @548425 @US-547059
  Scenario: LWC - Grid - PM - To verify that, the Read Only logic should be worked from the parent table object for the Column of child table when we enable the 'Enable Parent Hide Logic' config at the flex table detail
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "Compliance Review" inside table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                          | filterId          |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column JSON    |                                            | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                       | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:14 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:DueInDays__c}             |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildTextArea__c}       |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildCurrencyTest__c}   |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPercentageTest__c} |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildDate__c}           |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildEmail__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildPhone__c}          |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewStepChild                                                                                                       | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                      | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:RFChildUrl__c}            |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c | ProgramReviewStepPanelTemplates |                           |                                       |
    And I refresh the page
    When I click on "Edit" icon for "Compliance Review" inside table
    Then I softly do not see field "DueInDays__c" on table is input field
    Then I softly do not see field "TextArea__c" on table is input field
    Then I softly do not see field "TestCurrency__c" on table is input field
    Then I softly do not see field "EndDate__c" on table is input field
    Then I softly do not see field "PercentageTest__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "URL__c" on table is input field

  @547212 @547796 @548233 @548246 @548248 @548250 @US-547059
  Scenario: LWC - Grid - PM - To verify that, the hide logic should be worked from the child table object for column of grand-child table.
  |LWC - Grid - PM - To verify that, when a child record meets specific conditions, then Column in the grandchild table should be hidden from the user.|
  |LWC - Grid - PM - To verify that, when a child record updates the values, then the visibility of grandchild actions should update in real-time.|
  |LWC - Grid - PM - To verify that, after applying Hide Column JSON using Field left operand on the basis of child object, then Column in the grandchild table should be hidden from the user.|
  |LWC - Grid - PM - To verify that, for all datatypes, after applying Hide Column JSON using Field left operand on the basis of child object, then Column in the grandchild table should be hidden from the user.|
  |LWC - Grid - PM - To verify that, the hide logic should be worked from the child table object for the Column of grandchild table when we enable the 'Enable Parent Hide Logic' config at the flex table detail|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,Email__c,URL__c,Lookup__c                                       | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Form Name         | Step Weight (%) | Due in Days | TextArea   | TestCurrency | Email           | Program           |
      | Compliance Review | 1               | 111         | textarea99 | 1            | vrush@gmail.com | FPG-DOC-NOAA-0001 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Compliance Review"
    Then I softly see column header "Order" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Review Form Name" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Weight" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Currency" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Checkbox" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Email" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "URL" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Program" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Picklist" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Phone" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text Area" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                             | filterId          |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:1  |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:13 |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:14 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:15 |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:16 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:17 |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:18 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:19 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}    |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c}  |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c}  |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestEmail__c}     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestEmail__c}     |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestURL__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestURL__c}       |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestLookup__c}    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestLookup__c}    |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPicklist__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPicklist__c}  |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPhone__c}     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPhone__c}     |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText__c}      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText__c}      |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText_Area__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText_Area__c} |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                               |
    And I refresh the page
    Then I softly do not see column header "Order" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Review Form Name" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Weight" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Currency" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Checkbox" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Email" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "URL" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Program" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Picklist" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Text" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Text Area" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"

  @548235 @US-547059
  Scenario: LWC - Grid - PM - To verify that, when the child record does not meet any defined condition, then all Column for the grandchild grid should remain visible by default.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,Email__c,URL__c,Lookup__c                                       | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Compliance Review"
    Then I softly see column header "Order" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Review Form Name" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Weight" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Currency" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Checkbox" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Email" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "URL" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Program" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Picklist" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Phone" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text Area" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"

  @548238 @548242 @US-547059
  Scenario: LWC - Grid - PM - To verify that, when a child record meets specific conditions, then there should be no impact on grandchild table data
  |LWC - Grid - PM - To verify that, when a child record meets specific conditions, then grandchild table layout remains consistent.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,Email__c,URL__c,Lookup__c                                       | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Form Name         | Step Weight (%) | Due in Days | TextArea   | TestCurrency | Email           | Program           |
      | Compliance Review | 1               | 111         | textarea99 | 1            | vrush@gmail.com | FPG-DOC-NOAA-0001 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Compliance Review"
    Then I softly see column header "Order" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Review Form Name" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Weight" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Currency" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Checkbox" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Email" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "URL" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Program" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Picklist" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Phone" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text Area" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                             | filterId          |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:1  |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON         |                                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:5  |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}   |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}   |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c} |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c} |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                              |
    And I refresh the page
    Then I softly do not see column header "Header" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Currency" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly do not see column header "Checkbox" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Schedule" for title "Review Form Name" against the value "1" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Environment" for title "Review Form Name" against the value "2" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Permits" for title "Review Form Name" against the value "3" inside table "---program:-:ReviewCategoriesTestTableId---"

  @548252 @US-547059
  Scenario: LWC - Grid - PM - To verify that, the hide logic should not be worked from the child table object for the Column of grandchild table when we disable the 'Enable Parent Hide Logic' config at the flex table detail
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,Email__c,URL__c,Lookup__c                                       | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared | Due in Days | TextArea   | TestCurrency | Email           | URL            |
      | Compliance Review | 1               | 2                                         |           | Yes                    | 111         | textarea99 | 1            | vrush@gmail.com | www.google.com |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Compliance Review"
    Then I softly see column header "Order" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Review Form Name" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Weight" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Currency" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Checkbox" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Email" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "URL" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Program" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Picklist" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Phone" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see column header "Text Area" displayed in tableId "---program:-:ReviewCategoriesTestTableId---"

  @548358 @548361 @548363 @548415 @548424 @548426 @US-547059
  Scenario: LWC - Grid - PM - To verify that, the Read Only logic should be worked from the child table object for column of grand-child table.
  |LWC - Grid - PM - To verify that, when a child record meets specific conditions, then Column in the grandchild table should be Read Only for the user.|
  |LWC - Grid - PM - To verify that, when a child record updates the values, then the visibility of grandchild actions should update in real-time.|
  |LWC - Grid - PM - To verify that, after applying Read Only Column JSON using Field left operand on the basis of child object, then Column in the grandchild table should be Read Only for the user.|
  |LWC - Grid - PM - To verify that, the Read Only logic should be worked from the child table object for the Column of grandchild table when we enable the 'Enable Parent Hide Logic' config at the flex table detail|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,Email__c,URL__c,Lookup__c                                       | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared | Due in Days | TextArea   | TestCurrency | Email           | URL            | Program           |
      | Compliance Review | 1               | 2                                         |           | Yes                    | 111         | textarea99 | 1            | vrush@gmail.com | www.google.com | FPG-DOC-NOAA-0001 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Compliance Review"
    When I click on "Edit" icon for "Schedule" inside table
    Then I softly see field "Order__c" on table is input field
    Then I softly see field "Currency__c" on table is input field
    Then I softly see field "Checkbox__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "URL__c" on table is input field
    Then I softly see field "Lookup__c" on table is input field
    Then I softly see field "Picklist__c" on table is input field
    Then I softly see field "Order__c" on table is input field
    Then I softly see field "Weight__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Text__c" on table is input field
    Then I softly see field "Text_Area__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                             | filterId          |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:14 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:15 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:16 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:17 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:18 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:19 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}    |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c}  |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c}  |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestEmail__c}     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestEmail__c}     |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestURL__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestURL__c}       |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestLookup__c}    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestLookup__c}    |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPicklist__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPicklist__c}  |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPhone__c}     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPhone__c}     |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText__c}      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText__c}      |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText_Area__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText_Area__c} |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                               |
    And I refresh the page
    And I pause execution for "5" seconds
    When I click on "Edit" icon for "Schedule" inside table
    Then I softly do not see field "Order__c" on table is input field
    Then I softly do not see field "Currency__c" on table is input field
    Then I softly do not see field "Checkbox__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "URL__c" on table is input field
    Then I softly do not see field "Lookup__c" on table is input field
    Then I softly do not see field "Picklist__c" on table is input field
    Then I softly do not see field "Order__c" on table is input field
    Then I softly do not see field "Weight__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Text__c" on table is input field
    Then I softly do not see field "Text_Area__c" on table is input field

  @548365 @US-547059
  Scenario: LWC - Grid - PM - To verify that, when the child record does not meet any defined condition, then all Column for the grandchild grid should remain visible by default.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,Email__c,URL__c,Lookup__c                                       | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared | Due in Days | TextArea   | TestCurrency | Email           | URL            | Program           |
      | Compliance Review | 1               | 2                                         | Checked   | Yes                    | 111         | textarea99 | 1            | vrush@gmail.com | www.google.com | FPG-DOC-NOAA-0001 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Compliance Review"
    When I click on "Edit" icon for "Schedule" inside table
    Then I softly see field "Order__c" on table is input field
    Then I softly see field "Currency__c" on table is input field
    Then I softly see field "Checkbox__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "URL__c" on table is input field
    Then I softly see field "Lookup__c" on table is input field
    Then I softly see field "Picklist__c" on table is input field
    Then I softly see field "Order__c" on table is input field
    Then I softly see field "Weight__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Text__c" on table is input field
    Then I softly see field "Text_Area__c" on table is input field

  @548381 @548398 @US-547059
  Scenario:LWC - Grid - PM - To verify that, when a child record meets specific conditions, then there should be no impact on grandchild table data
  |LWC - Grid - PM - To verify that, when a child record meets specific conditions, then grandchild table layout remains consistent.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,Email__c,URL__c,Lookup__c                                       | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared | Due in Days | TextArea   | TestCurrency | Email           | URL            | Program           |
      | Compliance Review | 1               | 2                                         | Checked   | Yes                    | 111         | textarea99 | 1            | vrush@gmail.com | www.google.com | FPG-DOC-NOAA-0001 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Compliance Review"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue                             | filterId          |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:13 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:14 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:15 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:16 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:17 |
      | Flex Table List       | Read Only Column JSON    |                                               | ApiGeneratedId:18 |
      | Flex Table List       | Enable Parent Hide Logic | true                                          | ApiGeneratedId:19 |
      | Flex Table            | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestHeader__c}    |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCurrency__c}  |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestCheckbox__c}  |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestEmail__c}     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestEmail__c}     |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestURL__c}       |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestURL__c}       |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestLookup__c}    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestLookup__c}    |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPicklist__c}  |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPicklist__c}  |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPhone__c}     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestPhone__c}     |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText__c}      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText__c}      |
      | Flex Table List       | Read Only Column JSON    | govgrants_config:HCJReviewFormGrandChild                                                                                                            | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText_Area__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                                | ProgramReviewStepPanelTemplates | Name                      | {SavedValue:TestText_Area__c} |
      | Flex Table:General    | Display Field Names      | {SavedValue:ReviewFormsGradChildGridTableDFN},Currency__c,Checkbox__c,Email__c,URL__c,Header__c,Lookup__c,Picklist__c,Phone__c,Text__c,Text_Area__c | ReviewCategoriesTest            |                           |                               |
    And I refresh the page
    And I pause execution for "5" seconds
    When I click on "Edit" icon for "Schedule" inside table
    Then I softly do not see field "Order__c" on table is input field
    Then I softly do not see field "Currency__c" on table is input field
    Then I softly do not see field "Checkbox__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "URL__c" on table is input field
    Then I softly do not see field "Lookup__c" on table is input field
    Then I softly do not see field "Picklist__c" on table is input field
    Then I softly do not see field "Order__c" on table is input field
    Then I softly do not see field "Weight__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Text__c" on table is input field
    Then I softly do not see field "Text_Area__c" on table is input field
    Then I softly see value "Schedule" for title "Review Form Name" against the value "1" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Environment" for title "Review Form Name" against the value "2" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Permits" for title "Review Form Name" against the value "3" inside table "---program:-:ReviewCategoriesTestTableId---"

  @548430 @548432 @US-547059
  Scenario: LWC - Grid - SPI - To verify that, the hide logic should be worked from the parent table object for column of child table.
  |LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then Column in the child table should be hidden from the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN}  | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods    |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c                                 | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2323               | 50      | Step2;Step3     | www.google.com | textarea |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Percent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Number" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Email" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Category Type" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue             | filterId          |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:1  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:BudgetCategories} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table:General    | Display Field Names      | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Percent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Number" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Email" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Category Type" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"

  @548435 @548437 @548449 @548451 @548453 @US-547059
  Scenario: LWC - Grid - SPI - To verify that, when a parent record updates the values, then the visibility of child actions should update in real-time.
  |LWC - Grid - SPI - To verify that, when the parent record does not meet any defined condition, then all Column for the child grid should remain visible by default.|
  |LWC - Grid - SPI - To verify that, after applying Hide Column JSON using Field left operand on the basis of parent object,  then Column in the child table should be hidden from the user.|
  |LWC - Grid - SPI - To verify that, for all datatypes, after applying Hide Column JSON using Field left operand on the basis of parent object, then Column in the child table should be hidden from the user.|
  |LWC - Grid - SPI - To verify that, the hide logic should be worked from the parent table object for the Column of child table when we enable the 'Enable Parent Hide Logic' config at the flex table detail|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN}  | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods    |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c                                 | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2323               | 50      | Step2;Step3     | www.google.com | textarea |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Percent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Number" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Email" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Category Type" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue             | filterId          |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:1  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:BudgetCategories} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table:General    | Display Field Names      | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Percent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Number" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Email" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly do not see column header "Category Type" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2324               | 50      | Step2;Step3     | www.google.com | textarea |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly see column header "URL" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Phone" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Percent" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Number" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Program Income Justification" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Email" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Category Type" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"

  @548441 @548445 @548465 @US-547059
  Scenario: LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then there should be no impact on child/grandchild table data
  |LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then child table layout remains consistent.|
  |LWC - Grid - SPI - To verify that, when the parent record does not meet any defined condition, then all Column for the child grid should remain visible by default.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN}  | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods    |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c                                 | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2323               | 50      | Step2;Step3     | www.google.com | textarea |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue             | filterId          |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:1  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:3  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:5  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:7  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:9  |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:11 |
      | Flex Table List       | Hide Column JSON         |                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:BudgetCategories} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Hide Column JSON         | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table:General    | Display Field Names      | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    Then I softly see value "Administrative and legal expenses" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Architectural and engineering fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Construction" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Contingencies" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Equipment" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Indirect costs" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Land, structures, rights-of-way, appraisals, etc." for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Miscellaneous" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Other architectural and engineering fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Project inspection fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Relocation expenses and payments" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"

  @548460 @548461 @US-547059
  Scenario: LWC - Grid - SPI - To verify that, the Read Only logic should be worked from the parent table object for column of child table.
  |LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then Column in the child table should be Read Only for the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN}  | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods    |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c                                 | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2323               | 50      | Step2;Step3     | www.google.com | textarea |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see field "URL__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Percent__c" on table is input field
    Then I softly see field "Number__c" on table is input field
    Then I softly see field "ProgramIncomeJustification__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "CategoryType__c__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue             | filterId          |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:BudgetCategories} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table:General    | Display Field Names      | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see field "URL__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Percent__c" on table is input field
    Then I softly do not see field "Number__c" on table is input field
    Then I softly do not see field "ProgramIncomeJustification__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "CategoryType__c__c" on table is input field

  @548463 @548476 @548479 @548481 @US-547059
  Scenario: LWC - Grid - SPI - To verify that, when a parent record updates the values, then the visibility of child actions should update in real-time.
    |LWC - Grid - SPI - To verify that, after applying Read Only Column JSON using Field left operand on the basis of parent object, then Column in the child table should be Read Only for the user.|
    |LWC - Grid - SPI - To verify that, for all datatypes, after applying Read Only Column JSON using Field left operand on the basis of parent object,  then Column in the child table should be Read Only for the user.|
    |LWC - Grid - SPI - To verify that, the Read Only logic should be worked from the parent table object for the Column of child table when we enable the 'Enable Parent Hide Logic' config at the flex table detail|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN}  | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods    |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c                                 | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2323               | 50      | Step2;Step3     | www.google.com | textarea |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see field "URL__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Percent__c" on table is input field
    Then I softly see field "Number__c" on table is input field
    Then I softly see field "ProgramIncomeJustification__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "CategoryType__c__c" on table is input field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue             | filterId          |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:BudgetCategories} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table:General    | Display Field Names      | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see field "URL__c" on table is input field
    Then I softly do not see field "Phone__c" on table is input field
    Then I softly do not see field "Percent__c" on table is input field
    Then I softly do not see field "Number__c" on table is input field
    Then I softly do not see field "ProgramIncomeJustification__c" on table is input field
    Then I softly do not see field "Email__c" on table is input field
    Then I softly do not see field "CategoryType__c__c" on table is input field
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2324               | 50      | Step2;Step3     | www.google.com | textarea |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly see field "URL__c" on table is input field
    Then I softly see field "Phone__c" on table is input field
    Then I softly see field "Percent__c" on table is input field
    Then I softly see field "Number__c" on table is input field
    Then I softly see field "ProgramIncomeJustification__c" on table is input field
    Then I softly see field "Email__c" on table is input field
    Then I softly see field "CategoryType__c__c" on table is input field

  @548468 @548472 @US-547059
  Scenario: LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then there should be no impact on child/grandchild table data
    |LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then child table layout remains consistent.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN}  | ApiGeneratedId:6 |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods    |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c                                 | EnhanceAppBudCateGrantorFlexTable |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Sequence Number | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes    |
      | BP01            | 1               | john@yopmail.com | 2323               | 50      | Step2;Step3     | www.google.com | textarea |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue             | filterId          |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:0  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:1  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:2  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:3  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:4  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:5  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:6  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:7  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:8  |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:9  |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:10 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:11 |
      | Flex Table List       | Read Only Column Json    |                               | ApiGeneratedId:12 |
      | Flex Table List       | Enable Parent Hide Logic | true                          | ApiGeneratedId:13 |
      | Flex Table            | Display Field Names      | {SavedValue:BudgetCategories} | ApiGeneratedId:20 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                                                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_URL__c}                        |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Phone__c}                      |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Percent__c}                    |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_ProgramIncomeJustification__c} |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Number__c}                     |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_CategoryType__c}               |
      | Flex Table List       | Read Only Column Json    | govgrants_config:HCJBudgetPeriodChild                                                                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table List       | Enable Parent Hide Logic | true                                                                                                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | {SavedValue:Child_Email__c}                      |
      | Flex Table:General    | Display Field Names      | {SavedValue:BudgetCategories},URL__c,Percent__c,Number__c,CategoryType__c,Email__c,Percent__c,ProgramIncomeJustification__c,Phone__c | EnhanceAppBudCateGrantorFlexTable |                           |                                                  |
    And I refresh the page
    Then I softly see value "Administrative and legal expenses" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Architectural and engineering fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Construction" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Contingencies" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Equipment" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Indirect costs" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Land, structures, rights-of-way, appraisals, etc." for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Miscellaneous" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Other architectural and engineering fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Project inspection fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Relocation expenses and payments" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
