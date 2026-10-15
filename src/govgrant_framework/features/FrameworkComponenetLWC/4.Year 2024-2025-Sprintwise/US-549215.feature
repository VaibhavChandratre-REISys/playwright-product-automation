@Sprint-2025 @US-549215 @Sprint-23 @JuneRelease1 @wip
Feature:GovSBIR - Grid - Support to hide parent table action on the basis of child table value.
Business Need: - GovSBIR - Grid - Support to hide parent table action on the basis of child table value.

  @549280
  Scenario: LWC-Grid-Hide-PM-To verify that parent table top-level actions should be hidden based on child table Field Value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                 | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                          | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:PageLayoutActionChildObjectFieldNumber                       | Grantor State Program | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ProgramTableDFN},ProjectGoals__c,Authorization__c,Abbreviation__c | Programs              |                           |                            |
    When I login to "As a Grantor" app as "PM" user
#    When I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I navigate to "Setup" sub tab
#    And I click on "menu" button inside page details in lwc
#    Then I softly do not see "Test Button" button is displayed

  @549290
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table row-level actions should be hidden based on child table Field Value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                  | ProgramReviewStepTemplates | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelAction | ProgramReviewStepTemplates | Name                      | Test Row Button            |
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
    Then I softly cannot see row level action button "Test Row Button" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549291
  Scenario: LWC-Grid-Hide-PM-To verify that child table row-level actions should be hidden based on Grand child table Field Value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                 | ProgramReviewStepPanelTemplates | Name                      | Test Row Child Button      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ChildRowLevelAction | ProgramReviewStepPanelTemplates | Name                      | Test Row Child Button      |
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
    Then I softly cannot see row level action button "Test Row Child Button" against "Pre-Screen" in flex table with id "---program:-:reviewFormPanelId---"

  @549292
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table row-level actions should be hidden based on double child table Field Value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                   | ProgramReviewStepTemplates | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelBasesOnDoubleChildTable | ProgramReviewStepTemplates | Name                      | Test Row Button            |
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
    Then I softly cannot see row level action button "Test Row Button" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549293
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table top-level actions should be hidden based on double child table Field Value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                   | ProgramReviewStepTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelBasesOnDoubleChildTable | ProgramReviewStepTemplates | Name                      | Test Button                |
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
    Then I softly do not see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549294
  Scenario: LWC-Grid-Hide-PM-To verify that parent table top-level actions should not be hidden based on child table Field value while apply "inverse": true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                    | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                             | ProgramReviewStepTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelActionInverseTrue | ProgramReviewStepTemplates | Name                      | Test Button                |
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
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549297
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table row-level actions should not be hidden based on child table Field value while apply "inverse": true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                   | ProgramReviewStepTemplates | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelActionButtonInverseTrue | ProgramReviewStepTemplates | Name                      | Test Row Button            |
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
    Then I softly can see row level action button "Test Row Button" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549298
  Scenario: LWC-Grid-Hide-PM-To verify that child table row-level actions should not be hidden based on Grand child table Field value while apply "inverse":true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                  | ProgramReviewStepTemplates | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ChildRowLevelActionButtonInverseTrue | ProgramReviewStepTemplates | Name                      | Test Row Button            |
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
    Then I softly can see row level action button "Test Row Child Button" against "Pre-Screen" in flex table with id "---program:-:reviewFormPanelId---"

  @549299
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table row-level actions should not be hidden based on double child table Field value while apply "inverse": true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                   | ProgramReviewStepTemplates | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelActionButtonInverseTrue | ProgramReviewStepTemplates | Name                      | Test Row Button            |
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
    Then I softly can see row level action button "Test Row Button" against "Pre-Screen Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549300
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table top-level actions should not be hidden based on double child table Field value while apply "inverse": true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active            | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue     | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true              | ProgramReviewStepTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON | govgrants_config: | ProgramReviewStepTemplates | Name                      | Test Button                |
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
    Then I softly see top right button "Test Button" inside flex table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549301
  Scenario: LWC-Grid-Hide-PM-To verify that parent table top-level actions should be hidden based on child table Field Value for all data types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue          | filterId         |
      | Page Layout Action    | Is Active            | true                       | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                            | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                   | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                                            | Grantor State Program      | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:ParentTopPageLayoutAllDataTypes                                                | Grantor State Program      | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewStepDFN},Phone__c,SentForReview__c,Email__c,Currency__c,AutTestName__c,URL__c | ProgramReviewStepTemplates |                           |                            |
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
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Step Order | Step Weight (%) | # of Panels | Email            | URL            | X_Sent for Review | Phone      | Currency | AutTestName |
      | 1          | 26              | 1           | test@yopmail.com | www.google.com | True              | 9527371482 | 10000    | textarea123 |
    And I pause execution for "4" seconds
    And I click on "menu" button inside page details in lwc
    Then I softly do not see "Test Button" button is displayed

  @549307
  Scenario: LWC-Grid-Hide-PM-To verify that parent table top-level actions should not be hidden based on child table Field Value for all data types while apply "inverse": true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue          | filterId         |
      | Page Layout Action    | Is Active            | true                       | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                            | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                   | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                                            | Grantor State Program      | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:ParentTopPageLayoutAllDataTypesInverseTrue                                     | Grantor State Program      | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewStepDFN},Phone__c,SentForReview__c,Email__c,Currency__c,AutTestName__c,URL__c | ProgramReviewStepTemplates |                           |                            |
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
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Step Order | Step Weight (%) | # of Panels | Email            | URL            | X_Sent for Review | Phone      | Currency | AutTestName |
      | 1          | 26              | 1           | test@yopmail.com | www.google.com | True              | 9527371482 | 10000    | textarea123 |
    And I pause execution for "4" seconds
    And I click on "menu" button inside page details in lwc
    Then I softly see "Test Button" button is displayed

  @549303
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table row-level actions should be hidden based on child table Field Value for all data types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                          | filterId         |
      | Flex Table Action     | Is Active            | true                                       | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                            | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                                                                                                                | ProgramReviewStepTemplates      | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelActionAllDataType                                                                                                    | ProgramReviewStepTemplates      | Name                      | Test Row Button            |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c,Lookup__c | ProgramReviewStepPanelTemplates |                           |                            |
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
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Form Name         | Step Weight (%) | Due in Days | TextArea   | TestCurrency | Email           | Phone      | URL            |
      | Compliance Review | 99              | 10          | textarea99 | 1000         | vrush@gmail.com | 9527371482 | www.google.com |
    And I pause execution for "4" seconds
    Then I softly cannot see row level action button "Test Row Button" against "SME Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549309
  Scenario: LWC-Grid-Hide-PM-To verify that Parent table row-level actions should not be hidden based on child table Field Value for all data types while apply "inverse":true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                          | filterId         |
      | Flex Table Action     | Is Active            | true                                       | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                            | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                                                                                                                | ProgramReviewStepTemplates      | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelActionAllDataTypeInverseTrue                                                                                         | ProgramReviewStepTemplates      | Name                      | Test Row Button            |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c,Lookup__c | ProgramReviewStepPanelTemplates |                           |                            |
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
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Form Name         | Step Weight (%) | Due in Days | TextArea   | TestCurrency | Email           | Phone      | URL            |
      | Compliance Review | 99              | 10          | textarea99 | 1000         | vrush@gmail.com | 9527371482 | www.google.com |
    And I pause execution for "4" seconds
    Then I softly can see row level action button "Test Row Button" against "SME Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549305
  Scenario:LWC-Grid-Hide-PM-To verify that Parent table row-level actions should be hidden based on double child table Field Value for all data types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                             | filterId         |
      | Flex Table Action     | Is Active            | true                                          | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                               | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn}    | ApiGeneratedId:2 |
      | Flex Table            | Display Field Names  | {SavedValue:ProgramRelatedReviewStepUsersDFN} | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active            | true                                                                                                                                                                        | ProgramReviewStepTemplates      | Name                      | Test Row Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ParentRowLevelActionAllDataTypeInverseTrue                                                                                                                 | ProgramReviewStepTemplates      | Name                      | Test Row Button            |
      | Flex Table:General    | Display Field Names  | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c,Lookup__c                         | ProgramReviewStepPanelTemplates |                           |                            |
      | Flex Table:General    | Display Field Names  | {SavedValue:ProgramRelatedReviewStepUsersDFN},HasSentReview__c,Text__c,Currency__c,Percent__c,Phone__c,Email__c,URL__c,Picklist__c,Text_Area__c,NoOfApplicationsAssigned__c | ProgramRelatedReviewStepUsers   |                           |                            |
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
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Step Weight (%) | Due in Days | TextArea   | TestCurrency | Email           | Phone      | URL            |
      | Compliance Review | 99              | 10          | textarea99 | 1000         | vrush@gmail.com | 9527371482 | www.google.com |
    And I pause execution for "4" seconds
    When I enter the following values into flex table with id "---program:-:addReviewersTableId---" by clicking "Add" :
      | Reviewer       | Has Sent Review | Text      | Currency | Percent | Email        | Phone      | URL                | Text Area |
      | Automation EXE | True            | Text Data | 500      | 67      | pm@gmail.com | 9876543210 | www.salesforce.com | Text Area |
    And I pause execution for "4" seconds
    Then I softly can see row level action button "Test Row Button" against "SME Review" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"

  @549304
  Scenario: LWC-Grid-Hide-PM-To verify that child table row-level actions should be hidden based on Grandchild table Field Value for all data types
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
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    And I pause execution for "5" seconds

  @549313
  Scenario: LWC-Grid-Hide-SPI-To verify that parent table top-level actions should be hidden based on child table Field Value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Table Action     | Is Active            | true                         | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON |                              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                                        | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
      | Flex Table Action     | Is Active            | true                                                                                                                                                                 | ProgramReviewStepTemplates     | Name                      | Top Test Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:                                                                                                                                                    | ProgramReviewStepTemplates     | Name                      | Top Test Button            |
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
      | Budget Period # | Sequence Number | Email              | Fee Fund Requested | Percent | URL           | Notes    |
      | BP01            | 1               | pmtest@yopmail.com | 3000               | 99      | www.gmail.com | textarea |
    And I pause execution for "3" seconds
    Then I softly do not see top right button "Top Test Button" inside flex table "---applicationReview:-:budgetPeriodTableId---"

  @549314
  Scenario: LWC-Grid-Hide-SPI-To verify that parent table top-level actions should not be hidden based on child table Field value while apply "inverse":true
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Table Action     | Is Active            | true                         | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON |                              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                                        | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
      | Flex Table Action     | Is Active            | true                                                                                                                                                                 | ProgramReviewStepTemplates     | Name                      | Test Top Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:                                                                                                                                                    | ProgramReviewStepTemplates     | Name                      | Test Top Button            |
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
      | Budget Period # | Sequence Number | Email              | Fee Fund Requested | Percent | URL           | Notes    |
      | BP01            | 1               | pmtest@yopmail.com | 3000               | 99      | www.gmail.com | textarea |
    And I pause execution for "3" seconds
    Then I softly see top right button "Top Test Button" inside flex table "---applicationReview:-:budgetPeriodTableId---"

  @549318
  Scenario: LWC-Grid-Hide-SPI-To verify that Parent table row-level actions should be hidden based on child table Field Value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Table Action     | Is Active            | true                         | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON |                              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                                        | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,BudgetPeriodTitle__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
      | Flex Table Action     | Is Active            | true                                                                                                                                                                 | ProgramReviewStepTemplates     | Name                      | Top Test Button            |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:                                                                                                                                                    | ProgramReviewStepTemplates     | Name                      | Top Test Button            |
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
      | Budget Period # | Sequence Number | Email              | Fee Fund Requested | Percent | URL           | Notes    |
      | BP01            | 1               | pmtest@yopmail.com | 3000               | 99      | www.gmail.com | textarea |
    And I pause execution for "3" seconds
    Then I softly do not see top right button "Top Test Button" inside flex table "---applicationReview:-:budgetPeriodTableId---"
