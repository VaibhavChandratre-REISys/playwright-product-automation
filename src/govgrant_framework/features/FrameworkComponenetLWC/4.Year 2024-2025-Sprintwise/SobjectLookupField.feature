@AprilReleaseUserStory1 @Sprint-2026 @SobjectLookupField

Feature: In this feature we are provide Display field name as per requirement and validate this display on UI Lookup field
Business Need:In this feature we are provide Display field name as per requirement and validate this display on UI Lookup field Display Field Not Working Correctly in Flex Table Detail Configuration

1.@US-FW-24158 - Test Set - LWC - Test case drafting - Table/Grid - Display Field Not Working Correctly in Flex Table Detail Configuration
2.@US-FW-24367 - LWC - Test Set - Layout, Form - Support for breadcrumbs.

  @FW-24159 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, lookup displays configured Display Field in View mode after save
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                              |
      | Flex Table List       | Display Field       | SupportYear__c                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On View All Lookup field with api name "BudgetPeriod__r.SupportYear__c" flextable with id "---program:-:contactsTableId---"
    When I perform quick search for "BP01" in "lookupTable" panel
    Then I softly see value "BP01" for title "Support Year" inside table "lookupTable"
    And I select value "BP01" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see value "BP01" for title "Budget Period" inside table "---program:-:contactsTableId---"

  @FW-24163 @US-FW-24158
  Scenario:LWC - Table - PM - To verify that, lookup displays configured Display Field in Edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                              |
      | Flex Table List       | Display Field       | SupportYear__c                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On Lookup field with api name "BudgetPeriod__r.SupportYear__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | Support Year |

  @FW-24165 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, lookup displays configured Display Field after page refresh
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:1 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                              |
      | Flex Table List       | Display Field       |                                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c} |
      | Flex Table List       | Display Field       | ProgramName__c                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}      |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.ProgramName__c"
    And I click On Lookup field with api name "Program__r.ProgramName__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | Program Name |
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.ProgramName__c"
    And I click On Lookup field with api name "Program__r.ProgramName__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | Program Name |

  @FW-24167 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, changing display field, record updates lookup
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List       | Display Field       | FocusAreaRequired__c                    | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.FocusAreaRequired__c"
    And I click On Lookup field with api name "Program__r.FocusAreaRequired__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | FocusAreaRequired |


  @FW-24169 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, multiple rows display correct lookup values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                              | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                            | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       | FocusAreaRequired__c                    | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                      | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM1 Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.FocusAreaRequired__c"
    And I click On Lookup field with api name "Program__r.FocusAreaRequired__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | FocusAreaRequired |
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.FocusAreaRequired__c"
    And I click On Lookup field with api name "Program__r.FocusAreaRequired__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | FocusAreaRequired |
    And I click on "Edit" icon for "{SavedValue:PM1 Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.FocusAreaRequired__c"
    And I click On Lookup field with api name "Program__r.FocusAreaRequired__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | FocusAreaRequired |

  @FW-24170 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, formula (text) fieldworks when configured as Display Field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                              | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                            | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       | PrimaryFunderType__c                    | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                      | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.PrimaryFunderType__c"
    And I click On Lookup field with api name "Program__r.PrimaryFunderType__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | Primary Funder Type |

  @FW-24171 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, when Display Field is blank then it should display lookup field values based on the configured SObject when an SObject is specified.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                         | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       |                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                      | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.Name"
    And I click On Lookup field with api name "Program__r.Name" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | EGMS ID              |
      | Assistance Listing # |
      | Program Title        |
      | B_Agency             |

  @FW-24172 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, invalid Display Field API name
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                         | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN}   | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       | PrimaryFunderType__c,FocusAreaRequired__c | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                        | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    Then I softly see Exception thrown with text "Exception : PrimaryFunderType__c,FocusAreaRequired__c field is not defined on Program__c StackTrace "

  @FW-24173 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, lookup when referenced record is deleted, Lookup handles missing record gracefully.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                         | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN}   | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       | PrimaryFunderType__c,FocusAreaRequired__c | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                        | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds

  @FW-24174 @FW-24178 @FW-24179 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, Lookup search continues to work correctly.
  |LWC - Table - PM - To verify that, display Field continues to display correctly after logout/login|
  |LWC - Table - PM - To verify that, Lookup values load successfully when SObject is configured correctly|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                         | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       |                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                      | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On Lookup field with api name "Program__r.PublishedDate__c" flextable with id "---program:-:contactsTableId---"
    Then I softly do not see lookup table header displayed as below
      | EGMS ID              |
      | Assistance Listing # |
      | Program Title        |
      | B_Agency             |

  @FW-24175 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, Record selection works successfully.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       | KPIsRequired__c                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                      | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On View All Lookup field with api name "BudgetPeriod__r.KPIsRequired__c" flextable with id "---program:-:contactsTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "KPI's Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see value "Yes" for title "Program" inside table "---program:-:contactsTableId---"

  @FW-24176 @FW-24177 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, Lookup Display Field remains unchanged unless we removed value from display field
  |LWC - Table - PM - To verify that, lookup display correct display field value after browser refresh|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                              | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                            | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table List              | Display Field       | FocusAreaRequired__c                    | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}    |
      | Page Block:Page Block Detail | Sort Order          | -1                                      | Grantor State Program           | Name                      | PB-11436                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM1 Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on remove for lookup from field "Program__r.FocusAreaRequired__c"
    And I refresh the page
    Then I softly see value "Yes" for title "Program" inside table "---program:-:contactsTableId---"

  @FW-24181 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, after click on remove selected option, display field should display properly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:1 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                              |
      | Flex Table List       | Display Field       |                                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c} |
      | Flex Table List       | Display Field       | ProgramName__c                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}      |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see remove x icon for lookup field "Program__r.ProgramName__c"
    And I click on remove for lookup from field "Program__r.ProgramName__c"
    And I click On Lookup field with api name "Program__r.ProgramName__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | Program Name |

  @FW-24182 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, after click on undo, display field should display properly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names | Program__c,BudgetPeriod__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:1 |
      | Flex Table List       | Display Field       |                                                         | ApiGeneratedId:2 |
      | Page Block            | Sort Order          | 3                                                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General           | Display Field Names | Program__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                              |
      | Flex Table List              | Display Field       |                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c} |
      | Flex Table List              | Display Field       | KPIsRequired__c                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Program__c}      |
      | Page Block:Page Block Detail | Sort Order          | -1                                      | Grantor State Program           | Name                      | PB-11436                     |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see remove x icon for lookup field "Program__r.KPIsRequired__c"
    And I click on remove for lookup from field "Program__r.KPIsRequired__c"
    And I click On Lookup field with api name "Program__r.KPIsRequired__c" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | KPI's Required |
    Then I softly see Undo icon for lookup field "Program__r.KPIsRequired__c"
    And I click on undo for lookup from field "Program__r.KPIsRequired__c"
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see value "Yes" for title "Program" inside table "---program:-:contactsTableId---"

  @FW-24244 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, lookup displays configured Display Field in View mode after save
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                  | filterId         |
      | Flex Table            | Display Field Names | PageTemplateConfig__c,{SavedValue:ApproversInResponsibilities.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                      | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names | PageTemplateConfig__c,{SavedValue:ApproversInResponsibilities.dfn} | ProgramRolesAndResponsibilitiesInternalProgram |                           |                                    |
      | Flex Table List       | Display Field       | GNT__RecordTypeDeveloperName__c                                    | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:PageTemplateConfig__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "PageTemplateConfig__r.GNT__RecordTypeDeveloperName__c" flextable with id "---program:-:approverTableId---"
    When I perform quick search for "BusinessForm" in "lookupTable" panel
    Then I softly see value "BusinessForm" for title "Record Type Developer Name" inside table "lookupTable"

  @FW-24245 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, lookup displays configured Display Field in Edit mode
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                  | filterId         |
      | Flex Table            | Display Field Names | PageTemplateConfig__c,{SavedValue:ApproversInResponsibilities.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                      | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names | PageTemplateConfig__c,{SavedValue:ApproversInResponsibilities.dfn} | ProgramRolesAndResponsibilitiesInternalProgram |                           |                                    |
      | Flex Table List       | Display Field       | GNT__RecordTypeDeveloperName__c                                    | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:PageTemplateConfig__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:approverTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "PageTemplateConfig__r.GNT__RecordTypeDeveloperName__c" flextable with id "---program:-:approverTableId---"
    When I perform quick search for "BusinessForm" in "lookupTable" panel
    Then I softly see value "BusinessForm" for title "Record Type Developer Name" inside table "lookupTable"
    And I select value "BusinessForm" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    Then I softly see value "BusinessForm" for title "Page Template Config" inside table "---program:-:approverTableId---"

  @FW-24255 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, Lookup search continues to work correctly.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                  | filterId         |
      | Flex Table            | Display Field Names | PageTemplateConfig__c,{SavedValue:ApproversInResponsibilities.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                    | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                      | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names | PageTemplateConfig__c,{SavedValue:ApproversInResponsibilities.dfn} | ProgramRolesAndResponsibilitiesInternalProgram |                           |                                    |
      | Flex Table List       | Display Field       | GNT__RecordTypeDeveloperName__c                                    | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:PageTemplateConfig__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Page Template Config | Name          | Program |
      | BusinessForm         | Automation PM | Step 1  |
    Then I softly see value "BusinessForm" for title "Page Template Config" inside table "---program:-:approverTableId---"

  @FW-24256 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, Record selection works successfully.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                |
      | Flex Table List       | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | X_Next Review Step         | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | TestAutomationOrganization | 4          | Test Description | Test      | 0               | 1           |
    Then I softly see value "TestAutomationOrganization" for title "X_Next Review Step" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @FW-24257 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, Lookup Display Field remains unchanged unless we removed value from display field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                                             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                    |
      | Flex Table List              | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c}     |
      | Page Block:Page Block Detail | Sort Order          | -1                                                            | Grantor State Program      | Name                      | {SavedValue:StepReviewPageBlockId} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | X_Next Review Step         | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | TestAutomationOrganization | 4          | Test Description | Test      | 0               | 1           |
    Then I softly see value "TestAutomationOrganization" for title "X_Next Review Step" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on "Edit" icon for "Test Description" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "TestAutomationOrganization" for title "X_Next Review Step" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on "Edit" icon for "Test Description" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on remove for lookup from field "NextReviewStep__r.RoleCode__c"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly do not see value "TestAutomationOrganization" for title "X_Next Review Step" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @FW-24258 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, lookup display correct display field value after browser refresh
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                                             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                    |
      | Flex Table List              | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c}     |
      | Page Block:Page Block Detail | Sort Order          | -1                                                            | Grantor State Program      | Name                      | {SavedValue:StepReviewPageBlockId} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | X_Next Review Step         | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | TestAutomationOrganization | 4          | Test Description | Test      | 0               | 1           |
    Then I softly see value "TestAutomationOrganization" for title "X_Next Review Step" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on "Edit" icon for "Test Description" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on remove for lookup from field "NextReviewStep__r.RoleCode__c"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly do not see value "TestAutomationOrganization" for title "X_Next Review Step" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I refresh the page
    And I click on "Edit" icon for "Test Description" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |

  @FW-24259 @FW-24261 @US-FW-24158
  Scenario:LWC - Grid - PM - To verify that, display Field continues to display correctly after logout/login
  |LWC - Grid - PM - To verify that, after click on remove selected option, display field should display properly|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                                             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                    |
      | Flex Table List              | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c}     |
      | Page Block:Page Block Detail | Sort Order          | -1                                                            | Grantor State Program      | Name                      | {SavedValue:StepReviewPageBlockId} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | X_Next Review Step         | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | TestAutomationOrganization | 4          | Test Description | Test      | 0               | 1           |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Test Description" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on remove for lookup from field "NextReviewStep__r.RoleCode__c"
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |

  @FW-24262 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, after click on undo, display field should display properly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                                             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                    |
      | Flex Table List              | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c}     |
      | Page Block:Page Block Detail | Sort Order          | -1                                                            | Grantor State Program      | Name                      | {SavedValue:StepReviewPageBlockId} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | X_Next Review Step         | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | TestAutomationOrganization | 4          | Test Description | Test      | 0               | 1           |
    And I click on "Edit" icon for "Test Description" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on remove for lookup from field "NextReviewStep__r.RoleCode__c"
    Then I softly see Undo icon for lookup field "NextReviewStep__r.RoleCode__c"
    And I click on undo for lookup from field "NextReviewStep__r.RoleCode__c"
    And I refresh the page
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |

  @FW-24263 @FW-24280 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, lookup displays configured Display Field in View mode after save
  |LWC - Grid - SPI - To verify that, after click on remove selected option, display field should display properly|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "Budget Period Closeout Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click on remove for lookup from field "ClonedFrom__r.BudgetPeriodCloseoutRequired__c"
    And I click On Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see lookup table header displayed as below
      | Budget Period Closeout Required |

  @FW-24264 @FW-24270 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, lookup displays configured Display Field in Edit mode
  |LWC - Grid - SPI - To verify that, formula (text) datatype fields works when configured as Display Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click On Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see lookup table header displayed as below
      | Budget Period Closeout Required |

  @FW-24265 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, lookup displays correct display value after saving the form

  @FW-24266 @FW-24267 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, lookup displays configured Display Field after page refresh
  |LWC - Grid - SPI - To verify that, newly added row displays configured Display Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click On Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see lookup table header displayed as below
      | Budget Period Closeout Required |
    And I refresh the page
    When I navigate to "Budget" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click On Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see lookup table header displayed as below
      | Budget Period Closeout Required |

  @FW-24268 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, changing display field, record updates lookup
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodTitle__c                       | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click On Lookup field with api name "ClonedFrom__r.BudgetPeriodTitle__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see lookup table header displayed as below
      | Budget Period Title |

  @FW-24271 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, when Display Field is blank then it should display lookup field values based on the configured SObject when an SObject is specified.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       |                                            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click On Lookup field with api name "ClonedFrom__r.BudgetPeriodTitle__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see lookup table header displayed as below
      | Budget Period # |
      | Support Year    |
      | Start Date      |
      | End Date        |
      | Status          |

  @FW-24272 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, invalid Display Field API name
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       |                                            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    When I navigate to "Budget" sub tab
    Then I softly see Exception thrown with text "Exception : BudgetPeriod__c,Award__c field is not defined on BudgetPeriod__c"

  @FW-24274 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, Lookup search continues to work correctly.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | Cloned From |
      | BP01            | Yes         |
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @FW-24275 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, Record selection works successfully.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "Budget Period Closeout Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @FW-24276 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, Lookup Display Field remains unchanged unless we removed value from display field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "Budget Period Closeout Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click on remove for lookup from field "ClonedFrom__r.BudgetPeriodCloseoutRequired__c"
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @FW-24277 @FW-24278 @FW-24279 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, lookup display correct display field value after browser refresh
  |LWC - Grid - SPI - To verify that, display Field continues to display correctly after logout/login|
  |LWC - Grid - SPI - To verify that, Lookup values load successfully when SObject is configured correctly|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "Budget Period Closeout Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click on remove for lookup from field "ClonedFrom__r.BudgetPeriodCloseoutRequired__c"
    And I refresh the page
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @FW-24281 @FW-24212 @US-FW-24158
  Scenario: LWC - Grid - SPI - To verify that, after click on undo, display field should display properly
  |LWC - Table - SPI - To verify that, lookup displays configured Display Field in View mode after save|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "Budget Period Closeout Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I click on remove for lookup from field "ClonedFrom__r.BudgetPeriodCloseoutRequired__c"
    And I click on undo for lookup from field "ClonedFrom__r.BudgetPeriodCloseoutRequired__c"
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @FW-24962 @US-FW-24158
  Scenario: LWC - Table - PM - To verify that, reference datatype field works when configured as Display Field

  @FW-24213 @FW-24216 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, lookup displays configured Display Field in Edit mode
  |LWC - Table - SPI - To verify that, newly added row displays configured Display Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I pause execution for "5" seconds
    When I navigate to "Budget" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "Budget Period Closeout Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @FW-24214 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, lookup displays correct display value after saving the form

  @FW-24215 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, lookup displays configured Display Field after page refresh
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | BudgetPeriodCloseoutRequired__c            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I pause execution for "5" seconds
    When I navigate to "Budget" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On View All Lookup field with api name "ClonedFrom__r.BudgetPeriodCloseoutRequired__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    When I perform quick search for "Yes" in "lookupTable" panel
    Then I softly see value "Yes" for title "Budget Period Closeout Required" inside table "lookupTable"
    And I select value "Yes" from "lookupTable" on lookup table modal
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I refresh the page
    Then I softly see value "Yes" for title "Cloned From" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @FW-24217 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, changing display field, record updates lookup
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                            | ApiGeneratedId:1 |
      | Page Block            | Sort Order          | 3                                          | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName           | fieldNewValue                              | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General           | Display Field Names | {SavedValue:BudgetPeriodDFN},ClonedFrom__c | EnhanceAppGrantorBudgetPeriods |                           |                                    |
      | Flex Table List              | Display Field       | Email__c                                   | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ClonedFrom__c}         |
      | Page Block:Page Block Detail | Sort Order          | -1                                         | Recipient ApplicationView      | Name                      | {SavedValue:BudgetPeriodPageBlock} |
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
    And I pause execution for "5" seconds
    When I navigate to "Budget" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click On Lookup field with api name "ClonedFrom__r.Email__c" flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see lookup table header displayed as below
      | Email |
    Then I softly do not see lookup table header displayed as below
      | Budget Period # |
      | Support Year    |
      | Start Date      |
      | End Date        |
      | Status          |

  @FW-24219 @US-FW-24158
  Scenario:  LWC - Table - SPI - To verify that, formula (text) datatype fields works when configured as Display Field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                              | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                            |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | AnnouncementsExternalActive |                           |                                                       |
      | Flex Table List       | Display Field       | TypeFormula__c                                                 | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableProgram__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click on remove for lookup from field "Program__r.TypeFormula__c"
    And I click On Lookup field with api name "Program__r.TypeFormula__c" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Type |

  @FW-24220 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, when Display Field is blank then it should display lookup field values based on the configured SObject when an SObject is specified.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Approver4__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                              |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Approver4__c | AnnouncementsExternalActive |                           |                                                         |
      | Flex Table List       | Display Field       |                                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableApprover4__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "Approver4__r.Name" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Full Name         |
      | Organization Name |

  @FW-24222 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, invalid Display Field API name
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                              | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                            |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | AnnouncementsExternalActive |                           |                                                       |
      | Flex Table List       | Display Field       | Test__c                                                        | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableProgram__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    Then I softly see Exception thrown with text "Exception : Test__c field is not defined on Program__c "

  @FW-24246 @FW-24247 @FW-24248 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, lookup displays correct display value after saving the form
  |LWC - Grid - PM - To verify that, lookup displays configured Display Field after page refresh|
  |LWC - Grid - PM - To verify that, newly added row displays configured Display Field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                |
      | Flex Table List       | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "New" :
      | X_Next Review Step         | Step Order | Description      | Step Name | Step Weight (%) | # of Panels |
      | TestAutomationOrganization | 4          | Test Description | Test      | 0               | 1           |
    And I click on "Edit" icon for "TestAutomationOrganization" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I refresh the page
    And I click on remove for lookup from field "NextReviewStep__r.RoleCode__c"
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |

  @FW-24249 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, changing display field, record updates lookup
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                |
      | Flex Table List       | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On Lookup field with api name "NextReviewStep__r.Email__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | Email |

  @FW-24250 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, multiple rows display correct lookup values
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                |
      | Flex Table List       | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |
    And I click on "Edit" icon for "SME Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |
    And I click on "Edit" icon for "Management Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |

  @FW-24251 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, formula (text) datatype fields works when configured as Display Field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                |
      | Flex Table List       | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click On Lookup field with api name "NextReviewStep__r.RoleCode__c" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | B_Role Code |

  @FW-24252 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, when Display Field is blank then it should display lookup field values based on the configured SObject when an SObject is specified.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                |
      | Flex Table List       | Display Field       | RoleCode__c                                                   | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click On Lookup field with api name "NextReviewStep__r.Name" flextable with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see lookup table header displayed as below
      | Name |

  @FW-24253 @Bug-FW-24549 @US-FW-24158
  Scenario: LWC - Grid - PM - To verify that, invalid Display Field API name
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                             | filterId         |
      | Flex Table            | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                               | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | NextReviewStep__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                                |
      | Flex Table List       | Display Field       | Test__c                                                       | ProgramReviewStepTemplates | Name                      | {SavedValue:NextReviewStep__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    Then I softly see Exception thrown with text "Exception : Test__c field is not defined on ReviewStep__c StackTrace"

  @FW-24224 @Bug-FW-24549 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, Lookup search continues to work correctly.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                              | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                            |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | AnnouncementsExternalActive |                           |                                                       |
      | Flex Table List       | Display Field       | CFDASource__c                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableProgram__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click on remove for lookup from field "Program__r.CFDASource__c"
    And I click On Lookup field with api name "Program__r.CFDASource__c" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Assistance Listing # Source |

  @FW-24224 @Bug-FW-24549 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, Lookup search continues to work correctly.

  @FW-24225 @Bug-FW-24549 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, Record selection works successfully.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                              | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                            |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | AnnouncementsExternalActive |                           |                                                       |
      | Flex Table List       | Display Field       | CFDASource__c                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableProgram__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click on remove for lookup from field "Program__r.CFDASource__c"
    And I click On Lookup field with api name "Program__r.CFDASource__c" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Assistance Listing # Source |

  @FW-24226 @Bug-FW-24549 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, Lookup Display Field remains unchanged unless we removed value from display field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                              | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                            |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | AnnouncementsExternalActive |                           |                                                       |
      | Flex Table List       | Display Field       | CFDASource__c                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableProgram__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click on remove for lookup from field "Program__r.CFDASource__c"
    And I click On Lookup field with api name "Program__r.CFDASource__c" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Assistance Listing # Source |

  @FW-24227 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, lookup display correct display field value after browser refresh
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Approver4__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                              |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Approver4__c | AnnouncementsExternalActive |                           |                                                         |
      | Flex Table List       | Display Field       |                                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableApprover4__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "Approver4__r.Name" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Full Name         |
      | Organization Name |
    And I refresh the page
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "Approver4__r.Name" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Full Name         |
      | Organization Name |

  @FW-24230 @FW-24229 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, Lookup values load successfully when SObject is configured correctly
  |LWC - Table - SPI - To verify that, display Field continues to display correctly after logout/login|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Approver4__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                              |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Approver4__c | AnnouncementsExternalActive |                           |                                                         |
      | Flex Table List       | Display Field       |                                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableApprover4__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "Approver4__r.Name" flextable with id "---applicationIntake:-:publishedOpputunityTableId---"
    Then I softly see lookup table header displayed as below
      | Full Name         |
      | Organization Name |

  @FW-24231 @Bug-FW-24549 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, after click on remove selected option, display field should display properly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                              | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                            |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | AnnouncementsExternalActive |                           |                                                       |
      | Flex Table List       | Display Field       | CFDASource__c                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableProgram__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    Then I softly see remove x icon for lookup field "Program__r.KPIsRequired__c"
    And I click on remove for lookup from field "Program__r.CFDASource__c"
    Then I softly see Undo icon for lookup field "Program__r.CFDASource__c"

  @FW-24232 @Bug-FW-24549 @US-FW-24158
  Scenario: LWC - Table - SPI - To verify that, after click on undo, display field should display properly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                              | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | ApiGeneratedId:0 |
      | Flex Table List       | Display Field       |                                                                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue                            |
      | Flex Table:General    | Display Field Names | {SavedValue:SPIPublishedOpportunitiesPhaseLevelDFN},Program__c | AnnouncementsExternalActive |                           |                                                       |
      | Flex Table List       | Display Field       | CFDASource__c                                                  | AnnouncementsExternalActive | Name                      | {SavedValue:SPIPublishedOpportunitiesTableProgram__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    And I click on "Edit" action for first record of table
    And I click on remove for lookup from field "Program__r.CFDASource__c"
    Then I softly see Undo icon for lookup field "Program__r.CFDASource__c"
    And I click on undo for lookup from field "Program__r.CFDASource__c"

  @FW-24368 @FW-24391 @FW-24398 @FW-24402 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that user should be able to enable Breadcrumbs record layout
  |LWC - Breadcrumbs - PM - To verify that user should be able to enable Breadcrumbs record layout|
  |LWC - Breadcrumbs - Admin - To verify that the current path in breadcrumbs should be display as plain text in black color|
  |LWC - Breadcrumbs - PM - To verify that the current path in breadcrumbs should be display as plain text in black color|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "Automation Breadcrumb Program" into field "ProgramName__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see the breadcrumb withoutlink "Automation Breadcrumb Program" is displayed
    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24452 @FW-24453 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that the previous path in breadcrumbs should be in blue color and clickable hyperlink
  |LWC - Breadcrumbs - PM - To verify that the previous path in breadcrumbs should be in blue color and clickable hyperlink|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "Automation Breadcrumb Program" into field "ProgramName__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    Then I see the breadcrumb link "Automation Breadcrumb Program" is displayed
    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24469 @FW-24471 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - PM - To verify that the field value should be display in the breadcrumbs path which is added in Field to Display in Breadcrumbs in flexi page
  |LWC - Breadcrumbs - Admin - To verify that the user should be redirected to respective page when clicks on previous step in breadcrumbs|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "Automation Breadcrumb Program" into field "ProgramName__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see the breadcrumb withoutlink "Automation Breadcrumb Program" is displayed
    And I click on hyperlink containing value "Test Automation Organization"
    Then I see the breadcrumb withoutlink "Automation Breadcrumb Program" is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24472 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - PM - To verify that the user should be redirected to respective page when clicks on previous step in breadcrumbs
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "Automation Breadcrumb Pro" into field "ProgramName__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    Then I see the breadcrumb link "Automation Breadcrumb Pro" is displayed
    And I click on hyperlink containing value "Automation Breadcrumb Pro"
    Then I see the breadcrumb withoutlink "Automation Breadcrumb Pro" is displayed

    Examples:
      | Users |
      | PM    |

  @FW-24473 @FW-24474 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that the if character count is more than 30 then elipsis should be display after 30 characters in breadcrumbs navigation step
  |LWC - Breadcrumbs - PM - To verify that the if character count is more than 30 then elipsis should be display after 30 characters in breadcrumbs navigation step|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see the breadcrumb withoutlink "Automation Runtime Internal Pr..." is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24475 @FW-24477 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that the Breadcrumbs should be started with Phase name
  |LWC - Breadcrumbs - PM - To verify that the Breadcrumbs should be started with Phase name|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see the breadcrumb link "Planiing" is displayed
    Then I see the breadcrumb withoutlink "Automation Runtime Internal Pr..." is displayed


    Examples:
      | Users |
      | PM    |
      | Admin |

  @FW-24480 @US-FW-24367
  Scenario Outline:LWC - Breadcrumbs - PM - To verify that the current page should be display as last Breadcrumb
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see the breadcrumb withoutlink "Automation Runtime Internal Pr..." is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24481 @FW-24482 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that only 3 breadcrumbs should be display on a record page
  |LWC - Breadcrumbs - PM - To verify that only 3 breadcrumbs should be display on a record page|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    And I pause execution for "3" seconds
    And I click on hyperlink containing value "GMS Administrator"
    Then I see the breadcrumb link "Automation Runtime Internal Pr..." is displayed
    And I pause execution for "3" seconds
    Then I see the breadcrumb withoutlink "GMS Administrator" is displayed
    And I pause execution for "3" seconds
    Then I see the breadcrumb link "Test Automation Organization" is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24499 @FW-30052 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - PM - To verify that user should be able to view updated breadcrumb labels dynamically based on the selected record context.
  |LWC - Breadcrumbs - PM - Forms- To verify that user should be able to enable Breadcrumbs record layout.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    And I pause execution for "3" seconds
    And I click on hyperlink containing value "GMS Administrator"
    Then I see the breadcrumb link "Automation Runtime Internal Pr..." is displayed
    And I pause execution for "3" seconds
    Then I see the breadcrumb withoutlink "GMS Administrator" is displayed
    And I pause execution for "3" seconds
    Then I see the breadcrumb link "Test Automation Organization" is displayed

    Examples:
      | Users |
      | PM    |

  @FW-24483 @FW-24484 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that If more than three breadcrumbs are present, the system should display the current breadcrumb and the two preceding breadcrumbs and left side should display 3 dots as truncated
  |LWC - Breadcrumbs - PM - To verify that If more than three breadcrumbs are present, the system should display the current breadcrumb and the two preceding breadcrumbs and left side should display 3 dots as truncated|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    And I pause execution for "3" seconds
    And I click on hyperlink containing value "GMS Administrator"
    Then I see the breadcrumb link "Show more breadcrumbs" is displayed
    And I click on hyperlink containing value "Show more breadcrumbs"
    Then I do not see the breadcrumb link "..." is displayed

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @FW-24485 @FW-24486 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that when user clicks on left three dots then breadcrumbs should be expanded
  |LWC - Breadcrumbs - PM - To verify that when user clicks on left three dots then breadcrumbs should be expanded|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    And I click on hyperlink containing value "GMS Administrator"
    And I click on hyperlink containing value "..."
    Then I do not see the breadcrumb link "..." is displayed
    And I pause execution for "3" seconds
    Then I see the breadcrumb link "Planning" is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24489 @FW-24490 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that user should be able to see consistent breadcrumb behavior across all record pages
  |LWC - Breadcrumbs - PM - To verify that user should be able to see consistent breadcrumb behavior across all record pages|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see the breadcrumb withoutlink "Automation Runtime Internal Pr..." is displayed
    And I click on hyperlink containing value "Test Automation Organization"
    Then I see the breadcrumb withoutlink "Test Automation Organization" is displayed
    Then I see the breadcrumb link "Automation Runtime Internal Pr..." is displayed
    And I click on hyperlink containing value "GMS Administrator"
    Then I see the breadcrumb withoutlink "GMS Administrator" is displayed
    Then I see the breadcrumb link "Test Automation Organization" is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24491 @FW-24499 @US-FW-24367
  Scenario Outline: LWC - Breadcrumbs - Admin - To verify that user should be able to view updated breadcrumb labels dynamically based on the selected record context.
  |LWC - Breadcrumbs - PM - To verify that user should be able to view updated breadcrumb labels dynamically based on the selected record context.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I see the breadcrumb withoutlink "Automation Runtime Internal Pr..." is displayed
    And I click on hyperlink containing value "Test Automation Organization"
    Then I see the breadcrumb withoutlink "Test Automation Organization" is displayed
    And I click on hyperlink containing value "GMS Administrator"
    Then I see the breadcrumb withoutlink "GMS Administrator" is displayed
    And I click on hyperlink containing value "Automation Runtime Internal Pr..."
    And I click on "Edit" in the page details
    And I enter value "Updated Breadcrumb" into field "ProgramName__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I see the breadcrumb withoutlink "Updated Breadcrumb" is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24446 @FW-24448 @US-FW-24367
  Scenario Outline:LWC - Breadcrumbs - Admin - To verify that the breadcrumbs should be hidden on layout if hide breadcrumbs is enabled in flexi page
  |LWC - Breadcrumbs - PM - To verify that the breadcrumbs should be hidden on layout if hide breadcrumbs is enabled in flexi page|
    Given I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus AreaBreadcrumb" into field "Title__c"
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I do not see the breadcrumb withoutlink "Automation Runtime Focus AreaB..." is displayed

    Examples:
      | Users |
      | Admin |
      | PM    |

  @FW-24458
  Scenario: LWC - Breadcrumbs - Admin - To verify that the on hovering the previous step in breadcrumbs then text should be highlighted with underlined bold text
    Given I login to "As a Grantor" app as "Admin" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus AreaBreadcrumb" into field "Title__c"
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I do not see the breadcrumb withoutlink "Automation Runtime Focus AreaB..." is displayed

  @FW-24463 @FW-24464
  Scenario: LWC - Breadcrumbs - Admin - To verify that the field value should be display in the breadcrumbs path which is added in Field to Display in Breadcrumbs in flexi page
  |LWC - Breadcrumbs - PM - To verify that the on hovering the previous step in breadcrumbs then text should be highlighted with underlined bold text|
    Given I login to "As a Grantor" app as "Admin" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus AreaBreadcrumb" into field "Title__c"
    When I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Then I do not see the breadcrumb withoutlink "Automation Runtime Focus AreaB..." is displayed

  @FW-24486
  Scenario Outline: LWC - Breadcrumbs - PM - To Verify Navigation from Left Downward Arrow Menu
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    And I pause execution for "3" seconds
    And I click on hyperlink containing value "GMS Administrator"
    Then I see the breadcrumb link "Show more breadcrumbs" is displayed

    Examples:
      | Users |
      | PM    |

  @FW-30053
  Scenario Outline: LWC - Breadcrumbs - PM - To verify that If more than 3 breadcrumbs are present, the system should display the current breadcrumb and the 2 preceding breadcrumbs and left side should display under downward arrow button
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "Test Automation Organization"
    And I pause execution for "3" seconds
    And I click on hyperlink containing value "GMS Administrator"
    Then I see the breadcrumb link "Show more breadcrumbs" is displayed
    And I click on hyperlink containing value "Show more breadcrumbs"
    Then I see the breadcrumb link "Planning" is displayed
    Examples:
      | Users |
      | PM    |