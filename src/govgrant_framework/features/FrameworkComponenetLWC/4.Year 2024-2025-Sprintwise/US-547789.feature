@Sprint-2025 @US-547789
Feature:GovSBIR - Grid - Support to hide parent table action on the basis of child table value.
Business Need: - GovSBIR - Grid - Support to hide parent table action on the basis of child table value.

  @548518 @NumberField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                               | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:NumberOfPersonnelPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},NumberOfPersonnel__c  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Number Of Personnel |
      | {SavedValue:EXE Username} | 9                   |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_1 @PercentageField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                        | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:PercentagePageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},Percentage__c  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Percentage |
      | {SavedValue:EXE Username} | 90         |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_2 @CurrencyField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                        | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:BaseSalaryPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN}                | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | BaseSalary |
      | {SavedValue:EXE Username} | 345        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_3 @EmailField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:ContactEmailPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},ContactEmail__c  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Contact Email   |
      | {SavedValue:PM Username} | vrush@gmail.com |
    And I pause execution for "3" seconds
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_4 @URLField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                 | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:URLPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},URL__c  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_5 @CheckboxField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:IsKeyContactPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},IsKeyContact__c  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_6 @LookupField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                    | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:LookupPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN}            | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_7 @PhoneNumberField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                         | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:PhoneNumberPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number |
      | {SavedValue:PM Username} | 9876543210   |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548518_8 @MultipicklistField
  Scenario:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                               | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:MultiSelectPageLayoutAction       | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},Test_Multipicklist__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Test Multipicklist |
      | {SavedValue:PM Username} | Step1              |
    And I pause execution for "3" seconds
    And I refresh the page
    Then I softly do not see "Test Button" button is displayed

  @548518_9 @548519 @TextField
  Scenario Outline:LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
  |LWC : Page Layout Hide action : PM : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                             | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:TextPageLayoutAction            | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},OtherProjectRole__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Other Project Role |
      | {SavedValue:PM Username} | Test Data          |
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User  |
      | PM    |
      | ADMIN |

  @548522 @548529
  Scenario Outline: LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child record as E-Table/E-Grid
  |LWC : Page Layout Hide action : PM : To verify that the user should be able to hide page layout action on the basis of child record as E-Table/E-Grid|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                               | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:NumberOfPersonnelPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},NumberOfPersonnel__c  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Number Of Personnel |
      | {SavedValue:EXE Username} | 9                   |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User  |
      | PM    |
      | ADMIN |

  @548532 @548533 @548553 @548554
  Scenario Outline: LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child record value in case multiple hide expression jsons
  |LWC : Page Layout Hide action : PM : To verify that the user should be able to hide page layout action on the basis of child record value in case multiple hide expression jsons|
  |LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json as "Field" is left operand|
  |LWC : Page Layout Hide action : PM : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json as "Field" is left operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                         | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:MultipleExpressionsPageLayoutAction         | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c,IsKeyContact__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Is Key Contact |
      | {SavedValue:EXE Username} | 9876543210   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User  |
      | PM    |
      | ADMIN |

  @548556 @548557 @548586 @548587
  Scenario Outline: LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json with all operators
  |LWC : Page Layout Hide action : PM : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json with all operators|
  |LWC : Page Layout Hide action : Admin : To verify that the page layout action should not be visible if hide expression meets the condition|
  |LWC : Page Layout Hide action : PM : To verify that the page layout action should not be visible if hide expression meets the condition|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:AllOperatorsPageLayoutAction | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c  | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Is Key Contact |
      | {SavedValue:EXE Username} | 9876543210   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User  |
      | PM    |
      | ADMIN |

  @548581 @548583 @548662 @548663
  Scenario Outline: LWC : Page Layout Hide action : Admin : To verify that the page layout action should be visible if hide expression does not meets the condition
  |LWC : Page Layout Hide action : PM : To verify that the page layout action should be visible if hide expression does not meets the condition|
  |LWC : Page Layout Hide action : Admin : To verify that the page layout action should be hide/unhide dynamically if the child record value is updated|
  |LWC : Page Layout Hide action : PM : To verify that the page layout action should be hide/unhide dynamically if the child record value is updated|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                         | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:MultipleExpressionsPageLayoutAction         | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c,IsKeyContact__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Is Key Contact |
      | {SavedValue:EXE Username} | 9876543210   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed
    And I click on "menu" button inside page details in lwc
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Phone Number | Is Key Contact |
      | {SavedValue:EXE Username} | 9876543216   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    And I click on "menu" button inside page details in lwc
    Then I softly see "Test Button" button is displayed

    Examples:
      | User  |
      | PM    |
      | ADMIN |

  @548665 @548666
  Scenario Outline: LWC : Page Layout Hide action : Admin : To verify that the page layout action should be visible if no any child record present in table
  |LWC : Page Layout Hide action : PM : To verify that the page layout action should be visible if no any child record present in table|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "menu" button inside page details in lwc
    Then I softly see "Test Button" button is displayed
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | User  |
      | PM    |
      | ADMIN |

  @549421 @549429
  Scenario Outline: LWC : Page Layout Hide action : Admin : To verify that the page layout action should be hide/unhide in case of inverse
  |LWC : Page Layout Hide action : PM : To verify that the page layout action should be hide/unhide in case of inverse|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                          | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:NumberOfPersonnelPageLayoutActionInverseTrue | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},NumberOfPersonnel__c             | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Number Of Personnel |
      | {SavedValue:EXE Username} | 9                   |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

    Examples:
      | User  |
      | PM    |
      | ADMIN |

  @548488 @548531 @CurrencyField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json
  |LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child record as E-Table/E-Grid|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:BaseSalaryPageLayoutAction   | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | BaseSalary__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary |
      | {SavedValue:PM Username} | 345        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520 @NumberField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                        | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                 | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:NumberOfPersonnelPageLayoutAction   | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | NumberOfPersonnel__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Number Of Personnel |
      | {SavedValue:PM Username} | 9                   |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_1 @PercentageField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:PercentagePageLayoutAction   | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | Percentage__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Percentage |
      | {SavedValue:PM Username} | 90         |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_2 @EmailField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:ContactEmailPageLayoutAction   | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | ContactEmail__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Contact Email   |
      | {SavedValue:PM Username} | vrush@gmail.com |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_3 @URLField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                   | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:URLPageLayoutAction   | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | URL__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_4 @CheckboxField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:IsKeyContactPageLayoutAction | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:SPIContactTableDFN}               | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_5 @LookupField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                    | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:LookupPageLayoutAction | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:SPIContactTableDFN}         | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_6 @PhoneNumberField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:PhoneNumberPageLayoutAction    | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | Phone_Number__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number |
      | {SavedValue:PM Username} | 9876543210   |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_7 @MultipicklistField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                  | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:MultiSelectPageLayoutAction          | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | Test_Multipicklist__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Test Multipicklistr |
      | {SavedValue:PM Username} | Step1               |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548520_7 @TextField
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object all datatype fields
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                       | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:TextPageLayoutAction               | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | OtherProjectRole__c,{SavedValue:SPIContactTableDFN} | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Other Project Role |
      | {SavedValue:PM Username} | Test Data          |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548534 @548555
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child record value in case multiple hide expression jsons
  |LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json as "Field" is left operand|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:MultipleExpressionsPageLayoutAction            | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:SPIContactTableDFN},Phone_Number__c,IsKeyContact__c | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number | Is Key Contact |
      | {SavedValue:PM Username} | 9876543210   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548558 @548588
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json with all operators
  |LWC : Page Layout Hide action : SPI : To verify that the page layout action should not be visible if hide expression meets the condition|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:AllOperatorsPageLayoutAction   | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:SPIContactTableDFN},Phone_Number__c | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number | Is Key Contact |
      | {SavedValue:PM Username} | 9876543210   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @548584 @548664
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the page layout action should be visible if hide expression does not meets the condition
  |LWC : Page Layout Hide action : SPI : To verify that the page layout action should be hide/unhide dynamically if the child record value is updated|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue               | filterId         |
      | Page Layout Action    | Is Active            | true                            | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                 | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                            | Recipient ApplicationView | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:MultipleExpressionsPageLayoutAction            | Recipient ApplicationView | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:SPIContactTableDFN},Phone_Number__c,IsKeyContact__c | AppContact                |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I select value inside table "---preApplication:-:associatePreAppContactsTableId---" is "All"
    And I pause execution for "4" seconds
    When I perform quick search for "{SavedValue:PM Username}" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number | Is Key Contact |
      | {SavedValue:PM Username} | 9876543210   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed
    And I click on "menu" button inside page details in lwc
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number | Is Key Contact |
      | {SavedValue:PM Username} | 9876543216   | Checked        |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Button" button is displayed

  @548667
  Scenario: LWC : Page Layout Hide action : SPI : To verify that the page layout action should be visible if no any child record present in table
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on "Remove" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click "OK" on modal confirmation box
    Then I softly see "Test Button" button is displayed
    Then I softly see "No Records Found" inside flex table with id "---program:-:contactsTableId---"

  @549432
  Scenario: LWC : Page Layout Hide action : PM : To verify that the page layout action should be hide/unhide in case of related child
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Page Layout Action    | Is Active            | true                         | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                             | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:RelatedChild                    | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},OtherProjectRole__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation EXE" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation EXE | Step 1  |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see "Test Button" button is displayed
