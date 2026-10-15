@ModalContext @US-FW-24371
Feature: The user must create an Modal Context at the LWC Object level.
  Test Set - LWC - Test case drafting & QA Verification - Modal - Modal Table Context: Hide Logic Not Working Across All Scenarios

  @FW-24372
  Scenario: LWC - Table - PM - To verify that, top level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactViewConfig        | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:TestAssociateContactContextInView | AssociateProgramContacts        | Name                      | Test Associate Contact     |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see top right button "Test Associate Contact" inside flex table "---program:-:contactsTableId---"

  @FW-24374
  Scenario: LWC - Table - PM - To verify that, row level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactViewConfig        | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditAssociateContactContextInView | AssociateProgramContacts        | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---program:-:associateContactsTableId---"

  @FW-24375
  Scenario: LWC - Table - PM - To verify that, table column should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactViewConfig | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}       | AssociateProgramContacts        |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactViewConfig  | DataTableEnhanceProgramContacts | Name                      | Associate                           |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}        | AssociateProgramContacts        |                           |                                     |
      | Flex Table List       | Hide Column JSON    | govgrants_config:EmailColumnHCJContextInView | AssociateProgramContacts        | Name                      | {SavedValue:Email_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly do not see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"

  @FW-24375_1
  Scenario: LWC - Table - PM - To verify that, table column should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactViewConfig | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}       | AssociateProgramContacts        |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactViewConfig     | DataTableEnhanceProgramContacts | Name                      | Associate                           |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}           | AssociateProgramContacts        |                           |                                     |
      | Flex Table List       | Hide Column JSON    | govgrants_config:EmailColumnHCJContextNotInView | AssociateProgramContacts        | Name                      | {SavedValue:Email_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"

  @FW-24377
  Scenario: LWC - Table - PM - To verify that, top level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactEditConfig        | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:TestAssociateContactContextInEdit | AssociateProgramContacts        | Name                      | Test Associate Contact     |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see top right button "Test Associate Contact" inside flex table "---program:-:contactsTableId---"

  @FW-24378
  Scenario: LWC - Table - PM - To verify that, row level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactEditConfig | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditContactContextInEdit   | AssociateProgramContacts        | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---program:-:associateContactsTableId---"

  @FW-24380
  Scenario: LWC - Table - PM - To verify that, table column should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactEditConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}       | AppLineItems                      |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactEditConfig  | DataTableEnhanceProgramContacts | Name                      | Associate                           |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}        | AssociateProgramContacts        |                           |                                     |
      | Flex Table List       | Hide Column JSON    | govgrants_config:EmailColumnHCJContextInEdit | AssociateProgramContacts        | Name                      | {SavedValue:Email_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly do not see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"

  @FW-24380_1
  Scenario: LWC - Table - PM - To verify that, table column should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactEditConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}       | AppLineItems                      |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactEditConfig     | DataTableEnhanceProgramContacts | Name                      | Associate                           |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}           | AssociateProgramContacts        |                           |                                     |
      | Flex Table List       | Hide Column JSON    | govgrants_config:EmailColumnHCJContextNotInEdit | AssociateProgramContacts        | Name                      | {SavedValue:Email_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---program:-:associateContactsTableId---"

#################### Grid #####################

  @FW-24410
  Scenario: LWC - Grid - PM - To verify that, top level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                               | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                 | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:NewButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON |                                                                 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig      | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON |                                                      | AppLineItems                      | Name                      | New                        |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:NewButtonAppLineItemHEContextInView | AppLineItems                      | Name                      | New                        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly do not see top right button "New" inside flex table "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24411
  Scenario: LWC - Grid - PM - To verify that, row level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig       | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHEContextInView | AppLineItems                      | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly cannot see row level action button "Edit" against "Test" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON |                                                 | AppLineItems                      | Name                      | Edit                       |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly can see row level action button "Edit" against "Test" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24412
  Scenario: LWC - Grid - PM - To verify that, table column should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                 | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN} | AppLineItems       |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                 | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN}            | AppLineItems       |                           |                            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:TitleColumnHCJContextInView | AppLineItems       | Name                      | {SavedValue:Title__c}      |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly do not see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24412_1
  Scenario: LWC - Grid - PM - To verify that, table column should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                 | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN} | AppLineItems       |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                 | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Hide Column JSON    |                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | AppLineItems       |                           |                            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:TitleColumnHCJContextNotInView | AppLineItems       | Name                      | {SavedValue:Title__c}      |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24413
  Scenario: LWC - Grid - PM - To verify that, top level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                               | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                 | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:NewButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig      | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:NewButtonAppLineItemHEContextInEdit | AppLineItems                      | Name                      | New                        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly do not see top right button "New" inside flex table "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24414
  Scenario: LWC - Grid - PM - To verify that, row level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig       | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHEContextInEdit | AppLineItems                      | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly cannot see row level action button "Edit" against "Test" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON |                                                 | AppLineItems                      | Name                      | Edit                       |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly can see row level action button "Edit" against "Test" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24415
  Scenario: LWC - Grid - PM - To verify that, table column should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailViewModeDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailViewModeDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                 | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:TitleColumnHCJContextInEdit    | AppLineItems                      | Name                      | {SavedValue:Title__c}      |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly do not see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24415_1
  Scenario: LWC - Grid - PM - To verify that, table column should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailViewModeDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailViewModeDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                 | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:TitleColumnHCJContextNotInEdit | AppLineItems                      | Name                      | {SavedValue:Title__c}      |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24416
  Scenario: LWC - Table - PM - To verify that, table column should be read only on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactEditConfig | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}       | AssociateProgramContacts        |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:associateContactsTableId---" without waiting for record
    Then I softly see fields "Email" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                                | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactViewConfig  | DataTableEnhanceProgramContacts | Name                      | Associate                           |
      | Flex Table:General    | Display Field Names   | {SavedValue:AssociateContactTableDFN}        | AssociateProgramContacts        |                           |                                     |
      | Flex Table List       | Read Only Column JSON | govgrants_config:EmailColumnHCJContextInView | AssociateProgramContacts        | Name                      | {SavedValue:Email_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:associateContactsTableId---" without waiting for record
    Then I softly do not see fields "Email" is in edit mode

  @FW-24417
  Scenario: LWC - Table - PM - To verify that, table column should be read only on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactEditConfig | DataTableEnhanceProgramContacts | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:AssociateContactTableDFN}       | AssociateProgramContacts        |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:associateContactsTableId---" without waiting for record
    Then I softly see fields "Email" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                              | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:AssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                                | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactEditConfig  | DataTableEnhanceProgramContacts | Name                      | Associate                           |
      | Flex Table:General    | Display Field Names   | {SavedValue:AssociateContactTableDFN}        | AssociateProgramContacts        |                           |                                     |
      | Flex Table List       | Read Only Column JSON | govgrants_config:EmailColumnHCJContextInEdit | AssociateProgramContacts        | Name                      | {SavedValue:Email_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---program:-:associateContactsTableId---" without waiting for record
    Then I softly do not see fields "Email" is in edit mode

  @FW-24418
  Scenario: LWC - Grid - PM - To verify that, table column should be read only on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names  | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table Action     | Hide Expression JSON |                                                 | AppLineItems                      | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly see fields "Title__c" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                                                  | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON  | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailViewModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names   | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table List       | Read Only Column JSON | govgrants_config:TitleColumnHCJContextInView    | AppLineItems                      | Name                      | {SavedValue:Title__c}      |
      | Flex Table Action     | Hide Expression JSON  |                                                 | AppLineItems                      | Name                      | Edit                       |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly do not see fields "Title__c" is in edit mode

  @FW-24419
  Scenario: LWC - Grid - PM - To verify that, table column should be read only on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names  | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table Action     | Hide Expression JSON |                                                 | AppLineItems                      | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly see fields "Title__c" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailViewModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                                                  | ApiGeneratedId:2 |
      | Flex Table Action     | Hide Expression JSON  | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names   | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table List       | Read Only Column JSON | govgrants_config:TitleColumnHCJContextInEdit    | AppLineItems                      | Name                      | {SavedValue:Title__c}      |
      | Flex Table Action     | Hide Expression JSON  |                                                 | AppLineItems                      | Name                      | Edit                       |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly do not see fields "Title__c" is in edit mode

   ############### SPI ##################################
  ########## Grid ###########
  @FW-24420
  Scenario: LWC - Grid - SPI - To verify that, top level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig      | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:NewButtonAppLineItemHEContextInView | AppLineItems                      | Name                      | New Test                   |
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
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly do not see top right button "New Test" inside flex table "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24421
  Scenario: LWC - Grid - SPI - To verify that, row level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig       | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHEContextInView | AppLineItems                      | Name                      | Edit                       |
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
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly cannot see row level action button "Edit" against "Test" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24423
  Scenario: LWC - Grid - SPI - To verify that, top level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                 | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig      | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:NewButtonAppLineItemHEContextInEdit | AppLineItems                      | Name                      | New Test                   |
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
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly do not see top right button "New Test" inside flex table "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24424
  Scenario: LWC - Grid - SPI - To verify that, row level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig       | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHEContextInEdit | AppLineItems                      | Name                      | Edit                       |
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
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly cannot see row level action button "Edit" against "Test" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24425
  Scenario: LWC - Grid - SPI - To verify that, table column should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names  | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table Action     | Hide Expression JSON |                                                 | AppLineItems                      | Name                      | Edit                       |
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
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    Then I softly see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailEditModeDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                 | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table List       | Hide Column JSON    | govgrants_config:TitleColumnHCJContextInEdit    | AppLineItems                      | Name                      | {SavedValue:Title__c}      |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    Then I softly do not see column header "Title" displayed in tableId "---applicationReview:-:addLineItemsModalTableId---"

  @FW-24426
  Scenario: LWC - Grid - SPI - To verify that, table column should be read only on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailViewModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names  | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table Action     | Hide Expression JSON |                                                 | AppLineItems                      | Name                      | Edit                       |
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
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly see fields "Title__c" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailEditModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                                                  | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON  | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailViewModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names   | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table List       | Read Only Column JSON | govgrants_config:TitleColumnHCJContextInView    | AppLineItems                      | Name                      | {SavedValue:Title__c}      |
      | Flex Table Action     | Hide Expression JSON  |                                                 | AppLineItems                      | Name                      | Edit                       |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly do not see fields "Title__c" is in edit mode

  @FW-24427
  Scenario: LWC - Grid - SPI - To verify that, table column should be read only on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names  | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names  | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table Action     | Hide Expression JSON |                                                 | AppLineItems                      | Name                      | Edit                       |
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
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative |
      | Test  | Data      |
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly see fields "Title__c" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailEditModeDefaultConfig                  | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:AppLineItemsTableDFN}                                | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                                                  | ApiGeneratedId:1 |
      | Flex Table Action     | Hide Expression JSON  | govgrants_config:EditButtonAppLineItemHideExpreesionDefaultConfg | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AddDetailEditModeDefaultConfig | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Table:General    | Display Field Names   | {SavedValue:AppLineItemsTableDFN}               | AppLineItems                      |                           |                            |
      | Flex Table List       | Read Only Column JSON | govgrants_config:TitleColumnHCJContextInView    | AppLineItems                      | Name                      | {SavedValue:Title__c}      |
      | Flex Table Action     | Hide Expression JSON  |                                                 | AppLineItems                      | Name                      | Edit                       |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without waiting for record
    Then I softly do not see fields "Title__c" is in edit mode

  @FW-24428
  Scenario: LWC - Table - SPI - To verify that, top level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIViewConfig     | AppContact              | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:TestAssociateContactContextInView | AssociatePreAppContacts | Name                      | Test Associate Contact     |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see top right button "Test Associate Contact" inside flex table "---preApplication:-:associatePreAppContactsTableId---"

  @FW-24429
  Scenario: LWC - Table - SPI - To verify that, row level action should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIViewConfig     | AppContact              | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditAssociateContactContextInView | AssociatePreAppContacts | Name                      | Edit                       |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly cannot see row level action button "Edit" against "Recipient" in flex table with id "---preApplication:-:associatePreAppContactsTableId---"

  @FW-24430
  Scenario: LWC - Table - SPI - To verify that, table column should be hidden on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIViewConfig | AppContact              | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                            |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---preApplication:-:associatePreAppContactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIViewConfig | AppContact              | Name                      | Associate                              |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                                        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:EmailColumnHCJContextInView   | AssociatePreAppContacts | Name                      | {SavedValue:SPIEmail_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly do not see column header "Email" displayed in tableId "---preApplication:-:associatePreAppContactsTableId---"

  @FW-24431
  Scenario: LWC - Table - SPI - To verify that, top level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIEditConfig     | AppContact              | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:TestAssociateContactContextInEdit | AssociatePreAppContacts | Name                      | Test Associate Contact     |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see top right button "Test Associate Contact" inside flex table "---preApplication:-:associatePreAppContactsTableId---"

  @FW-24432
  Scenario: LWC - Table - SPI - To verify that, row level action should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON |                                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC  | govgrants_config:AssociateContactSPIEditConfig     | AppContact              | Name                      | Associate                  |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:EditAssociateContactContextInView | AssociatePreAppContacts | Name                      | Edit                       |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly cannot see row level action button "Edit" against "Recipient" in flex table with id "---preApplication:-:associatePreAppContactsTableId---"

  @FW-24433
  Scenario: LWC - Table - SPI - To verify that, table column should be hidden on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIEditConfig | AppContact              | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                            |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly see column header "Email" displayed in tableId "---preApplication:-:associatePreAppContactsTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Hide Column JSON    |                                                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIEditConfig | AppContact              | Name                      | Associate                              |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                                        |
      | Flex Table List       | Hide Column JSON    | govgrants_config:EmailColumnHCJContextInEdit   | AssociatePreAppContacts | Name                      | {SavedValue:SPIEmail_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    Then I softly do not see column header "Email" displayed in tableId "---preApplication:-:associatePreAppContactsTableId---"

  @FW-24434
  Scenario: LWC - Table - SPI - To verify that, table column should be read only on view context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIViewConfig | AppContact              | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                            |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Recipient" inside flex table with id "---preApplication:-:associatePreAppContactsTableId---" without waiting for record
    Then I softly see fields "Email" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactSPIViewConfig | AppContact              | Name                      | Associate                              |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                                        |
      | Flex Table List       | Read Only Column JSON | govgrants_config:EmailColumnHCJContextInView   | AssociatePreAppContacts | Name                      | {SavedValue:SPIEmail_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Recipient" inside flex table with id "---preApplication:-:associatePreAppContactsTableId---" without waiting for record
    Then I softly do not see fields "Email" is in edit mode

  @FW-24435
  Scenario: LWC - Table - SPI - To verify that, table column should be read only on edit context of modal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AssociateContactSPIEditConfig | AppContact              | Name                      | Associate                  |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                            |
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Recipient" inside flex table with id "---preApplication:-:associatePreAppContactsTableId---" without waiting for record
    Then I softly see fields "Email" is in edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                 | filterId         |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactSPIDefaultConfig | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names   | {SavedValue:SPIAssociateContactTableDFN}          | ApiGeneratedId:1 |
      | Flex Table List       | Read Only Column JSON |                                                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                  | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Flex Table Action     | Action URL Long LWC   | govgrants_config:AssociateContactSPIEditConfig | AppContact              | Name                      | Associate                              |
      | Flex Table:General    | Display Field Names   | {SavedValue:SPIAssociateContactTableDFN}       | AssociatePreAppContacts |                           |                                        |
      | Flex Table List       | Read Only Column JSON | govgrants_config:EmailColumnHCJContextInEdit   | AssociatePreAppContacts | Name                      | {SavedValue:SPIEmail_AssociateContact} |
    And I refresh the page
    And I pause execution for "4" seconds
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see "Associate Contacts" opens in overLay window
    And I click on "Edit" icon for "Recipient" inside flex table with id "---preApplication:-:associatePreAppContactsTableId---" without waiting for record
    Then I softly do not see fields "Email" is in edit mode

